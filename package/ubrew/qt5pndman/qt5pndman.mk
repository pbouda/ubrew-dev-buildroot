################################################################################
#
# qt5pndman
#
################################################################################

QT5PNDMAN_VERSION = master
QT5PNDMAN_SITE = git://github.com/ubrew-it/qt5pndman.git
QT5PNDMAN_INSTALL_STAGING = YES
QT5PNDMAN_DEPENDENCIES = qt5base libpndman jansson libcurl bzip2
QT5PNDMAN_LICENSE = CC-BY

$(eval $(cmake-package))
