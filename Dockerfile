FROM dockerproxy.cn/alpine/git:2.45.2 as git

WORKDIR /app
# 在 Dockerfile 开头添加环境变量
ARG GITLAB_TOKEN=PCRBvaxZ5ynyPS7FHNyh

ENV GITLAB_TOKEN=${GITLAB_TOKEN}


# 克隆 GitLab 仓库（请更改为你的仓库地址）
RUN git clone --branch master https://oauth2:${GITLAB_TOKEN}@gitlab.datacanvas.com/ydyd/wedding_web.git .


# 使用 Node.js  镜像作为基础镜像
FROM dockerproxy.cn/node:22.9.0-slim as node
# 设置工作目录
WORKDIR /app

# 安装 Git 以便拉取代码
# RUN apt-get update && apt-get install -y git

# 将构建好的文件复制到 NGINX 的 HTML 目录中
COPY --from=git /app /app

# COPY .umirc.ts /app

# 安装依赖
RUN npm config set registry https://registry.npm.taobao.org && \
    npm install --force

# 构建前端应用
RUN npm run build

# 使用 nginx 作为生产环境的服务器
FROM dockerproxy.cn/nginx:1.27.1-alpine

# 删除默认的 NGINX 网站内容
RUN rm -rf /usr/share/nginx/html/*

# 将构建好的文件复制到 NGINX 的 HTML 目录中
COPY --from=node /app/dist /usr/share/nginx/html

# 暴露 NGINX 默认端口
EXPOSE 80

# 启动 NGINX
CMD ["nginx", "-g", "daemon off;"]


# docker build --no-cache --build-arg GITLAB_TOKEN=PCRBvaxZ5ynyPS7FHNyh -t tableagent-registry.cn-beijing.cr.aliyuncs.com/wedding/wedding-web:1.0.0 .

# docker push tableagent-registry.cn-beijing.cr.aliyuncs.com/wedding/wedding-web:1.0.0
