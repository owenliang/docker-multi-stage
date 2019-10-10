# docker-multi-stage
基于docker的multi stage实现编译与运行容器分离

# 构建

```
docker build --build-arg GOLANG_VER=1.13 --build-arg APP_LOCATION=/go/myapp -t test .
```

# 运行

```
docker run -d test 
```

# 进入容器观察

```
docker exec -it 容器哈希值 bash
```