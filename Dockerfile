# Comment
FROM alpine:latest

MAINTAINER nlou <nlou.mail@gmail.com>

ENV SUMMARY="Official Alpine Docker image for educational purposes." \
    DESCRIPTION="Alpine is based on musl, libcand busybox."


LABEL name="https://github.com/nlouloo/alpimage" \
      maintainer="nlou.mail@gmail.com" \
      summary="${SUMMARY}" \
      description="${DESCRIPTION}" \

      url="https://github.com/nlouloo/alpimage" \
      io.k8s.description="${DESCRIPTION}" \
      io.k8s.display-name="${SUMMARY}" \
      io.openshift.expose-services="" \
      io.openshift.tags="alpine"


ENV APP_ROOT=/opt/app-root
ENV PATH=/usr/local/bin:${APP_ROOT}/.local/bin:${PATH} HOME=${APP_ROOT}
COPY bin/ /usr/local/bin/
RUN mkdir -p ${APP_ROOT} && \
    chmod -R u+x /usr/local/bin && \
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT} /etc/passwd


USER 1000990000
WORKDIR ${APP_ROOT}


ENTRYPOINT [ "uid_entrypoint" ]

CMD run
