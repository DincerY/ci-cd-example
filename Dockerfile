# Go image kullan
FROM golang:1.24.2 AS builder

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . ./

RUN go build -o myapp

FROM debian:bullseye-slim
WORKDIR /root/
COPY --from=builder /app/myapp .
CMD ["./myapp"]
