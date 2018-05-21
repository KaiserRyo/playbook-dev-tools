#!/usr/bin/env bash

set -e
source ../../lib.sh
source ./vars.sh
TASK=fetch

DISTFILES="https://weechat.org/files/src/$DISTVER.$DISTSUFFIX"
UNPACKCOMD="tar -jxf"

package_init "$@"

# we must have build libgcrypt and zlib first
CONFIGURE_CMD="mkdir build && cd build && PBTARGETARCH=\"$PBTARGETARCH\"
              PREFIX=\"$PREFIX\"
              QNX_TARGET=\"$QNX_TARGET\"
              LIBGCRYPT_DIR=\"$ARCHIVEDIR/libgcrypt-1.8.2/$PREFIX\"
              ZLIB_DIR=\"$ARCHIVEDIR/zlib-1.2.11/$PREFIX\"
              cmake .. \
              -DCMAKE_TOOLCHAIN_FILE=\"$EXECDIR/bb10.toolchain.cmake\" \
              -DCMAKE_BUILD_TYPE=release ."

package_fetch
package_patch
package_build
package_install
package_bundle

