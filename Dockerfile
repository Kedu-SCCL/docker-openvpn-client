FROM alpine:3.10.3

LABEL maintainer "info@kedu.coop"

RUN apk --no-cache add dnsmasq openvpn iptables

COPY entrypoint.sh /

#ENTRYPOINT ["dnsmasq", "-k"]
CMD ./entrypoint.sh
