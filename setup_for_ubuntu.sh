#!/bin/bash

# 打印错误信息并退出
error_exit() {
    echo "错误: $1" >&2
    exit 1
}

# 检查命令执行结果
check_result() {
    if [ $? -ne 0 ]; then
        error_exit "$1"
    fi
}

echo "开始安装依赖..."

# 更新包索引
echo "更新包索引..."
sudo apt update
check_result "无法更新包索引"

# 安装基础开发工具
echo "安装基础开发工具..."
sudo apt install -y build-essential cmake pkg-config
check_result "安装基础开发工具失败"

# 安装GUI相关依赖
echo "安装GUI依赖..."
sudo apt install -y libgtk-4-dev
sudo apt install -y libglib2.0-dev
check_result "安装GUI依赖失败"

# 安装SSL和网络相关依赖
echo "安装网络相关依赖..."
sudo apt install -y libssl-dev libcurl4-openssl-dev
check_result "安装网络依赖失败"

# 安装Python环境
echo "安装Python环境..."
sudo apt install -y python3 python3-pip
check_result "安装Python失败"

# 安装Python依赖
echo "安装Python依赖..."
pip3 install requests pandas numpy python-binance websocket-client
check_result "安装Python依赖失败"

# 安装Chrome
echo "安装Chrome浏览器..."
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt update
sudo apt install -y google-chrome-stable
check_result "安装Chrome失败"

echo "所有依赖安装完成!" 