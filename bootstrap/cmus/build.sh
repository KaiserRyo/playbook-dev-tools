#!/usr/bin/env bash

# This code Copyright 2012 Todd Mortimer <todd.mortimer@gmail.com>
#
# You may do whatever you like with this code, provided the above
# copyright notice and this paragraph are preserved.
#
# Olivier Kaloudoff <olivier.kaloudoff@gmail.com>, 2018
#

#
# Note: this build is being put on hold, cause it needs GCC-4.9 at least for Atomic operations
#

#https://stackoverflow.com/questions/20326604/stdatomic-h-in-gcc-4-8

set -e
source ../../lib.sh


DISTVER="cmus"
DISTSUFFIX="git"
DISTFILES="https://github.com/$DISTVER/$DISTVER.git"
GITVER="v2.8.0-rc0"
UNPACKCOMD="tar -xJf"
TASK=fetch
package_init "$@"
CONFIGURE_CMD="./configure 
                CC=$PBTARGETARCH-gcc
                "

if [ "$TASK" == "fetch" ]
then
  cd "$WORKROOT"
  # delete old version
  rm -rf "$DISTVER"
  git clone --recursive $DISTFILES $DISTVER
  cd $DISTVER
  git checkout $GITVER
  cd "$WORKDIR"
  TASK=patch
fi

package_patch
package_build
package_install
package_bundle

