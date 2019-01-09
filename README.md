## Rough instructions

[install brew](https://brew.sh/)

[install pip](https://pip.pypa.io/en/stable/installing/)
* `curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py`
* `sudo python get-pip.py`

make sure Mackup dir is at `~/google_drive/Mackup`

install ansible
* `sudo pip install ansible`

clone [devenv](https://github.com/jerryliu55/devenv) to `~/.config/`

run playbook with sudo `sudo ansible-playbook main.yml --extra-vars username=$(whoami)`

## Other setup

`task init` for remote task setup

run `base16_circus`

set up opam

### Mac desktop switch

1. in `System Preferences > Keyboard > Shortcuts` set keyboard shorcuts `ctrl - 1`, `ctrl - 2`, etc.
1. in `System Preferences > Accessibility > Display check` "Reduce motion"
