#!/usr/bin/env bash

# This code Copyright 2012 Todd Mortimer <todd.mortimer@gmail.com>
#
# You may do whatever you like with this code, provided the above
# copyright notice and this paragraph are preserved.


set -e
source ../../lib.sh
source ./vars.sh
TASK=fetch

package_init "$@"
CONFIGURE_CMD="./autogen.sh ;
		./configure --enable-maintainer-mode
                --host=$PBHOSTARCH
                --build=$PBBUILDARCH 
                --target=$PBTARGETARCH 
                --prefix=$PREFIX 
                CC=$PBTARGETARCH-gcc
                MAKEINFO='/usr/bin/makeinfo --force'
                "

if [ "$TASK" == "fetch" ]
then
  cd "$WORKROOT"
  # delete old version
  rm -rf "$DISTVER"
  git clone --recursive https://github.com/gpg/libgcrypt.git $DISTVER
  cd $DISTVER
  cd "$WORKDIR"
  TASK=patch
fi
package_patch 1
package_build
package_install
package_bundle


