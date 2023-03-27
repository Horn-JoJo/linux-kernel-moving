#!/bin/bash 

TOOL_CHAIN=gcc-4.6.4

#解压交叉编译工具链
tar -xvf "${TOOL_CHAIN}"".tar.xz"

#临时导入配置交叉编译工具链的bin到PATH中
export PATH=`pwd`"/$TOOL_CHAIN/bin:$PATH"

#查看配置信息
echo $PATH

#需要使用 . config_arm_gcc.sh 或者 source config_arm_gcc.sh来使其添加到环境变量中去
