#!/bin/bash
# 智能本地预览脚本

echo "🚀 启动Jekyll本地服务器..."
echo "📁 网站目录: $(pwd)"
echo "🌐 访问地址: http://localhost:4000"
echo ""

# 函数：检查命令是否存在
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# 函数：使用Docker启动
start_with_docker() {
  echo "🐳 使用Docker启动..."
  if command_exists docker && command_exists docker-compose; then
    # 检查是否已有镜像
    if ! docker images | grep -q jekyll-site; then
      echo "📦 构建Docker镜像..."
      docker-compose build
    fi
    echo "🚀 启动Docker容器..."
    docker-compose up
  else
    echo "❌ Docker或docker-compose未安装"
    return 1
  fi
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

# 函数：使用Bundler启动
start_with_bundler() {
  echo "📦 使用Bundler启动..."
  if [ -f "Gemfile" ]; then
    if command_exists bundle; then
      echo "📦 安装依赖..."
      bundle install
      echo "🚀 启动服务器..."
      bundle exec jekyll serve --livereload --host localhost --port 4000
    else
      echo "❌ Bundler未安装"
      return 1
    fi
  else
    echo "❌ 未找到Gemfile"
    return 1
  fi
}

# 主启动逻辑
echo "🔍 检测可用启动方式..."

# 优先尝试Docker
if start_with_docker; then
  exit 0
fi

echo "---"

# 尝试本地Jekyll
if start_with_local_jekyll; then
  exit 0
fi

echo "---"

# 尝试Bundler
if start_with_bundler; then
  exit 0
fi

echo "---"

# 所有方式都失败，提供安装指导
echo "❌ 无法启动Jekyll服务器"
echo ""
echo "📋 安装选项："
echo "1. 🐳 安装Docker（推荐）"
echo "   - 访问：https://docs.docker.com/get-docker/"
echo "   - 然后运行：./preview.sh"
echo ""
echo "2. 💎 安装Jekyll"
echo "   - 需要Ruby ≥ 3.0"
echo "   - 安装Ruby：brew install ruby  # macOS"
echo "   - 安装Jekyll：gem install jekyll bundler"
echo "   - 然后运行：./preview.sh"
echo ""
echo "3. 📦 安装Bundler（如果已有Ruby 3.0+）"
echo "   - gem install bundler"
echo "   - bundle install"
echo "   - 然后运行：./preview.sh"
echo ""
echo "💡 提示：Docker方式最可靠，无需安装Ruby/Jekyll"