Docker compose makefile
=======================

[![Build Status](https://travis-ci.org/krom/docker-compose-makefile.svg?branch=master)](https://travis-ci.org/krom/docker-compose-makefile)
[![Release](https://img.shields.io/github/release/krom/docker-compose-makefile.svg)](https://github.com/krom/docker-compose-makefile/releases/latest)
[![Commits since last release](https://img.shields.io/github/commits-since/krom/docker-compose-makefile/latest.svg)](https://github.com/krom/docker-compose-makefile/commits/master)
[![Github All Releases](https://img.shields.io/github/downloads/krom/docker-compose-makefile/total.svg)](https://github.com/krom/docker-compose-makefile)
[![GitHub issues](https://img.shields.io/github/issues/krom/docker-compose-makefile.svg)](https://github.com/krom/docker-compose-makefile/issues)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/krom/docker-compose-makefile.svg)](https://github.com/krom/docker-compose-makefile/pulls)
[![license](https://img.shields.io/github/license/krom/docker-compose-makefile.svg)](https://github.com/krom/docker-compose-makefile/blob/master/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/krom/docker-compose-makefile.svg?style=social&label=Stars)](https://github.com/krom/docker-compose-makefile/stargazers)

Template and lib for docker-compose

INSTALLATION
------------
Execute
```bash
curl -sL https://git.io/vh4Gn | sh
```

USAGE
-----

![Screen](https://raw.githubusercontent.com/krom/docker-compose-makefile/master/docs/screencast.gif)

**Common (see [sampess](https://github.com/krom/docker-compose-makefile/tree/master/samples))**
- **make start** - start all containers
- **make start c=hello** - start container hello
- **make stop** - stop all containers
- **make status** - show list of containers with statuses
- **make clean** - clean all data

**From this library**
- **make help** - show help (see above)
- **make mk-upgrade** - check for updates of mk-lib
- **make mk-version** - show current version of mk-lib

SAMPLES
-------

You may see sampess [here](https://github.com/krom/docker-compose-makefile/tree/master/samples)

CUSTOMIZATION
-------------
You can create _.make.env_ file in directory with Makefile or *current** directory

Available variables

* DOCKER_COMPOSE = {docker-compose executable command}
* DOCKER_COMPOSE_FILE = {custom docker-compose.yml file}

TO-DO
-----

- check dependencies
- update readme

LICENSE
-------

MIT

AUTHOR
------

Roman Kudlay (roman@kudlay.pro)
