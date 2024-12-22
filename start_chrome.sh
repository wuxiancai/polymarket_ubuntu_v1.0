#!/bin/bash

# 设置显示环境变量
export DISPLAY=:0

# 启动Chrome的函数
start_chrome() {
    # 检查Chrome是否已安装
    if ! command -v google-chrome &> /dev/null; then
        echo "错误: Google Chrome未安装"
        exit 1
    fi
    
    # 检查ChromeDriver是否已安装
    if ! command -v chromedriver &> /dev/null; then
        echo "错误: ChromeDriver未安装"
        exit 1
    fi
    
    # 启动ChromeDriver
    chromedriver --port=9515 &
    
    # 启动Chrome，添加常用参数
    google-chrome \
        --no-sandbox \
        --disable-gpu \
        --disable-dev-shm-usage \
        --disable-software-rasterizer \
        --disable-background-timer-throttling \
        --disable-backgrounding-occluded-windows \
        --disable-renderer-backgrounding \
        --remote-debugging-port=9222 \
        --user-data-dir="$HOME/.config/google-chrome" \
        
        "$@"  # 传入任何额外的命令行参数
}

# 启动Chrome
start_chrome

# 等待Chrome完全启动
sleep 3

echo "Chrome已启动，remote debugging端口: 9222"
echo "ChromeDriver已启动，端口: 9515"