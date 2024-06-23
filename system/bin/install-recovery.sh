#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11405312 7230185e3d46c9a0392442e275da442a674a4f96 9136128 949a88532c950a7885fc99bfb3d6830c905897cb
fi

if ! applypatch -c EMMC:/dev/block/mmcblk0p6:11405312:7230185e3d46c9a0392442e275da442a674a4f96; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/mmcblk0p5:9136128:949a88532c950a7885fc99bfb3d6830c905897cb EMMC:/dev/block/mmcblk0p6 7230185e3d46c9a0392442e275da442a674a4f96 11405312 949a88532c950a7885fc99bfb3d6830c905897cb:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
