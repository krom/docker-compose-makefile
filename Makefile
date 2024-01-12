OUT:=release/.mk-lib

clean-release:
	rm -f release.tgz

release.tgz: src/* README.md LICENSE CHANGELOG.md samples/Makefile samples/Makefile.minimal.mk
	@echo "Building release $(OUT)"
	
	# Creating dir
	mkdir -p $(OUT)
	
	# Coping files
	cp -r src/* $(OUT)
	cp README.md $(OUT)
	cp LICENSE $(OUT)
	cp CHANGELOG.md $(OUT)
	cp samples/Makefile $(OUT)/Makefile.sample.mk
	cp samples/Makefile.minimal.mk $(OUT)/Makefile.minimal.mk
	
	# Writing current version
	echo "MK_VERSION := $TRAVIS_TAG" > $(OUT)/version.mk
	
	# Compressing release to *.zip and *.tgz
	tar -czf release.tgz -C release .
