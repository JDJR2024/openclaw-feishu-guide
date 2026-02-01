#!/bin/bash

# OpenClaw飞书配置指南 - GitHub推送脚本
echo "🚀 OpenClaw飞书配置指南 GitHub发布脚本"
echo "========================================"

# 检查Git状态
echo "1. 检查Git状态..."
git status

echo ""
echo "2. 设置远程仓库..."
echo "请确保已在GitHub创建仓库：https://github.com/new"
echo "仓库名：openclaw-feishu-guide"
echo ""
read -p "请输入你的GitHub用户名（例如：JDJR2024）: " GITHUB_USER

if [ -z "$GITHUB_USER" ]; then
    echo "❌ 需要GitHub用户名"
    exit 1
fi

# 设置远程仓库
REMOTE_URL="https://github.com/$GITHUB_USER/openclaw-feishu-guide.git"
echo "设置远程仓库: $REMOTE_URL"
git remote remove origin 2>/dev/null
git remote add origin "$REMOTE_URL"

echo ""
echo "3. 推送代码到GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 发布成功！"
    echo "📦 仓库地址: https://github.com/$GITHUB_USER/openclaw-feishu-guide"
    echo "📚 文档地址: https://github.com/$GITHUB_USER/openclaw-feishu-guide#readme"
    echo ""
    echo "🎉 恭喜！OpenClaw飞书配置指南已发布到GitHub"
else
    echo ""
    echo "❌ 推送失败"
    echo "可能的原因："
    echo "1. 仓库尚未创建 - 请先访问 https://github.com/new 创建仓库"
    echo "2. 权限问题 - 检查GitHub访问权限"
    echo "3. 网络问题 - 检查网络连接"
fi