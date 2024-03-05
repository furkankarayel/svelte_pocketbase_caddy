FROM alpine:latest

RUN apk add --no-cache  \
    bash \
    unzip \
    ca-certificates

ARG PB_VERSION=0.12.0
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb
RUN mkdir /pb/pb_data

EXPOSE 8090

CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8090"]