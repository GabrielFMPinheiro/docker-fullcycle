FROM golang:1.21rc2-alpine as builder

WORKDIR /go/src/

RUN touch challenge-golang.go

RUN echo 'package main' >> challenge-golang.go \
    && echo 'import "fmt"' >> challenge-golang.go \
    && echo 'func main() {' >> challenge-golang.go \
    && echo '    fmt.Println("Full Cycle Rocks!!")' >> challenge-golang.go \
    && echo '}' >> challenge-golang.go

RUN go build challenge-golang.go

FROM scratch

COPY --from=builder /go/src/challenge-golang /challenge-golang

ENTRYPOINT ["/challenge-golang"]