#!/bin/bash
# 本地预览脚本 - 使用 Bundler 锁定项目依赖

echo "🚀 启动Jekyll本地服务器..."
echo "📁 网站目录: $(pwd)"
echo "🌐 访问地址: http://localhost:4000"
echo ""

# 函数：检查命令是否存在
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

echo "🔍 检测可用启动方式..."

if [ ! -f "Gemfile" ]; then
  echo "❌ 当前目录中未找到 Gemfile"
  echo "请在网站项目根目录运行此脚本。"
  exit 1
fi

if ! command_exists bundle; then
  echo "❌ Bundler 未安装"
  echo "请先运行：gem install bundler"
  exit 1
fi

if ! bundle check >/dev/null 2>&1; then
  echo "📦 项目依赖尚未安装，请先运行：bundle install"
  exit 1
fi

echo "💻 使用 Bundler 启动 Jekyll..."
echo "🔄 文件修改后会自动重新构建；请手动刷新浏览器查看。"
exec bundle exec jekyll serve --quiet --host localhost --port 4000
