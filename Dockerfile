FROM golang

RUN cd $(go env GOPATH) && curl -sL https://taskfile.dev/install.sh | sh
RUN go install entgo.io/ent/cmd/ent@latest
RUN go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
RUN go install github.com/hairyhenderson/gomplate/v4/cmd/gomplate@latest
RUN go install go.uber.org/mock/mockgen@latest

COPY . .