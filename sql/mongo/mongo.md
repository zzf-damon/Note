# mongo

## 安装 卸载

sudo apt-get install mongodb

```
sudo apt-get --purge remove mongodb mongodb-clients mongodb-server
```

## 开启关闭

```bro
server mongodb start
server mongodb stop
```

## 相关操作

```plsql
数据库相关 
show dbs:显示数据库列表 
show collections：显示当前数据库中的集合（类似关系数据库中的表table） 
show users：显示所有用户 
use yourDB：切换当前数据库至yourDB 
db.help() ：显示数据库操作命令 
db.yourCollection.help() ：显示集合操作命令，yourCollection是集合名 
```

## 指定端口

```bash
mongod --port 21345 # 默认是27017不要超过65535
```

###### 在mongo中数据库和集合都不需要手动创建，database中放 collection 中放document文档，当创建文档时，如果，数据库和集合没有，会自动创建。

#### db 当前数据库

## CRUD 操作

### 插入

```
db.<collection>.insert(doc) # collection 是一个集合的名字
db.stus.insert({name:"孙悟空",age:18,gender:"man"})
WriteResult({ "nInserted" : 1 }) 正确返回的结果
```

### 查询

查询集合中的所有文档

```plsql
db.<collections>.find()
```
