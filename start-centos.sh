#!/data/data/com.termux/files/usr/bin/bash
cd $(dirname $0)
## unset LD_PRELOAD in case termux-exec is installed
unset LD_PRELOAD
command="proot"
command+=" --link2symlink"
command+=" -0"
command+=" -r centos-fs"
command+=" -b /dev -b /proc"
if [ -n "$(ls -A centos-binds)" ]; then
    for f in centos-binds/* ;do
      . $f
    done
fi
command+=" -b /dev"
command+=" -b /proc"
command+=" -b /sys"
#command+=" -b centos-fs/tmp:/dev/shm"
command+=" -b centos-fs/root:/dev/shm"
command+=" -b /data/data/com.termux"
command+=" -b /:/host-rootfs"
command+=" -b /sdcard"
command+=" -b /storage"
command+=" -b /mnt"
command+=" -w /root /usr/bin/env"
command+=" /usr/bin/env -i"
command+=" -i HOME=/root"
command+=" PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games"
command+=" TERM=$TERM"
command+=" LANG=C.UTF-8"
command+=" /bin/bash --login"
com="$@"
if [ -z "$1" ];then
    exec $command
else
    $command -c "$com"
fi
