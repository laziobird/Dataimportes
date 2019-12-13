FROM docker.elastic.co/logstash/logstash:6.6.2
MAINTAINER Tim Jiang<jzw_1985@163.com>



WORKDIR /usr/share/logstash

##mysql drive
ADD pipelines.yml config/pipelines.yml
RUN mkdir -p logstashconf
RUN mkdir -p logstashconf/run_metadata
ADD pipeline logstashconf/pipeline
ADD mysql logstashconf/mysql5



EXPOSE 5043

##demo
##CMD bin/logstash -f logstashconf/pipeline
CMD bin/logstash 


