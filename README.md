# README

## Do this after git clone

```bash
# install packages
NECESSARY=(ansible)
RECOMMENDED=(ansible-lint)
sudo apt update && sudo apt install ${NECESSARY[@]} ${RECOMMENDED[@]}

# initialize ansible.cfg
# run below in the git working tree root
sed -e "s|^inventory=.*\$|inventory=$PWD/inventory.ini|" -i ./ansible.cfg

```

## Requirements
### Controller
Packages

- Debian family (via apt)
  - necessary
    - ansible
  - recommended
    - ansible-lint

### Managed nodes
- Controller should be able to log in to agent with ssh
  - Basically with `ansible` user in managed nodes
  - The user in managed nodes is able to run sudo with password
  - In order to meet the above 2 requirements, run the following commands in managed nodes:
    - `sudo useradd -U -G sudo -s /bin/bash -m "$USER"`   
      (the usergroup `sudo` may be `wheel` in some distros, e.g. Redhat)
    - `sudo passwd "$USER"`
  - The username and password should be written in inventory file
