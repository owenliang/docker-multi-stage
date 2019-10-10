ARG GOLANG_VER

# stage1 - 编译代码生成二进制
FROM golang:${GOLANG_VER} as BINARY
WORKDIR /root
COPY cmd ./project/cmd/
COPY go.sum go.mod ./project/
ENV GOPROXY=goproxy.io
RUN cd ./project/cmd && go build -o main

# stage2 - 构造运行时镜像
FROM centos:7
ARG APP_LOCATION
ENV APP_LOCATION ${APP_LOCATION}
WORKDIR /root
COPY --from=BINARY /root/project/cmd/main ${APP_LOCATION}
RUN chmod a+rwx ${APP_LOCATION}
CMD ${APP_LOCATION}