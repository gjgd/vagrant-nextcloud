# vagrant-nextcloud
This repo contains all the Vagrant config to get an Ubuntu 16.04 VM with Nextcloud 14.0 installed.

# Setup

`vagrant up` will install everything

Go to [http://localhost:8080/nextcloud](http://localhost:8080/nextcloud) and access Nextcloud with credentials `admin / admin`

# Informations

- `VagrantFile` contains instructions to run an inline script: `install.sh`
- `install.sh` does the following
    - Download required libs
    - Download Nextcloud v14.0 from Github
    - Setup Apache config using `nextcloud.conf`
    - Maria-db config using `mysql_secure.sh`
    - Nextcloud config
- The script follows the steps in the Nextcloud doc [here](https://docs.nextcloud.com/server/14/admin_manual/installation/source_installation.html#example-installation-on-ubuntu-16-04-lts-server) and [here](https://docs.nextcloud.com/server/14/admin_manual/installation/command_line_installation.html) 
