## 简介

### 服务

一个应用容器,实际上可以运行多个相同镜像的实例

### 项目

 由一组关联的应用容器组成的一个完整业务单元

可以一个项目可以由多个服务关联而成,compose面向项目进行管理

docker-compose -help 查看命令

-f your.yml up

-p project.name

--x-networling 使用docker的可拔插网络后端特性

--verbose 输出更多调试信息

-v 版本

build 

格式为 docker-compose build [options] [SERVICE]

构建(重新构建)项目中的服务容器

服务容器一旦构建之后,将会带上一个标记名.例如对于web项目中的一个db容器

可能是web_db

可以随时在项目目录下运行docker-compose build来构建新的服务

选项包括:
