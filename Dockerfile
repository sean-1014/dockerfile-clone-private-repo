# syntax=docker/dockerfile:1.2

FROM alpine:3.14.2 
USER root
RUN apk update && \
    apk add --no-cache openssh-client && \
    apk add --no-cache git && \
    mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN --mount=type=ssh git clone git@github.com:sean-1014/private_repo.git
CMD ["cat","private_repo/README.md"]
