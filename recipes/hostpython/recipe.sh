#!/bin/bash

VERSION_hostpython=2.7.3
URL_hostpython=http://python.org/ftp/python/$VERSION_hostpython/Python-$VERSION_hostpython.tar.bz2
MD5_hostpython=c57477edd6d18bd9eeca2f21add73919

# must be generated ?
BUILD_hostpython=$BUILD_PATH/hostpython/$(get_directory $URL_hostpython)
RECIPE_hostpython=$RECIPES_PATH/hostpython

function prebuild_hostpython() {
	cd $BUILD_hostpython
	try cp $RECIPE_hostpython/Setup Modules/Setup
}

function build_hostpython() {
	# placeholder for building
	cd $BUILD_hostpython

	# don't do the build if we already got hostpython binary
	if [ -f hostpython ]; then
		return
	fi

    try ./configure
    try make -j5
    try mv python hostpython
    try mv Parser/pgen hostpgen
    #try mkdir -p ../prebuilt/Python-$PYVERSION/lib
    #try cp hostpython ../prebuilt/Python-$PYVERSION/
    #try cp hostpgen ../prebuilt/Python-$PYVERSION/
    #try cp build/lib.*/*.so ../prebuilt/Python-$PYVERSION/lib/
    #try cd ..
}

function postbuild_hostpython() {
	# placeholder for post build
	true
}
