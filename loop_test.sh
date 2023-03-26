#!/bin/sh
#以下操作都需要加sudo，然后该脚本也需要加root权限0777，然后再执行时就不会再需要输入密码

SRC_DIR=/home/linux/2023/linux-kernel-moving/nfs 
DST_DIR=/home/linux/2023/linux-kernel-moving/mnt

#重启nfs服务, 再此之前需要将SRC_DIR的路径信息更新到/etc/exports文件, 如果有相关配置，则不需要更新
if [ $# -eq 0 ]; then
	echo "${SRC_DIR} has alreadly been configured as a SRC_DIR."
elif [ $# -eq 1 ] && [ $1 = "y" ]; then 
	sudo echo "${SRC_DIR} *(rw,sync,no_root_squash)" >> /etc/exports
else
	echo "参数错误"
	exit 1
fi

sudo cat /etc/exports
#重启nfs服务
#sudo /etc/init.d/nfs-kernel-server restart

#挂载远程映射文件夹到指定的目录
sudo mount -t nfs localhost:"${SRC_DIR}" "${DST_DIR}"

#查看是否挂载成功
sudo cat "${DST_DIR}""/test"

#解除映射
sudo umount ${DST_DIR}
