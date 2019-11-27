# openvpn-client

Openvpn client with dnsmasq running. Use case is allowing another container to use "--net:container:openvpn-client" and be connected to VPN with proper DNS

# Configuration

1. Get .env file

```
cp .env.example .env
```

Provided example will work

2. Get a Openvpn client certificate and place it as:

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
ping host1.example.com
```


