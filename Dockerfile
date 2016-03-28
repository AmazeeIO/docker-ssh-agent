FROM alpine:3.2

ENV SOCKET_DIR /tmp/amazeeio_ssh-agent
ENV SSH_AUTH_SOCK ${SOCKET_DIR}/socket
RUN apk add --update openssh sudo && rm -rf /var/cache/apk/*
RUN adduser -D -u 3201 drupal
RUN mkdir ${SOCKET_DIR} && chown drupal ${SOCKET_DIR}
COPY run.sh /run.sh
VOLUME ${SOCKET_DIR}
ENTRYPOINT ["/run.sh"]
CMD ["ssh-agent"]
