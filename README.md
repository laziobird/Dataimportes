# Dataimportes
Be able to import data  from mysql to elasticsearch quickly and easily .
![原理图](https://github.com/laziobird/dataimportes/blob/master/Images/basic_logstash_pipeline.png)


## Logstash增量同步DB数据
### 背景
* 核心数据OpenAPI复用、通用查询
* 数据聚合查询性能问题
* 核心基础数据低成本开发、高可用维护
* 不足：不是实时、Logstash支持到1分钟场景
### 一、介绍
Logstash 是一个开源的数据收集引擎，它具有备实时数据传输能力。它可以统一过滤来自不同源的数据，并按照开发者的制定的规范输出到目的地。本节内容根据我们业务实际需要，介绍从 mysql 导入数据到 Elasticsearch
![原理图](https://github.com/laziobird/dataimportes/blob/master/Images/basic_logstash_pipeline.png)
### 二、安装
Logstash:官网下载地址
1、Docker Elasticsearch 安装、启动
```
下载镜像
docker pull docker.elastic.co/elasticsearch/elasticsearch:6.6.2
-d 后台启动elasticsearch
docker run -d -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" --name elasticsearch -v ~/elastic_data:/usr/share/elasticsearch/data docker.elastic.co/elasticsearch/elasticsearch:6.6.2
```
2、Docker Logstash 安装、启动
```
logstash 下载镜像
docker pull docker.elastic.co/logstash/logstash:6.6.2
-d 后台启动
docker build  -t datasearch:v1  .  
运行Dockerfile --link 关联elasticsearch
docker run  -d -v ~/logstash_data:/usr/share/logstash/logstashconf/run_metadata/ -p 5043:5043 --link elasticsearch  --link mysql -it --name logstash-demo  datasearch:v1
```

### 三、使用
在生产环境中，Logstash可以需要配置多个输入、过滤器和输出插件。
通常采用配置文件的方法进行配置管理:

根据不同业务需求配置对接的 输入、过滤器和输出。
### 四、Mysql导入ES配置
#### 输入插件
输入插件允许一个特定的事件源可以读取到 Logstash 管道中，配置在 input {} 中，且可以设置多个。
1. 下载mysql驱动包
由于是从mysql导入数据，这里先下载java连接mysql的驱动包，具体版本通过mysql版本确定。
这里下载 mysql-connector-java-XXX.jar 放置到logstash\mysql 目录
1. 配置文件编辑
新建配置文件 jdbc.conf 并编辑，名称可以自定义:

#### 输出插件
输出插件将事件数据发送到特定的目的地，配置在 output {} 中，且可以设置多个。
1. 编辑配置文件
还是上面那个配置文件 jdbc.conf，增加输出项：

执行导入
在logstash目录下执行命令，完成数据的导入：

### 五、增量更新
如果需要进行增量更新，就需要对SQL进行一些修改。
基于时间的增量更新
1. 首先要在数据库字段里增加记录修改日期时间的字段。
1. 修改sql：
:sql_last_value 为上一次更新的最后时刻。
更新的前提是必须满足: cc.modifydate > :sql_last_value 。即如果mysql的时间修改为小于sql_last_value的时刻值，是无法进行同步的。
注意:如果你的语句比较复杂，cc.modifydate > :sql_last_value 一定要写在WHERE后面，然后接AND即可。
1. 我们的基于时间更新自定义脚本
默认 sql_last_value 记录的是上一次执行的最后时刻，我们只需要在sql中指定 cc.modifydate > :sql_last_value 就应该可以达成效果，但我这边测试还是每次都全部导入一遍，后来只能采用自定义字段的方式来进行操作。\
自定义字段原理解析：
在配置文件中有 use_column_value 字段，决定是否需要记录某个column 的值,如果不配置此项的话，默认 track 的是 timestamp 的值。也就是说 :sql_last_value 记录的是上一次执行的最后时刻。
如果 use_column_value 字段设置为 true， 并且record_last_run 为真,我们就可以自定义我们需要 track 的 column 名称了。

基于其他字段增量更新
同步更新除了支持根据时间同步外，还支持根据某自增列(如：自增ID)字段的变化进行同步。
示例内容如下:
```
input {
  jdbc {
    use_column_value => true
    # 指定记录执行的最后一个id字段的值
    tracking_column => id
    statement => "SELECT * from cc where cc.id >= :sql_last_value"
  }
}

output {
}
```

### 六、参考资料

* https://www.elastic.co/guide/en/logstash/7.2/plugins-inputs-jdbc.html
* https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html
* https://www.elastic.co/guide/en/logstash/6.6/docker.html

### 七、Mysql Docker安装
```
* docker pull mysql:5.5.62
* docker run -itd --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root mysql:5.5.62 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
* create database logstash
mysql -h localhost -uroot -p
```

### Logstash 管道Demo
```
- pipeline.id: tab_staff_info

  path.config: "/usr/share/logstash/logstashconf/pipeline/tab_staff_info.conf"

- pipeline.id: tab_staff_education

  path.config: "/usr/share/logstash/logstashconf/pipeline/tab_staff_education.conf"

- pipeline.id: tab_staffinfo_stafflocation

  path.config: "/usr/share/logstash/logstashconf/pipeline/tab_staffinfo_stafflocation.conf"

```
#### input、output插件Demo配置
```
input{
  	jdbc{
		id => "tab_staff_education"
		jdbc_driver_library => "/usr/share/logstash/logstashconf/mysql5/mysql-connector-java-5.1.47.jar"
		jdbc_driver_class => "com.mysql.jdbc.Driver"
		jdbc_connection_string => "jdbc:mysql://127.0.0.1:3306/logstash"
		jdbc_user => "root"
		jdbc_password => "root"
		schedule => "* * * * *"
		clean_run => false
		use_column_value => true
		tracking_column => last_update
		tracking_column_type => timestamp
		record_last_run => true
		last_run_metadata_path => "/usr/share/logstash/logstashconf/run_metadata/tab_staff_education.track"
		statement => "SELECT id,companyId,major,last_update FROM tab_staff_education WHERE last_update > :sql_last_value"
  	}

}


filter {
	json {
    		source => "message"
        }
}

output {
	elasticsearch {
		hosts => ["elasticsearch:9200"]
		index => "tab_staff_education"
		document_id => "%{id}"
		template_overwrite => true
	}
}

```

