FROM golang:1.21.5-alpine

RUN apk add git
RUN go install github.com/go-task/task/v3/cmd/task@latest
RUN go install entgo.io/ent/cmd/ent@latest
RUN go install go.uber.org/mock/mockgen@latest

RUN wget -O- -nv https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s v1.55.2

COPY --from=hairyhenderson/gomplate:stable /gomplate /bin/gomplate

COPY . .