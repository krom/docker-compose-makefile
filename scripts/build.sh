#!/usr/bin/env sh
echo "Building release"
OUT=release/.mk-lib

# Creating dir
mkdir -p $OUT

# Coping files
cp -r src/* $OUT
cp README.md $OUT
cp LICENSE $OUT
cp CHANGELOG.md $OUT
cp samples/Makefile $OUT/Makefile.sample.mk
cp samples/Makefile.minimal.mk $OUT/Makefile.minimal.mk

# Writing current version
echo "MK_VERSION := $TRAVIS_TAG" > $OUT/version.mk

# Compressing release to *.zip and *.tgz
tar -czf release.tgz -C release .
cd release/; zip -r ../release.zip .; cd ..
gem install octokit
ruby scripts/github_release.rb -c CHANGELOG.md -s $api_key -r krom/docker-compose-makefile -t $TRAVIS_TAG