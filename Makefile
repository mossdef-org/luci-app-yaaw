# SPDX-License-Identifier: AGPL-3.0-or-later
# Copyright 2025-2026 MOSSDeF, Stan Grishin (stangri@melmac.ca).

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-yaaw
PKG_LICENSE:=AGPL-3.0-or-later
PKG_MAINTAINER:=Stan Grishin <stangri@melmac.ca>
PKG_VERSION:=1.0.0
PKG_RELEASE:=3

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/binux/yaaw.git
PKG_SOURCE_VERSION:=7511684b9af552445d0dd849ac25705b79a5ad0d
PKG_SOURCE_SUBDIR:=$(PKG_NAME)
PKG_MIRROR_HASH:=53e29eef717f90e5ba64a212d74f3d87b9ce632687fc9b116a0eab98dac7d859

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=Yet Another Aria2c Web UI
  URL:=https://github.com/mossdef-org/luci-app-yaaw/
  DEPENDS:=+luci-base
  PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
  Provides Web UI for Yet Another Aria2c.
endef

define Package/$(PKG_NAME)/config
help
	Yet Another Aria2c Web UI
	.
	Version: $(PKG_VERSION)-$(PKG_RELEASE)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/www/yaaw
	$(CP) $(PKG_BUILD_DIR)/css $(1)/www/yaaw/
	$(CP) $(PKG_BUILD_DIR)/img $(1)/www/yaaw/
	$(CP) $(PKG_BUILD_DIR)/js  $(1)/www/yaaw/
	$(CP) $(PKG_BUILD_DIR)/index.html       $(1)/www/yaaw/
	$(CP) $(PKG_BUILD_DIR)/offline.appcache $(1)/www/yaaw/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
