# 第一阶段：构建应用

FROM node:20-alpine AS build-stage

  

# 设置工作目录

WORKDIR /app

  

# 复制 package.json 和 package-lock.json

COPY package*.json ./

  

# 安装依赖

RUN npm install

  

# 复制项目文件

COPY . .

  

# 构建应用

RUN npm run build

  

# 第二阶段：生产环境

FROM nginx:stable-alpine AS production-stage

  

# 复制自定义 nginx 配置

COPY nginx.conf /etc/nginx/conf.d/default.conf

  

# 从构建阶段复制构建好的文件到 nginx 目录

COPY --from=build-stage /app/dist /usr/share/nginx/html

  

# 暴露 80 端口

EXPOSE 80

  

# 启动 nginx

CMD ["nginx", "-g", "daemon off;"]