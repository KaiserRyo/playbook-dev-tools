#!/usr/bin/env bash -x

# This code Copyright 2012 Todd Mortimer <todd.mortimer@gmail.com>
#
# You may do whatever you like with this code, provided the above
# copyright notice and this paragraph are preserved.


set -e
source ../../lib.sh
source ./vars.sh
TASK=fetch


DISTFILES="https://mirrors.edge.kernel.org/pub/software/scm/git/$DISTVER.$DISTSUFFIX"
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
		LDFLAGS=-liconv
                "
		#--without-iconv

package_fetch
package_patch
package_build
package_install
package_bundle

