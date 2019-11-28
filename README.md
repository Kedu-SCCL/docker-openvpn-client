# openvpn-client

Openvpn client with dnsmasq running. Use case is allowing another container to use "--net:container:openvpn-client" and be connected to VPN with proper DNS.

Use case is:

* There's a private zone, which has 2 servers that we want to reach:
** A DNS server, that resolves names like "potatoe.example.com", which is running in 10.41.0.2, which is just accessible through a VPN
** secret.example.com, a server running a service. Note that we want to access the service by name, so we need to first be connected to VPN and send "*.example.com" requests to the DNS server located in 10.41.0.2
* There's a VPN server exposed to DMZ, "vpn.example.com"

Solution:

* Create a container running both DNS and VPN client
* Create a test container, connected to previous container network, which will be able to reach "secret.example.com" by name

An attempt has been made to sepparate DNS and VPN, but for this particular scenario having one container for both services is simpler.

# Configuration

1. Get .env file

```
cp .env.example .env
```

Provided example will work

2. Get an Openvpn client certificate and place it as:

```
cert.conf
```

3. Get a dnsmasq configuration file. An example has been provided:

```
cp dnsmasq.conf.example dnsmasq.conf
```

# Start

Start the environment

```
docker-compose up -d --build
```

# Test

1. Connect to "test" container, provided just as an example:

```
docker exec -ti test bash
```

2. Try to reach some host just accessible if connected to VPN by name:

```
ping secret.example.com
```


