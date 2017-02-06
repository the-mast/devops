# DevOps Repository

This repo contains all the scripts and information to spin up 
the project for Continuous Delivery.

## Hosting

We use [CloudAfrica](https://www.cloudafrica.net/) as the primary 
hosting provider. Credentials for logging into the account can be found on the team's KeePass vault.

## Continuous Integration Server

[DroneIO](https://github.com/drone/drone) is the preferred CI server.
Host it on Cloud Africa server with the following ports open: _22_, _80_,
_2376_, _8000_.

### Quickstart

Provision the server with the options above and execute the following. If successful, the DroneCI instance will be available at _http://[IP_ADDRESS]_.

```
./bootstrap.sh [IP_ADDRESS] [SSH_KEY] [MACHINE_NAME]
```

+ **IP ADDRESS**: the IP address of the provisioned machine.
+ **SSH_KEY**: path to the private key the server is provisioned with.
+ **MACHINE_NAME**: a machine name for `docker-machine` to identify the server.


## Secrets

Secrets are held in _env.sh_ and encrypted via [git-crypt](https://www.agwa.name/projects/git-crypt/). 
The key to unlock this repo is held in the team vault, along with the default SSH key.

