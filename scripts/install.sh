#!/bin/sh

# Docker compose installation script
# Execute this script with command
#   curl -sL https://git.io/vh4Gn | sh

# Main repo address
REPO=krom/docker-compose-makefile

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

# Getting URL to release archive
V=$(get_latest_release $REPO)
RELEASE=https://github.com/$REPO/releases/download/$V/release.tgz

# Downloading and extracting release
echo Downloading version $V from $RELEASE
curl -Ls $RELEASE | tar zxfm -
echo 'Created .mk-lib'

# Creating Makefile if needed
if [ -f Makefile ]; then
    echo "Makefile exists. Please add this section to the head of Makefile

-------------------------------------------------------------------------------"
    cat .mk-lib/HEADER.mk
    echo "-------------------------------------------------------------------------------
"
else
    cp .mk-lib/Makefile.minimal.mk Makefile
    echo "Created new Makefile. Feel free to add new commands"
fi;