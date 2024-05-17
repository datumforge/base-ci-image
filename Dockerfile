FROM golang:1.22.3-alpine

RUN apk add git npm --no-cache  && apk cache clean
RUN go install github.com/go-task/task/v3/cmd/task@latest
RUN go install entgo.io/ent/cmd/ent@latest
RUN npm install jsonschema2mk --global

RUN wget -O- -nv https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s v1.58.1

COPY --from=vektra/mockery:v2 /usr/local/bin/mockery /bin/mockery

COPY --from=hairyhenderson/gomplate:stable /gomplate /bin/gomplate

COPY . .

