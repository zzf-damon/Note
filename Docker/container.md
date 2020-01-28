# container 操作

创建一个

```bash
docker container create
```

列出

```bash
docker container ls -a
```

开启

```bash
docker container start ID
```

删除

```bash
docker container rm ID
```

创建一个一直运行的container

```bash
docker container create busybox sh -c "while true; do sleep 3600; done"
```

创建一个指定名字的容器

```bash
docker container create --name demo busybox sh -c "while true; do sleep 3600; done"
```

直接创建并启动

```bash
docker container run -d --name demo busybox sh -c "while true; do sleep 3600; done"
```

查看所有关闭的container

```bash
docker container ls -f status=exited
```

```bash
docker container ls -f -q  查看所有的ID
```

### 通信

