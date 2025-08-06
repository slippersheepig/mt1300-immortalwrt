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

#替换sing-box的默认Makefile
sed -i 's/PKG_USE_MIPS16/PKG_BUILD_FLAGS:=no-mips16\nPKG_USE_MIPS16/' feeds/packages/net/sing-box/Makefile
