FROM golang:1.7.3

ADD . /go/src/github.com/lucasvmiguel/web-api-go

RUN go build -o bin/app src/github.com/lucasvmiguel/web-api-go/main.go

# copy config
# RUN cp src/stash.b2w/alpha/foundation/services/mystique/cmd/config.toml .

CMD ["/go/bin/app"]

EXPOSE 8080