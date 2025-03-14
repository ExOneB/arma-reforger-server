#!/bin/bash
cd "$(dirname "$0")"
INSTALL_DIR=$(pwd)

/usr/games/steamcmd +force_install_dir "$INSTALL_DIR" +login anonymous +app_update 1874900 validate +quit
