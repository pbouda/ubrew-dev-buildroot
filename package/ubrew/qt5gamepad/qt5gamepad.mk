################################################################################
#
# qt5gamepad
#
################################################################################

QT5GAMEPAD_VERSION = master
QT5GAMEPAD_SITE = git://code.qt.io/qt-labs/qtgamepad.git
QT5GAMEPAD_DEPENDENCIES = qt5base
QT5GAMEPAD_INSTALL_STAGING = YES
QT5GAMEPAD_LICENSE = LGPLv3 and GPLv3

define QT5GAMEPAD_CONFIGURE_CMDS
	(cd $(@D); mkdir -p .git; $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
endef

define QT5GAMEPAD_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define QT5GAMEPAD_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
endef

ifeq ($(BR2_STATIC_LIBS),)
define QT5GAMEPAD_INSTALL_TARGET_LIBS
	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Gamepad*.so.* $(TARGET_DIR)/usr/lib
	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins/gamepads/
	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/gamepads/libevdevgamepad.so $(TARGET_DIR)/usr/lib/qt/plugins/gamepads/
endef
endif

ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
define QT5GAMEPAD_INSTALL_TARGET_QMLS
	cp -dpfr $(STAGING_DIR)/usr/qml/QtGamepad $(TARGET_DIR)/usr/qml/
endef
endif

define QT5GAMEPAD_INSTALL_TARGET_CMDS
	$(QT5GAMEPAD_INSTALL_TARGET_LIBS)
	$(QT5GAMEPAD_INSTALL_TARGET_QMLS)
endef

$(eval $(generic-package))
