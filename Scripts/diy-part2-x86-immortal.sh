#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)




# Modify default Hostname
sed -i 's/ImmortalWrt/OpenWrt/g' package/base-files/files/bin/config_generate

#添加主题 自带主题故不需要
#git clone https://github.com/jerrykuku/luci-theme-argon.git ./package/luci-theme-argon
#git clone https://github.com/jerrykuku/luci-app-argon-config.git ./package/luci-app-argon-config

# Change default BackGround img
wget -O ./package/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg https://github.com/jiawm/My-OpenWrt/raw/main/BackGround/2.jpg
svn co https://github.com/xylz0928/luci-mod/trunk/feeds/luci/modules/luci-base/htdocs/luci-static/resources/icons ./package/lucimod
mv package/lucimod/* feeds/luci/modules/luci-base/htdocs/luci-static/resources/icons/

# Change default theme immortalwrt专用
#sed -i 's/bootstrap/argon/g' feeds/luci/collections/luci/Makefile 

#添加app
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-pushbot ./package/luci-app-pushbot
chmod -R 755 ./package/luci-app-pushbot/*

# 修改openwrt登陆地址,把下面的192.168.2.1修改成你想要的就可以了，其他的不要动
sed -i 's/192.168.1.1/192.168.100.101/g' package/base-files/files/bin/config_generate

#删除重复app
#rm -rf ./package/otherpackage/luci-theme-argon
#rm -rf ./package/otherpackage/luci-app-argon-config
