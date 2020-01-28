# dockerfile基本使用

vim Dockerfile

FROM nginx  指定基础镜像

FROM scratch 如果你以scratch为基础镜像,意味着你不以任何镜像为基础,接下来所写的指令将作为镜像第一层存在

RUN echo'<h1>hello docker!</h1>' > /usr/share/nginx/html/index.html

每一个RUN可以对应一个命令

RUN make -C /usr/src/redis

也可以,一个RUN对应多条命令 // 如果这样,docker 就是两层,运行快一点

RUN buildDEps = 'gcc libc6-dex make'\

​		&& apt-get update\

​		&& apt-get install -y $buiildDeps\

docker build -t mynginx:v1 .

输出

```sh
Sending build context to Docker daemon  2.048kB
Step 1/2 : FROM nginx
 ---> 27a188018e18
Step 2/2 : RUN echo '<h1>hello docker!</h1>' > /usr/share/nginx/html/index.html
 ---> Running in a3c10337199b
Removing intermediate container a3c10337199b
 ---> 887943a07008
Successfully built 887943a07008
Successfully tagged mynginx:v1
```

查看是否有nginx

docker images

docker ps -a

45dec2710610        mynginx:v1          "nginx -g 'daemon of…"   33 seconds ago      Up 32 seconds               0.0.0.0:8080->80/tcp   zealous_sammet

0.0.0.0:8080这个地址可以在浏览器上访问到

### cpoy 复制文件

COPY [--chown=<user>:group]<源路径(宿主机路径)> ... <目标路径(容器内路径)><源路径>可以是多个,甚至可以是通配符,其统配规则要满足Go的filepath.Match规则,如 COPY home /mydir/  COPY home?.txt/mydir/

### ADD更高级的复制文件



### CMD 容器启动命令

```shell
shell$ CMD <命令>
				CMD ["可执行文件","参数1","参数2",...]
```

