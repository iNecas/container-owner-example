FROM registry.fedoraproject.org/fedora-minimal:30

ARG HOME=/home/testuser

WORKDIR $HOME

RUN groupadd -r testuser -f -g 1001 && \
    useradd -u 1001 -r -g testuser -d $HOME -s /sbin/nologin \
    testuser && \
    chown -R 1001:1001 $HOME

USER 1001

VOLUME "/share"

CMD /bin/bash
