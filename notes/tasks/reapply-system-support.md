# 重新迁移系统支持

## 做了什么

- 将 `main` 硬回退到错误大范围同步之前的 `1059152`，并重新按小范围迁移系统支持。
- 保留本项目原有交互逻辑，不引入上游 `prompt_username`，`rocky 10` 不会额外询问用户名。
- 保守增加/更新现有发行版支持：Rocky/AlmaLinux/Oracle/RedHat 10，Anolis/OpenCloudOS 23，Debian 13，Ubuntu 26.04，Alpine 3.22-3.24，openSUSE 16.0，Fedora 43/44，NixOS 26.05。
- 恢复 Windows ISO 自动查找的新版 Massgrave 页面解析和 Server 2025/VLSC 匹配。

## 改了哪些文件

- `reinstall.sh`
- `README.md`
- `README.en.md`

## 验证

- 已执行：`bash -n <(tr -d '\r' < reinstall.sh)` 语法检查通过。
- 已执行：静态确认没有 `prompt_username` / `read Username`，只保留最终 `Username: $username` 输出。
- 已执行：确认 `rocky 10` 进入支持列表，Rocky 10 镜像和 BaseOS mirrorlist 使用新路径。

## 后续待办

- 如需迁移 AOSC / fnOS / FygoOS 等新增系统，需要单独评估 `trans.sh` 安装流程，不能再整文件覆盖。
