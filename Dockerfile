#Nginx TEST Demo VERSION 1 - EDITION 1 2019-09-18 with Timezone (TZ=Asia/Shanghai)
#Author:terry2_yu terry2_yu@asus.com
#Command format:
# 指定基于的基础镜像
FROM centos

#维护者信息
MAINTAINER terry2_yu terry2_yu@asus.com

#定义时区参数
ENV TZ=Asia/Shanghai

#设置时区
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone

RUN yum install -y wget && \
    wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo && \
    yum install -y nginx && \
    echo "daemon off;" >> /etc/nginx/nginx.conf 
#   && \
#   echo '<h1>Hello! This message comes from terry2_yu 2019-09-18 with Timezone (TZ=Asia/Shanghai)!</h1>' > /usr/share/nginx/html/index.html

#暴露端口
EXPOSE 80
#容器启动时执行命令
CMD /usr/sbin/nginx