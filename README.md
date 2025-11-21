# VikingTrading Homepage

VikingTrading 官方主页 - 流动性提供商

## 🚀 快速部署

使用 GitHub Pages 托管此网站，只需 3 步：

```bash
# 1. 在 GitHub 创建仓库（访问 https://github.com/new）

# 2. 运行部署脚本
./deploy.sh

# 3. 在 GitHub 仓库 Settings > Pages 启用 GitHub Pages
```

详细步骤查看 [QUICKSTART.md](QUICKSTART.md)

## 📖 文档

- [快速开始指南](QUICKSTART.md) - 3 步部署说明
- [完整部署文档](DEPLOYMENT.md) - 详细配置和故障排查

## 💻 本地预览

```bash
# 方式 1: 直接打开
在浏览器中打开 index.html

# 方式 2: 启动本地服务器
python3 -m http.server 8000
# 访问 http://localhost:8000
```

## 🛠️ 技术栈

- 纯静态 HTML/CSS/JavaScript
- [Three.js](https://threejs.org/) - 3D 图形渲染
- [GSAP](https://greensock.com/gsap/) - 动画效果
- [SimplexNoise](https://github.com/jwagner/simplex-noise.js) - 噪声生成

## 📁 项目结构

```
homepage/
├── index.html              # 主页
├── html/                   # 源文件
├── archive/                # 历史版本
├── deploy.sh              # 快速部署脚本
├── QUICKSTART.md          # 快速开始
├── DEPLOYMENT.md          # 详细文档
└── .github/workflows/     # GitHub Actions（可选）
```

## 🔄 更新网站

```bash
git add .
git commit -m "Update content"
git push
```

## 📞 联系方式

- Email: hr@vikingtrading.net
- 地址: 上海市静安区 WeWork 越商大厦 12楼

