# Bachelor thesis - Univeristy of Economics in Prague - Company oriented NixOS config -

This project is using parts of code from misterio77 and fufexan (sometimes edited to fit my needs). Thank you for introduction into the world of NixOS.

## Disclaimer

This is not supposed to be used in production, it was created just for scientific purposes to let myself see how could the NixOS be used as the main and only operating system in companies from 1 to 1000+ employees. Also to introduce NixOS to myself and see where are the limits of it.

## TODO list:

There were few requirements:

- [x] Based on solely NixOS (done in 3/2024)
- [x] Support multiple computers (done in 3/2024)
- [x] Support multiple users (done in 3/204)
- [x] Support configuration for user (home-manager) (done in 9/2024)
- [x] Create pipeline that auto-upgrades devices (done in 10/2024)
- [x] Connect to LDAP/AD (done in 6/2024)
- [x] Introduce a web app to configure the end node devices (done in 12/2024)
- [x] Include VPN solution, to use intranet applications (done in 8/2024)


## Design

This repo is the first part of this project the other two can be found here and here (modules and configurator)

I choosed to separate modules from config for better maintanance. Also this way the modules can be used by multiple config projects.

Configuration is using own schema for enabling/disabling modules, which makes it possible to be used by the web configurator.


## How to setup

If you would like to setup this and try it on your own, you can :D but count with that you will have to change a lot of things. It's not plug and play.

But a quick start could be to make fork of this repo and create a edit the config for your device. Provide your secrets using sops-nix, without that it won't work.


## Questions

If you have any questions feel free to open issue here or in other repos.


## FAQ

I am not commiting often, so the history is WILD :D but I am working on this and using this project actively on all my computers and servers.