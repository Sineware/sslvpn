# Sineware SSLVPN

This is a docker compose setup that creates up a "VPN" that runs over SSL/TLS.

What this really means is that and SSH server is exposed through port 443, and encapsulated in TLS using STunnel.
This is great because when combined with **sshuttle**, you can get a VPN-like service that will go through pretty much 
any firewall, including ones that use Deep Packet Inspection (since the connection looks like a normal HTTPS connection).

The VPN is built with the following services:
* [stunnel4](https://www.stunnel.org/)
* [sslh](https://github.com/yrutschle/sslh)
* [Apache](https://httpd.apache.org/)
* [OpenSSH](https://www.openssh.com/)

Stunnel is responsible for being the TLS endpoint, and all connections to 443 in the container terminate at it. It then 
passes the decrypted connection to sslh, which forwards the connection to OpenSSH if it is an SSH connection, or to Apache if 
it's an http connection. This way, if someone were to access the container through a browser, they would be greeted with a 
normal webpage.

## Server Setup
This container uses port 80 and 443 by default. A cheap cloud provider works well to to run SSLVPN.

* Clone this repository.

```shell script
git clone https://github.com/sineware/sslvpn.git && cd sslvpn
```

* Modify `server/docker-compose.yml` to add your SSH public key to the `SSLVPN_AUTHORIZED_KEYS` environment variable.

* Start the server!
```bash
cd server
docker-compose up -d
```

Now clients with their keys added can connect using the client script, shown below.

## Client Setup (w/ sshuttle) for Linux and macOS
You'll need to install [sshuttle](https://sshuttle.readthedocs.io/en/stable/) first and openssl on your clients first.

* Edit the `client/vpn-connect.sh` script to set your server's IP and port. Then, connect to your VPN!
```bash
./client/vpn-connect.sh
```

Additionally, the routed CIDR is set to `0.0.0.0/0` by default, which forwards all traffic through the VPN. You can change this to only route specific 
prefixes if you want a split VPN use case (ex. 192.168.1.0/24 to access local machines on the remote network).
