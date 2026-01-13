# CLAUDE.md

This file provides guidance to Claude Code for working with this repository.

## Project Overview

VikingTrading Homepage - A static corporate website for VikingTrading, a liquidity provider based in Shanghai. The site features 3D graphics and animations.

## Tech Stack

- Pure static HTML/CSS/JavaScript (no build system)
- Three.js - 3D graphics rendering
- GSAP - Animation library
- SimplexNoise - Procedural noise generation
- All libraries loaded via CDN

## Project Structure

```
homepage/
├── index.html              # Main production homepage
├── html/                   # HTML source files
│   └── vikingtrading_homepage.html
├── archive/                # Historical versions
├── deploy.sh               # Interactive deployment script
├── .github/workflows/      # GitHub Actions for auto-deploy
├── QUICKSTART.md           # Quick 3-step deployment guide
├── DEPLOYMENT.md           # Full deployment documentation
└── CNAME                   # Custom domain configuration
```

## Local Development

Preview the site locally:

```bash
# Option 1: Direct file open
open index.html

# Option 2: Local server (recommended for accurate testing)
python3 -m http.server 8000
# Visit http://localhost:8000
```

## Deployment

The site deploys to GitHub Pages automatically:

1. Push to `main` branch triggers GitHub Actions workflow
2. Workflow deploys static files to GitHub Pages
3. Custom domain configured via CNAME file

Manual deployment: `./deploy.sh`

## Key Files

- `index.html` - The live production homepage, edit this for changes
- `html/vikingtrading_homepage.html` - Source copy of the homepage
- `.github/workflows/deploy.yml` - GitHub Actions deployment workflow
- `CNAME` - Contains custom domain (vikingtrading.net)

## Development Guidelines

- This is a pure static site - no npm, no build process
- Edit `index.html` directly for content changes
- Test locally with `python3 -m http.server` before pushing
- Changes to `main` branch auto-deploy via GitHub Actions
- Keep backup copies in `archive/` when making major changes

## Common Tasks

**Update website content:**
Edit `index.html` and push to `main`

**Test changes locally:**
```bash
python3 -m http.server 8000
```

**Deploy manually:**
```bash
git add .
git commit -m "Update content"
git push
```
