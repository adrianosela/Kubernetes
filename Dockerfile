# The simplest useful image
FROM alpine:latest
RUN apk add --update bash curl && rm -rf /var/cache/apk/*
ADD simple-infinite-loop /bin/simple-infinite-loop
CMD ["/bin/simple-infinite-loop"]
