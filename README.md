# vagrant-nextcloud
This repo contains all the Vagrant config to get an Ubuntu 18.04 VM with the latest version of Nextcloud installed.

# Setup

`vagrant up` will install everything

Go to [http://localhost:8080/nextcloud](http://localhost:8080/nextcloud) and access Nextcloud with credentials `admin / admin`

# Information

- `VagrantFile` contains instructions to run an inline script: `install.sh`
- `install.sh` does the following
    - Clones https://github.com/nextcloud/vm
    - Runs `yes no | sudo bash nextcloud_install_production.sh` which uses the default values for each prompt

