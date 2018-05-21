DISTVER="gnutls-3.3.29"
DISTSUFFIX="tar.xz"

#
# DEPENDS is only informative for the moment .. 
# some more code would be welcome inside lib.sh or build.sh to make real use of DEPENDS
#  we might implement an ordered list of dependencies, so that first dependency must be compiled before the second, and so on
#  (ie: in the case when second dependency has dependency upon first dependency)
#
DEPENDS="gmp nettle libtasn1" 
