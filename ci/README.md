# DevOps Repository

This repo contains all the scripts and information to spin up
the project for Continuous Delivery.

## Hosting

We use [CloudAfrica](https://www.cloudafrica.net/) as the primary
hosting provider. Credentials for logging into the account can be found in the team's KeePass vault.

## Continuous Integration Server

[DroneIO](https://github.com/drone/drone) is the preferred CI server.
Host it on a CloudAfrica server with the following ports open: _22_, _80_,
_2376_, _8000_. CloudAfrica has a firewall configured from its [web interface](https://www.cloudafrica.net/firewall).

### Requirements
You will need:
 + [docker](https://www.docker.com/products/docker)
 + [Drone CLI](http://readme.drone.io/0.5/install/cli/) setup on your machine

### Quickstart

Provision the server with the options above and execute the following.
If successful, the DroneCI instance will be available at _http://[IP_ADDRESS]_.

```
./bootstrap.sh [IP_ADDRESS] [SSH_KEY] [MACHINE_NAME]
```

+ **IP ADDRESS**: the IP address of the provisioned machine.
+ **SSH_KEY**: path to the private key to connect to the server with.
+ **MACHINE_NAME**: a machine name for `docker-machine` to identify the server.

## Secrets

Secrets are held in _env.sh_ and encrypted via [git-crypt](https://www.agwa.name/projects/git-crypt/).
The key to unlock this repo is held in the team vault, along with the default SSH private key (the one loaded on CloudAfrica).

Secrets for DroneCI are also stored in env.sh

## GitHub Integration

Remember to update the callback URL for OAuth Applications in GitHub organisation's
[settings](https://github.com/organizations/the-mast/settings/applications/476918).
