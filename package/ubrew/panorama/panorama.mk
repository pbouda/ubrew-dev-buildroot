################################################################################
#
# panorama
#
################################################################################

PANORAMA_VERSION = master
#PANORAMA_SOURCE = panorama-$(PANORAMA_VERSION).tar.gz
#PANORAMA_SITE = https://github.com/ubrew-it/panorama/releases/download/$(PANORAMA_VERSION)
PANORAMA_SITE = git://github.com/ubrew-it/panorama.git
PANORAMA_DEPENDENCIES = qt5pndman
PANORAMA_LICENSE = Creative Commons Attribution Share-Alike

$(eval $(cmake-package))
