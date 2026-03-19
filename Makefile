# SPDX-License-Identifier: AGPL-3.0-or-later
# Copyright 2025-2026 MOSSDeF, Stan Grishin (stangri@melmac.ca).

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-yaaw
PKG_LICENSE:=AGPL-3.0-or-later
PKG_MAINTAINER:=Stan Grishin <stangri@melmac.ca>
PKG_VERSION:=1.0.0
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/binux/yaaw.git
PKG_SOURCE_DATE:=2020-08-02
PKG_SOURCE_VERSION:=7511684b9af552445d0dd849ac25705b79a5ad0d
PKG_MIRROR_HASH:=204e9d8742d994e076fb2b1ad5daf4679496ddc1834841359be66b3c6f8907de

LUCI_TITLE:=Yet Another Aria2c Web UI
LUCI_URL:=https://github.com/mossdef-org/luci-app-yaaw/
LUCI_DESCRIPTION:=Provides Web UI for Yet Another Aria2c.
LUCI_DEPENDS:=+luci-base

define Package/$(PKG_NAME)/config
# shown in make menuconfig <Help>
help
	$(LUCI_TITLE)
	.
	Version: $(PKG_VERSION)-$(PKG_RELEASE)
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/www/yaaw
	$(CP) $(PKG_BUILD_DIR)/css $(1)/www/yaaw/
	$(CP) $(PKG_BUILD_DIR)/img $(1)/www/yaaw/
	$(CP) $(PKG_BUILD_DIR)/js $(1)/www/yaaw/
	$(CP) $(PKG_BUILD_DIR)/index.html $(1)/www/yaaw/
	$(CP) $(PKG_BUILD_DIR)/offline.appcache $(1)/www/yaaw/
endef

include ../../luci.mk

# call BuildPackage - OpenWrt buildroot signature
