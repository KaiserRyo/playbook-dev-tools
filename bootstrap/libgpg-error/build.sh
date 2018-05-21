#!/usr/bin/env bash

set -e
source ../../lib.sh
source ./vars.sh
TASK=fetch

DISTFILES="https://www.gnupg.org/ftp/gcrypt/libgpg-error/$DISTVER.$DISTSUFFIX"
UNPACKCOMD="tar -jxf"

package_init "$@"

CONFIGURE_CMD="./configure
                --host=$PBHOSTARCH
                --build=$PBBUILDARCH
                --target=$PBTARGETARCH
                --prefix=$PREFIX
                CC=$PBTARGETARCH-gcc
                "
package_fetch
package_patch
package_build
package_install
package_bundle

