#!/bin/sh

dnsmasq&
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start dnsmasq: $status"
  exit $status
fi

openvpn /etc/openvpn/cert.conf
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start openvpn client: $status"
  exit $status
fi


