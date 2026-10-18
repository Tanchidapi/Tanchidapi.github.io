# Pages CMS 写作说明

## 首次使用

1. 打开 [Pages CMS](https://pagescms.org/)，使用 GitHub 账号登录。
2. 授权 Pages CMS 访问 `Tanchidapi/Tanchidapi.github.io`。
3. 选择这个仓库，进入“文章”集合。

仓库根目录的 `.pages.yml` 已经配置好文章和图片目录。文章会保存到 `_posts`，图片会保存到 `imgs`，保存后 Pages CMS 会提交到 GitHub。

## 新建文章

- 选择已有分类目录，或创建一个新的分类子目录。
- 填写标题、日期、分类和标签。
- `永久链接` 必须唯一，建议使用 `/posts/分类/文章名/` 的形式。
- 正文使用 Markdown 编辑器编写。
- 插入图片时选择媒体库中的图片，链接会使用 `/imgs/...` 路径。

保存到 `main` 分支后，GitHub Actions 会自动构建并发布网站。发布前可以先保存到分支，再通过 Pull Request 合并到 `main`。

## 文件格式

Pages CMS 创建的文章应保持以下 Front Matter 结构：

```yaml
---
title: 文章标题
date: 2026-10-18 20:00:00 +0800
categories: [算法]
tags: [动态规划]
permalink: /posts/算法/文章标题/
---
```
