#!/usr/bin/env sh
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}
v=$(get_latest_release $MK_REPO)

if [ $v = $MK_VERSION ]; then
    echo 'Up to date';
else
    echo "A new version is available";
    echo "Upgrading from $MK_VERSION to $v";
    curl -sL https://raw.githubusercontent.com/$MK_REPO/master/scripts/upgrade.sh | ( echo "MK_REPO=$MK_REPO; MK_VERSION=$v; "; cat -   ) | sh
fi;