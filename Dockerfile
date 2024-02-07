FROM golang:1.22.0-alpine

RUN apk add git --no-cache
RUN go install github.com/go-task/task/v3/cmd/task@latest
RUN go install entgo.io/ent/cmd/ent@6631ed7172f9bd615c4812cb8508dc9bc8716112

RUN wget -O- -nv https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s v1.55.2

COPY --from=vektra/mockery:v2 /usr/local/bin/mockery /bin/mockery

COPY --from=hairyhenderson/gomplate:stable /gomplate /bin/gomplate

COPY . .

USER 65532:65532