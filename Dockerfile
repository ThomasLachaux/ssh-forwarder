FROM alpine


RUN apk update
RUN apk add openssh-server

RUN ssh-keygen -A

RUN adduser -D ssh
COPY passwd /tmp
RUN chpasswd < /tmp/passwd && rm /tmp/passwd

COPY sshd_config /etc/ssh
COPY welcome.txt /tmp

CMD /usr/sbin/sshd -D -e -f /etc/ssh/sshd_config
