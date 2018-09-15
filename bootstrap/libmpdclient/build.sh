#!/usr/bin/env bash

# This code Copyright 2012 Todd Mortimer <todd.mortimer@gmail.com>
#
# You may do whatever you like with this code, provided the above
# copyright notice and this paragraph are preserved.


set -e
source ../../lib.sh
DISTVER="libmpdclient-2.15"
DISTSUFFIX="tar.xz"
TASK=fetch

BUILD_DEP_BINS=(/usr/local/bin/ninja)   # be carefull, bash array syntax is separated by spaces
check_required_binaries 

DISTFILES="http://www.musicpd.org/download/libmpdclient/2/libmpdclient-2.15.tar.xz"
UNPACKCOMD="tar -xJf"
TASK=fetch
package_init "$@"
CONFIGURE_CMD="./configure 
                --host=$PBHOSTARCH
                --build=$PBBUILDARCH 
                --target=$PBTARGETARCH 
                --prefix=$PREFIX 
                CC=$PBTARGETARCH-gcc
		CFLAGS=-O3
                "


package_fetch
package_patch

if [ "$TASK" == "build" ]
then
  echo "Building"
  cd "$WORKDIR"
  # clean up if we have a previous build
  #if [ -e "Makefile" ]; then
  #  make clean || true
  #  make distclean || true
  #fi
  # configure
  eval $CONFIGURE_CMD

  for apatch in $EXECDIR/post-conf-patches/*
   do
	 patch  < $apatch
   done

  eval $MAKE_PREFIX make $MYMAKEFLAGS || \
        eval $MAKE_PREFIX make
  TASK=install
fi

package_install
package_bundle

