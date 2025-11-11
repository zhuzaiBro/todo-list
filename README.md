# GitHub Actions入门

GitHub Actions 是 **GitHub 官方提供的一套自动化工作流（CI/CD）系统**，用于在代码仓库中 **自动执行任务**，比如：

- 自动构建（build）
    
- 自动测试（test）
    
- 自动部署（deploy）
    
- 自动发布版本（release）
    
- 自动格式化、Lint、打包、同步分支等
    

---

### 🧩 一句话理解

> GitHub Actions 就是一个**能帮你在 GitHub 上自动运行脚本的机器人**。  
> 当你提交代码、发 PR、打 tag、发布 release 时，它会自动触发你定义好的任务流程。

---

### ⚙️ 基本概念

| 概念                | 说明                                                  |
| ----------------- | --------------------------------------------------- |
| **Workflow（工作流）** | 整个自动化流程的配置文件，一般放在 `.github/workflows/` 目录下。         |
| **Job（任务）**       | 一个工作流里可以有多个任务（job），每个任务在独立的虚拟机环境中运行。                |
| **Step（步骤）**      | 每个任务由多个步骤组成，步骤可以执行命令或调用现成的 action。                  |
| **Action（动作）**    | 可复用的任务片段，比如 “Checkout 代码”、“设置 Node.js 环境”、“部署到服务器”。 |
| **Runner（运行环境）**  | 实际执行任务的虚拟机，可以是 GitHub 提供的云端 runner，也可以是你自己的服务器。     |

---

### 📂 示例

下面是一个简单的 GitHub Actions 配置，自动在推送代码时运行测试：

```yaml
# 文件路径：.github/workflows/test.yml
name: Run Tests

on: [push, pull_request] # 触发条件：代码提交或PR时

jobs:
  test:
    runs-on: ubuntu-latest  # 运行环境
    steps:
      - name: Checkout code
        uses: actions/checkout@v4  # 拉取代码
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: 18
      - name: Install dependencies
        run: npm install
      - name: Run tests
        run: npm test
```

---

### 🚀 常见用途

1. **持续集成（CI）**：自动运行测试、构建项目。
    
2. **持续部署（CD）**：自动发布网站、推送到服务器或云服务。
    
3. **代码质量控制**：自动执行 ESLint、Prettier、TypeScript 检查等。
    
4. **发布自动化**：自动生成 changelog、打包、上传 npm、发布 Docker 镜像。
    
5. **自定义任务**：比如自动评论 PR、同步文档、生成静态资源等。
    

---

### 💡 优点

- 内置在 GitHub，无需额外 CI 工具。
    
- 支持 **YAML 配置**，简单直观。
    
- 拥有 **海量开源 action 模块**（在 [GitHub Marketplace](https://github.com/marketplace?type=actions)）。
    
- 可与 GitHub 的分支、PR、标签、issue 等紧密集成。
    
- 免费额度充足（尤其对开源项目）。
    

---

如果你愿意，我可以帮你写一个 **适用于你项目类型的 GitHub Actions 模板**（例如前端构建部署、Rust 编译、Docker 自动发布等）。  
你想我帮你哪个类型？