#!/usr/bin/env bash

#/Applications/Momentics.app/target_10_3_1_995/qnx6/usr/include/c++/4.6.3/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the upcoming ISO C++ standard, C++0x. This support is currently experimental, and must be enabled with the -std=c++0x or -std=gnu++0x compiler options.

# This code Copyright 2012 Todd Mortimer <todd.mortimer@gmail.com>
#
# You may do whatever you like with this code, provided the above
# copyright notice and this paragraph are preserved.
#
# Olivier Kaloudoff <olivier.kaloudoff@gmail.com>, 2018
#

set -e
source ../../lib.sh
TASK=fetch

DISTVER="protobuf"
DISTSUFFIX="git"
DISTFILES="https://github.com/berryamin/$DISTVER.$DISTSUFFIX"
#UNPACKCOMD="tar -xJf"
package_init "$@"
CONFIGURE_CMD=" ./autogen.sh; ./configure
		CFLAGS=-std=c++0x
		CXXFLAGS=-std=c++0x
                --host=$PBHOSTARCH
                --build=$PBBUILDARCH
                --target=$PBTARGETARCH
	 	--prefix=$PREFIX"

if [ "$TASK" == "fetch" ]
then
  cd "$WORKROOT"
  # delete old version
  rm -rf "$DISTVER"
  git clone $DISTFILES
  TASK=patch
fi


if [ "$TASK" == "build" ]
then
  cd "$WORKROOT/$DISTVER"
  scons
  TASK=install
fi


package_fetch
package_patch 1
package_build
package_install
package_bundle

