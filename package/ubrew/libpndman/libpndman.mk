################################################################################
#
# libpndman
#
################################################################################

LIBPNDMAN_VERSION = master
LIBPNDMAN_SITE = git://github.com/ubrew-it/libpndman.git
LIBPNDMAN_DEPENDENCIES = libpnd jansson
LIBPNDMAN_INSTALL_STAGING = YES
LIBPNDMAN_LICENSE = DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE Version 2

$(eval $(cmake-package))
