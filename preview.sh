#!/bin/bash
# 简化版本地预览脚本 - 只使用本地Jekyll

echo "🚀 启动Jekyll本地服务器..."
echo "📁 网站目录: $(pwd)"
echo "🌐 访问地址: http://localhost:4000"
echo ""

# 函数：检查命令是否存在
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# 函数：使用本地Jekyll启动
start_with_local_jekyll() {
  echo "💻 使用本地Jekyll启动..."
  if command_exists jekyll; then
    jekyll serve --livereload --host localhost --port 4000
  else
    echo "❌ Jekyll未安装"
    return 1
  fi
}

# 主启动逻辑
echo "🔍 检测可用启动方式..."

# 尝试本地Jekyll
if start_with_local_jekyll; then
  exit 0
fi

echo "---"

# Jekyll启动失败，提供安装指导
echo "❌ 无法启动Jekyll服务器"
echo ""
echo "📋 安装选项："
echo "1. 💎 安装Jekyll"
echo "   - 需要Ruby ≥ 3.0"
echo "   - 安装Ruby：brew install ruby  # macOS"
echo "   - 安装Jekyll：gem install jekyll bundler"
echo "   - 然后运行：./preview.sh"
echo ""
echo "2. 📦 使用Bundler（如果已有Ruby 3.0+）"
echo "   - gem install bundler"
echo "   - bundle install"
echo "   - 然后运行：bundle exec jekyll serve --livereload --host localhost --port 4000"
echo ""
echo "💡 提示：如果已经安装Jekyll但找不到命令，请确保Jekyll的可执行路径在PATH环境变量中"