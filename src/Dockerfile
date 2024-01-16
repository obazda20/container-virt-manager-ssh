FROM alpine:latest
RUN apk add --no-cache virt-manager openssh-server openrc procps util-linux dbus ttf-freefont xauth openssh
RUN sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/g' /etc/ssh/sshd_config
RUN sed -i 's/X11Forwarding no/X11Forwarding yes/g' /etc/ssh/sshd_config
RUN adduser --disabled-password --shell /bin/sh virt-manager
RUN sed -i 's/virt-manager:!/virt-manager:$6$BNJm6Xj2owb11UUR$s.EL0iAPVI9iJbCRwxaPNzikUyhEuM4H\/QI.uPSvGPMcIoFC.6E1YibaimZ9Mqn9Tn6s3kjgkH4ooKONHDou\/0/g' /etc/shadow
RUN mkdir /home/virt-manager/.ssh
COPY config /home/virt-manager/.ssh/config
RUN chown -R virt-manager /home/virt-manager/.ssh
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN ssh-keygen -A
RUN rc-status \
    && mkdir -p /run/openrc \
    && touch /run/openrc/softlevel \
    && rc-service sshd start

ENTRYPOINT ["sh","/entrypoint.sh"]
#CMD ["entrypoint.sh"]
#CMD ["ls","-lsa"]
