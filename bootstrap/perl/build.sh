#!/usr/bin/env bash

# This code Copyright 2012 Todd Mortimer <todd.mortimer@gmail.com>
#
# You may do whatever you like with this code, provided the above
# copyright notice and this paragraph are preserved.


set -e
source ../../lib.sh
source ./vars.sh
TASK=fetch

DISTFILES="http://www.cpan.org/src/5.0/$DISTVER.$DISTSUFFIX"
UNPACKCOMD="tar -xzf"

package_init "$@"
CONFIGURE_CMD="
sh ./Configure  -d
    -Dusecrosscompile 
    -Dtargetarch=$PBTARGETARCH
    -Dtargethost=192.168.0.1
    -Dcc=$PBTARGETARCH-gcc
    -Dtargetdir=/accounts/1000/shared/documents
"
#    -Dtargethost=<IP of ARM computer> 
#    -Dtargetuser=<user name>
#    -Dusrinc=/opt/FriendlyARM/toolschain/4.4.3/arm-none-linux-gnueabi/include/ 
#    -Dincpth=/opt/FriendlyARM/toolschain/4.4.3/arm-none-linux-gnueabi/include/ 
#    -Dlibpth=/opt/FriendlyARM/toolschain/4.4.3/lib 
# ; make CC=$PBTARGETARCH-gcc AR=$PBTARGETARCH-ar RANLIB=$PBTARGETARCH-ranlib CFLAGS=-O3"

package_fetch
package_patch
package_build

if [ "$TASK" == "install" ]
then
  cd "$WORKDIR"
  make install PREFIX="$DESTDIR/$PREFIX"
 	cd "$DESTDIR/$PREFIX/bin"
  TASK=bundle
fi


package_bundle

