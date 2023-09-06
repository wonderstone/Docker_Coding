# syntax=docker/dockerfile:1
FROM golang:1.21
WORKDIR /src
COPY ./hello_world/main.go .
RUN go build -o /bin/hello ./main.go

FROM scratch
COPY --from=0 /bin/hello /bin/hello
CMD ["/bin/hello"]