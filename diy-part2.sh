#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# 添加 no-mips16 标志
sed -i 's/^PKG_NAME:=sing-box/& \
PKG_BUILD_FLAGS:=no-mips16/' package/luci-app-passwall-packages/sing-box/Makefile

# 禁用 CGO
sed -i 's/^GO_PKG_BUILD_VARS :=/GO_PKG_BUILD_VARS += CGO_ENABLED=0\n&/' package/luci-app-passwall-packages/sing-box/Makefile
