# README

## Do this after git clone

```bash
# install packages
NECESSARY=(ansible)
RECOMMENDED=(ansible-lint)
sudo apt update && sudo apt install ${NECESSARY[@]} ${RECOMMENDED[@]}

# initialize ansible.cfg
# run below in the git working tree root
sed -e "s|^inventory=.*\$|inventory=$PWD|" -i ./ansible.cfg

```

## Required packages
- Debian family (via apt)
  - necessary
    - ansible
  - recommended
    - ansible-lint
