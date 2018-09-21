#!/usr/bin/env bash

# This code Copyright 2012 Todd Mortimer <todd.mortimer@gmail.com>
#
# You may do whatever you like with this code, provided the above
# copyright notice and this paragraph are preserved.


set -e
source ../../lib.sh

DISTVER="alpine"
DISTSUFFIX="git"
GITVER="master"
TASK=fetch

package_init "$@"
CONFIGURE_CMD=" autoconf;
		 ./configure
                --host=$PBHOSTARCH
                --build=$PBBUILDARCH 
                --target=$PBTARGETARCH 
                --prefix=$PREFIX 
                CC=$PBTARGETARCH-gcc
		CFLAGS=\"\"
		LDFLAGS=\"\"
                "

if [ "$TASK" == "fetch" ]
then
  cd "$WORKROOT"
  # delete old version
  rm -rf "$DISTVER"
  git clone --recursive http://repo.or.cz/alpine.git
  cd $DISTVER
  git checkout $GITVER
  cd "$WORKDIR"
  TASK=patch
fi
package_patch 1
package_build
package_install
package_bundle


