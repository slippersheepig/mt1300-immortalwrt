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

# sing-box Makefile 路径
SINGBOX_MK="package/luci-app-passwall-packages/sing-box/Makefile"

# 1. 删除尾随空格（防止 Makefile 报 ': and :: entries' 错误）
if [ -f "$SINGBOX_MK" ]; then
    sed -i 's/[[:space:]]*$//' "$SINGBOX_MK"
fi

# 2. 添加 PKG_BUILD_FLAGS:=no-mips16（防止 MIPS16 汇编错误）
if [ -f "$SINGBOX_MK" ] && ! grep -q '^PKG_BUILD_FLAGS' "$SINGBOX_MK"; then
    sed -i '/^PKG_NAME:=sing-box/a PKG_BUILD_FLAGS:=no-mips16' "$SINGBOX_MK"
fi

# 3. 禁用 CGO（防止跨架构 runtime/cgo 编译错误）
if [ -f "$SINGBOX_MK" ] && ! grep -q 'CGO_ENABLED=0' "$SINGBOX_MK"; then
    sed -i '/^GO_PKG_BUILD_VARS[[:space:]]*:=/a GO_PKG_BUILD_VARS += CGO_ENABLED=0' "$SINGBOX_MK"
fi
