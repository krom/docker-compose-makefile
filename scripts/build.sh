#!/usr/bin/env sh
echo "Building release"
out=release/.mk-lib/
mkdir -p $out
cp -r src/* $out
cp README.md $out
cp LICENSE $out
echo "MK_VERSION := $TRAVIS_TAG" > $out/version.mk
tar -czf release.tgz -C release .
cd release/; zip -r ../release.zip .; cd ..