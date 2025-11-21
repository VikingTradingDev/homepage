# GitHub Pages 部署指南

本项目已经配置好通过 GitHub Pages 托管静态网站。

## 快速开始

### 1. 在 GitHub 上创建仓库

1. 访问 https://github.com/new
2. 创建一个新仓库，命名为 `homepage` （或其他名称）
3. **不要**初始化 README、.gitignore 或 license（我们已经有了）

### 2. 推送代码到 GitHub

```bash
# 添加 GitHub 仓库为远程仓库（替换 YOUR_USERNAME 为你的 GitHub 用户名）
git remote add origin https://github.com/YOUR_USERNAME/homepage.git

# 或使用 SSH（如果你配置了 SSH 密钥）
git remote add origin git@github.com:YOUR_USERNAME/homepage.git

# 推送代码
git branch -M main
git push -u origin main
```

### 3. 启用 GitHub Pages

#### 方法 A: 从 main 分支部署（推荐 - 最简单）

1. 进入你的 GitHub 仓库页面
2. 点击 **Settings** (设置)
3. 在左侧菜单中点击 **Pages**
4. 在 "Source" 下拉菜单中选择 **Deploy from a branch**
5. 在 "Branch" 下选择 `main` 分支和 `/ (root)` 目录
6. 点击 **Save**
7. 等待几分钟，页面会显示你的网站地址：`https://YOUR_USERNAME.github.io/homepage/`

#### 方法 B: 使用 GitHub Actions 部署（更灵活）

1. 进入你的 GitHub 仓库页面
2. 点击 **Settings** > **Pages**
3. 在 "Source" 下选择 **GitHub Actions**
4. 创建工作流文件（见下方）

### 使用 GitHub Actions 自动部署

如果选择方法 B，创建以下文件：

`.github/workflows/deploy.yml`

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches:
      - main
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  deploy:
    environment:
      name: github-pages
      url: \${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      
      - name: Setup Pages
        uses: actions/configure-pages@v4
      
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: '.'
      
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

创建此文件后：

```bash
git add .github/workflows/deploy.yml
git commit -m "Add GitHub Actions deployment workflow"
git push
```

## 自定义域名（可选）

如果你有自己的域名：

1. 在仓库根目录创建 `CNAME` 文件，内容为你的域名，例如：
   ```
   www.vikingtrading.com
   ```

2. 在你的域名服务商处添加 DNS 记录：
   - 类型：`CNAME`
   - 主机：`www`（或 `@` 表示根域名）
   - 值：`YOUR_USERNAME.github.io`

3. 在 GitHub Settings > Pages 中，在 "Custom domain" 输入你的域名并保存

## 本地预览

直接用浏览器打开 `index.html` 文件即可。

或者使用 Python 简单的 HTTP 服务器：

```bash
# Python 3
python3 -m http.server 8000

# 然后访问 http://localhost:8000
```

## 更新网站

每次更新后：

```bash
git add .
git commit -m "Update content"
git push
```

GitHub Pages 会自动更新你的网站（通常在几分钟内）。

## 故障排查

1. **页面 404 错误**：
   - 确认 GitHub Pages 已启用
   - 确认分支和目录设置正确
   - 确认 `index.html` 在仓库根目录

2. **页面没有更新**：
   - 清除浏览器缓存
   - 等待几分钟（GitHub Pages 部署需要时间）
   - 检查 Actions 标签页看部署状态（如果使用 GitHub Actions）

3. **样式或脚本加载失败**：
   - 检查浏览器控制台错误
   - 确认所有外部 CDN 链接正常

## 项目结构

```
homepage/
├── index.html              # 主页（从 html/vikingtrading_homepage.html 复制）
├── html/                   # HTML 源文件目录
│   └── vikingtrading_homepage.html
├── archive/                # 旧版本归档
│   ├── homepage.html
│   ├── v1_matrix.html
│   └── v2_mario.html
├── .github/
│   └── workflows/
│       └── deploy.yml      # GitHub Actions 工作流（可选）
├── .gitignore
└── README.md
```

## 技术支持

如有问题，请参考：
- [GitHub Pages 官方文档](https://docs.github.com/pages)
- [GitHub Actions 文档](https://docs.github.com/actions)

