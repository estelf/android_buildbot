#!/bin/bash
echo "----make system_dump"
mkdir ~/android/system_dump/

echo "----copy payload.bin"
cp ~/android/payload.bin ~/android/system_dump/

echo "----change dir system_dump"
cd ~/android/system_dump/

if [ ! -d "scripts" ]; then 
  echo "----clone scripts"
  git clone https://github.com/LineageOS/scripts
fi

echo "----payload extract"
python "./scripts/update-payload-extractor/extract.py" "payload.bin" --output_dir ./

echo "----mount"
mkdir system/
sudo mount -o ro system.img system/
sudo mount -o ro vendor.img system/vendor/
sudo mount -o ro odm.img system/odm/
sudo mount -o ro product.img system/product/
sudo mount -o ro system_ext.img system/system_ext/

cd ../lineage/device/xiaomi/renoir
sudo ./extract-files.sh ~/android/system_dump/
cd ~/android/lineage
