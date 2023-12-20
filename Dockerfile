FROM golang:1.21.5-alpine

RUN cd $(go env GOPATH) && curl -sL https://taskfile.dev/install.sh | sh
RUN go install entgo.io/ent/cmd/ent@latest
RUN go install go.uber.org/mock/mockgen@latest

RUN wget -O- -nv https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s v1.55.2

COPY --from=hairyhenderson/gomplate:stable /gomplate /bin/gomplate

COPY . .