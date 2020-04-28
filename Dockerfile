FROM golang:1.13-alpine as builder

ENV CGO_ENABLED=0
ENV GOOS=linux
# ENV GOARCH=amd64
WORKDIR /go/src/github.com/kubernetes-sigs/bootkube
COPY . .
RUN go build -i -o checkpoint github.com/kubernetes-sigs/bootkube/cmd/checkpoint

FROM alpine

RUN apk add --no-cache ca-certificates
COPY --from=builder /go/src/github.com/kubernetes-sigs/bootkube/checkpoint /checkpoint

