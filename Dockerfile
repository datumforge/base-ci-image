FROM golang:1.22.1-alpine

RUN apk add git --no-cache  && apk cache clean
RUN go install github.com/go-task/task/v3/cmd/task@latest
RUN go install entgo.io/ent/cmd/ent@latest

RUN wget -O- -nv https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s v1.55.2

COPY --from=vektra/mockery:v2 /usr/local/bin/mockery /bin/mockery

COPY --from=hairyhenderson/gomplate:stable /gomplate /bin/gomplate

COPY . .