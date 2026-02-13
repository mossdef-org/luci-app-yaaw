# SPDX-License-Identifier: AGPL-3.0-or-later
# Copyright 2025-2026 MOSSDeF, Stan Grishin (stangri@melmac.ca).

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-yaaw
PKG_LICENSE:=AGPL-3.0-or-later
PKG_MAINTAINER:=Stan Grishin <stangri@melmac.ca>
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

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

include ../../luci.mk

# call BuildPackage - OpenWrt buildroot signature
