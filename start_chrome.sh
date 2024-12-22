#!/bin/bash

# 启动Chrome的函数
start_chrome() {
    # 检查Chrome是否已安装
    if ! command -v google-chrome &> /dev/null; then
        echo "错误: Google Chrome未安装"
        exit 1
    fi
    
    # 启动Chrome，添加常用参数
    google-chrome \
        --no-sandbox \
        --disable-gpu \
        --disable-dev-shm-usage \
        --disable-software-rasterizer \
        --disable-background-timer-throttling \
        --disable-backgrounding-occluded-windows \
        --disable-renderer-backgrounding \
        "$@"  # 传入任何额外的命令行参数
}

# 启动Chrome
start_chrome 