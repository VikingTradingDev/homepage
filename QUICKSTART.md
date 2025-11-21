# 快速开始 - 3 步部署到 GitHub Pages

## 📋 前提条件

- GitHub 账号
- Git 已安装并配置

## 🚀 三步部署

### 步骤 1: 在 GitHub 创建仓库

访问 https://github.com/new 创建新仓库：
- 仓库名称：`homepage` (或其他名称)
- 设为 Public (公开)
- **不要**勾选任何初始化选项 (README, .gitignore, license)

### 步骤 2: 推送代码

**方式 A: 使用自动脚本（推荐）**

```bash
cd /home/viking/projects/homepage
./deploy.sh
```

脚本会引导你完成配置和推送。

**方式 B: 手动推送**

```bash
cd /home/viking/projects/homepage

# 添加远程仓库（替换 YOUR_USERNAME 和 YOUR_REPO）
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git

# 推送代码
git branch -M main
git push -u origin main
```

### 步骤 3: 启用 GitHub Pages

1. 进入 GitHub 仓库页面
2. 点击 **Settings** (设置)
3. 左侧菜单点击 **Pages**
4. 在 "Source" 下选择：
   - **Deploy from a branch**
   - Branch: `main`
   - Folder: `/ (root)`
5. 点击 **Save**

⏱️ 等待 2-5 分钟，页面会显示网站地址！

## 🌐 访问你的网站

```
https://YOUR_USERNAME.github.io/YOUR_REPO/
```

## 📝 更新网站

每次修改后：

```bash
git add .
git commit -m "Update website"
git push
```

GitHub Pages 会自动更新（2-5分钟）。

## 📚 更多信息

- 详细部署说明：查看 `DEPLOYMENT.md`
- 故障排查和自定义域名：查看 `DEPLOYMENT.md`

## 🎨 本地预览

```bash
# 使用 Python 启动本地服务器
python3 -m http.server 8000

# 访问 http://localhost:8000
```

或直接用浏览器打开 `index.html` 文件。

---

**需要帮助？** 查看 [GitHub Pages 文档](https://docs.github.com/pages) 或 DEPLOYMENT.md 文件。

