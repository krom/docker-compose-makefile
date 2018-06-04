#/bin/sh
REPO=krom/docker-compose-makefile
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

v=$(get_latest_release $REPO)
release=https://github.com/$REPO/releases/download/$v/release.tgz
echo Downloading version $v from $release
curl -Ls $release | tar zxfm -
echo 'Created .mk-lib'
if [ -f makefile ]; then
    echo "Makefile exists. Please add this section to the head of Makefile"
    cat .mk-lib/HEADER.mk 
else
    cp .mk-lib/HEADER.mk Makefile
    echo "Created new Makefile. Feel free to add new commands"
fi;