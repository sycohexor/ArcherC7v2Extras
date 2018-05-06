#!/bin/bash
git clone https://git.openwrt.org/openwrt/openwrt.git lede
cp -r patches /home/syco/lede
cd lede
./scripts/feeds update -a
./scripts/feeds install -a
#git clone https://github.com/mwarning/device-observatory.git
#cp -r /home/syco/device-observatory /home/syco/lede/package/
for i in patches/*.patch; do patch -p1 < $i; done
mv ./target/linux/generic/patches-4.9/* ./target/linux/generic/pending-4.9/
rm -rf ./target/linux/generic/patches-4.9
cp /home/syco/Documents/config.seed /home/syco/lede/.config
