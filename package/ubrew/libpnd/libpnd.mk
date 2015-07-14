################################################################################
#
# libpnd
#
################################################################################

LIBPND_VERSION = develop
LIBPND_SITE = git://github.com/ubrew-it/libpnd.git
LIBPND_INSTALL_STAGING = YES
LIBPND_LICENSE = LGPL v2.1

$(eval $(cmake-package))
