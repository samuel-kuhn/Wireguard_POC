# Wireguard POC

## Configuration

This repository was developed and tested with the following setup:

Two **Ubuntu 24.04.3 LTS** virtual machines were created in VirtualBox Version 7.2.2. 

Both virtual machines were set to use the `Bridged Adapter`.

### Network Configuration
As of now the network configuration is hardcoded in [client.conf](client.conf) and [server.conf](server.conf).

Consider the following variables before starting:

- `Address`: sets the IPv4 and IPv6 address in both the client and server config
- `ListenPort`: sets the Port the server will listen for wireguard connections
- Network interface in `PostUp` and `PostDown`: sets the interface to be used in the `UP` and `DOWN` command for the server
- `Endpoint`: sets the endpoint for the client which includes also the `ListenPort` from the server

The current values:
- `Address` (Server): `10.0.0.1/24, fd42:42:42::1/64`  
- `Address` (Client): `10.0.0.2/24, fd42:42:42::2/64`
- `ListenPort`: `51820`
- Network interface in `PostUp` and `PostDown`: `enp0s3`
- `Endpoint`: `SERVER_PUBLIC_IP:51820`

## Quick start

Copy the repository to the `/root` folder and execute the scripts [client.sh](client.sh) and [server.sh](server.sh) as `root` on either of the machines.

Both installations should be run at the same time to view and enter the machines public keys in the terminal prompt.

<img width="2559" height="695" alt="image" src="https://github.com/user-attachments/assets/52efbad2-4f19-4ae1-878b-39be305e2824" />
