### Docker

docker 大部分操作需要在root权限下运行

```bash
➜ ~ uname -a
Linux z 4.18.0-17-generic #18-Ubuntu SMP Wed Mar 13 14:34:40 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
```

```bash
➜  ~ ls -l /sys/class/misc/device-mapper
lrwxrwxrwx 1 root root 0 5月   1  2019 /sys/class/misc/device-mapper -> ../../devices/virtual/misc/device-mapper
```

```python
import re
str1 = 34
print(str1)
```

### 容器的基本操作

```bash
systemctl start docker #开启docker服务
systemctl enable docker # 设置开机启动
sudo docker version # 版本信息
sudo docker info # 查看有多少容器信息
systemctl restart docker # 重启docker
systemctl stop docker # 关闭docker
sudo docker run hello-world # 输入hello world 查看docker是否可以使用
```

```bash
 Containers: 4  # 容器数
 Running: 0  # 正在运行
 Paused: 0  # 
 Stopped: 4 # 停止
 Images: 1 # 镜像数
```

```bash
sudo docker search centos #查看docker hub 上有多少个centos镜像，其中official是官方的镜像
docker images #查看自己有多少源
```

### docker国内源

docker 官方中国

https://registry.docker-cn.com

网易

https://hub-mirror.c.163.com

ustc

https://docker.mirrors.ustc.edu.

### 换源

vim /etc/docker/dameon.json

```bash
sudo systemctl daemon-reload # 重启生效源
```

### 下载其他网站的源

```bash
docker pull hub.c.163.com/library/tomact:latest
```

### 清除镜像

```bash
docker stop $(docker ps -a -q)   #停止所有镜像
docker rm $(docker pa --all -q -f status=exited) # 删除停止容器
docker rmi 'docker images -q' #删除所有镜像
```

### 开启网络转发功能

```bash
vim /etc/sysctl.conf 
#net.ipv4.ip_forward=1 默认是注释的，手动添加的话需要开启
sysctl -p # 生效
#查看是否生效
cat /proc/sys/net/ipv4/ip_forward 返回 1
```

### 防火墙状态

```bash
systemctl status firwalld 查看状态
systemctl stop firwalld 关闭
```

### 给用户权限

```bash
sudo groupadd docker
sudo gpasswd -a ${USER} docker            
sudo service docker restart        
reboot 重启                                 
```
