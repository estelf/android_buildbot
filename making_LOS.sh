#!/bin/bash
cd ~/android

if [ -d "lineage" ]; then 
  echo "----delete lineage"
  rm -rf lineage
fi

echo "----make lineage folder"
mkdir lineage

echo "----change dir lineage folder"
cd lineage

echo "----init repo lineage"
repo init -u https://github.com/LineageOS/android.git -b lineage-18.1

echo "----my local_manifest lineage"
cp -rp ../local_manifests .repo
echo "----ropo sync lineage"
repo sync --force-sync -j40

export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G

../making_brob.sh

read -p "befor building wait... please Press any key to next"

echo "----building!"
. build/envsetup.sh
brunch renoir 2>&1 | tee lineage_$(date '+%Y%m%d_%H-%M-%S').log
