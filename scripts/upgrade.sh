# Docker compose upgrading script
# Execute this script with command
#   make mk-upgrade

RELEASE=https://github.com/$MK_REPO/releases/download/$MK_VERSION/release.tgz

# Downloading new release
echo "Downloading version $MK_VERSION from $RELEASE"
curl -Ls $RELEASE | tar zxfm -
echo "Done"