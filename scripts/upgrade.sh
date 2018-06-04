RELEASE=https://github.com/$MK_REPO/releases/download/$MK_VERSION/release.tgz
echo "Downloading version $MK_VERSION from $RELEASE"
curl -Ls $RELEASE | tar zxfm -
echo "Done"