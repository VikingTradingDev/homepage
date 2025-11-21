#!/bin/bash

# VikingTrading Homepage - GitHub Pages 快速部署脚本

echo "==================================="
echo "GitHub Pages 快速部署脚本"
echo "==================================="
echo ""

# 检查是否已经添加远程仓库
if git remote | grep -q "origin"; then
    echo "✓ 检测到已配置的远程仓库："
    git remote -v | grep origin
    echo ""
    read -p "是否要更新远程仓库地址？(y/N): " update_remote
    if [[ $update_remote == "y" || $update_remote == "Y" ]]; then
        read -p "请输入新的 GitHub 仓库 URL: " repo_url
        git remote set-url origin "$repo_url"
        echo "✓ 远程仓库已更新"
    fi
else
    echo "请输入您的 GitHub 仓库信息："
    read -p "GitHub 用户名: " username
    read -p "仓库名称 (默认: homepage): " repo_name
    repo_name=${repo_name:-homepage}
    
    echo ""
    echo "选择连接方式："
    echo "1) HTTPS (推荐)"
    echo "2) SSH (需要配置 SSH 密钥)"
    read -p "请选择 (1/2): " connection_type
    
    if [[ $connection_type == "2" ]]; then
        repo_url="git@github.com:$username/$repo_name.git"
    else
        repo_url="https://github.com/$username/$repo_name.git"
    fi
    
    echo ""
    echo "添加远程仓库: $repo_url"
    git remote add origin "$repo_url"
    echo "✓ 远程仓库已添加"
fi

echo ""
echo "==================================="
echo "准备推送到 GitHub..."
echo "==================================="
echo ""

# 确保在 main 分支
current_branch=$(git branch --show-current)
if [[ $current_branch != "main" ]]; then
    echo "切换到 main 分支..."
    git branch -M main
fi

# 推送代码
echo "推送代码到 GitHub..."
if git push -u origin main; then
    echo ""
    echo "==================================="
    echo "✓ 代码推送成功！"
    echo "==================================="
    echo ""
    echo "接下来的步骤："
    echo ""
    echo "1. 访问你的 GitHub 仓库"
    echo "2. 点击 'Settings' -> 'Pages'"
    echo "3. 选择以下其中一种方式："
    echo ""
    echo "   方式 A（推荐 - 最简单）："
    echo "   - Source: Deploy from a branch"
    echo "   - Branch: main, / (root)"
    echo "   - 点击 Save"
    echo ""
    echo "   方式 B（使用 GitHub Actions）："
    echo "   - Source: GitHub Actions"
    echo "   - 工作流文件已创建，会自动部署"
    echo ""
    echo "4. 等待几分钟后，访问："
    
    if [[ -n $username && -n $repo_name ]]; then
        echo "   https://$username.github.io/$repo_name/"
    else
        echo "   https://YOUR_USERNAME.github.io/YOUR_REPO_NAME/"
    fi
    echo ""
    echo "详细说明请查看 DEPLOYMENT.md 文件"
    echo ""
else
    echo ""
    echo "==================================="
    echo "✗ 推送失败"
    echo "==================================="
    echo ""
    echo "可能的原因："
    echo "1. GitHub 仓库还未创建"
    echo "2. 认证失败（需要配置 GitHub 凭证）"
    echo "3. 网络连接问题"
    echo ""
    echo "请先在 GitHub 上创建仓库："
    echo "https://github.com/new"
    echo ""
    echo "然后重新运行此脚本，或手动执行："
    echo "git push -u origin main"
    echo ""
fi

