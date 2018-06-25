FROM alpine

LABEL maintainer="LeadingSoft <leadingsoft.jp@gmail.com>"

ENV KUBE_LATEST_VERSION="v1.10.5"

RUN apk add --update ca-certificates \
 && apk add --update -t deps curl jq \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl \
 && apk del --purge deps \
 && rm /var/cache/apk/*

WORKDIR /root
CMD ["/bin/sh"]
