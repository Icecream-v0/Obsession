<p align="center">
  <img src="../../assets/obsession-logo.svg" alt="obsession-ai" width="140" />
</p>
<p align="center">
  <strong align="center">将分心转化为超聚焦。无需确诊！</strong>
</p>
<p align="center">
  <a href="../../LICENSE"><img src="https://img.shields.io/github/license/ayghri/obsession-ai?style=flat" alt="许可证"></a>
  <a href="https://www.npmjs.com/package/obsession-ai"><img src="https://img.shields.io/npm/v/obsession-ai" alt="npm 版本"></a>
</p>

<p align="center">
  <a href="../../README.md" title="English" aria-label="English">🇬🇧</a> ·
  <strong title="简体中文" aria-label="简体中文">🇨🇳</strong> ·
  <a href="README.pt-BR.md" title="Português (Brasil)" aria-label="Português (Brasil)">🇧🇷</a> ·
  <a href="README.ja.md" title="日本語" aria-label="日本語">🇯🇵</a> ·
  <a href="README.vi.md" title="Tiếng Việt" aria-label="Tiếng Việt">🇻🇳</a> ·
  <a href="README.ko.md" title="한국어" aria-label="한국어">🇰🇷</a> ·
  <a href="README.th.md" title="ภาษาไทย" aria-label="ภาษาไทย">🇹🇭</a>
</p>

<p align="center">
  <img src="../../assets/hero-banner.svg" alt="Obsession-AI Banner" width="600" />
</p>

## 安装

🔗 [安装说明](../install/INSTALL.zh-CN.md)

## 功能

这是一个面向编程助手的技能，阻止它把答案藏在冗长文字中。**行动优先。步骤编号。开启超聚焦模式。**

<p align="center">
  <img src="../../assets/flow-diagram.svg" alt="工作流程图" width="500" />
</p>

## 有什么变化

<p align="center">
  <img src="../../assets/before-after.svg" alt="前后对比" width="600" />
</p>

<table>
<tr>
<td width="50%">

### 之前

> 问得好！让我想一想。你的身份验证流程包含几个环节：中间件、令牌验证和 Cookie 处理。查看 `src/auth.ts` 后，`verifyToken` 函数（大约第 42–58 行）似乎使用了旧版 `jsonwebtoken` API。一种做法是升级这个包并重写该函数。完成修改后，你需要运行身份验证测试，确认没有破坏任何功能。顺便一提，你可能还想整体检查一下依赖版本。希望这能帮到你！如果你想进一步研究，请告诉我。

</td>

<td width="50%">

### 之后

> 运行 `npm install jsonwebtoken@latest`，然后编辑 `src/auth.ts:42`。
>
> 1. 打开 `src/auth.ts`
> 2. 将 `verifyToken`（第 42–58 行）替换为下面的代码片段
> 3. 运行 `npm test -- auth.spec.ts`
>
> 下一步：如果有测试失败，请粘贴第一行报错。

</td>
</tr>
</table>

## 超聚焦模式的 10 条规则

共 10 条规则。完整内容见 [SKILL.md](../../skills/obsession-ai/SKILL.md)。

<p align="center">
  <img src="../../assets/platform-grid.svg" alt="平台支持" width="600" />
</p>

1. **先说下一步行动** - 命令/路径/代码片段优先
2. **多步骤任务使用编号** - 每步一个动作
3. **以一个具体的下一步结束** - 少于 2 分钟的工作
4. **避免离题** - 先完成当前问题
5. **每轮都重述当前状态** - "第 3 步，共 5 步"
6. **给出明确的时间估计** - "15 分钟"而非"一会儿"
7. **让成果清晰可见** - 展示现在什么能用
8. **客观陈述错误** - 说明原因和修复方法
9. **每个列表最多 5 项** - 分为"现在做"和"稍后做"
10. **不写开场白、回顾或结束语** - 直接开始答案

## 支持的平台

| 类别 | 平台 |
|------|------|
| **AI 助手** | Claude Code, Cursor, Windsurf, GitHub Copilot, Codex, Pi, Qwen, Kimi, Gemini |
| **编辑器** | VS Code, JetBrains IDEs, Vim/Neovim, Emacs, Zed |
| **扩展** | Continue.dev, Tabnine, Cody |

## 自定义

Fork 此仓库，编辑 `skills/obsession-ai/SKILL.md`，然后换成你的副本：

```bash
claude plugin uninstall obsession-ai            # 先移除上游副本
claude plugin marketplace remove obsession-ai   # fork 与上游使用相同名称
claude plugin marketplace add <your-username>/obsession-ai
claude plugin install obsession-ai@obsession-ai
```

重启 Claude Code，然后再次调用 `/obsession-ai`。

## 贡献

欢迎提交 Issue 和 Pull Request！查看 [CONTRIBUTING.md](../../CONTRIBUTING.md) 了解如何参与。

## 许可证

MIT 许可证。

---

<p align="center">
  <strong>如果它让你少滚动一次屏幕、跳过一句"问得好！"，请点亮 Star ⭐</strong>
</p>

<p align="center">
  <a href="https://github.com/ayghri/obsession-ai">在 GitHub 上查看</a> · 
  <a href="https://www.npmjs.com/package/obsession-ai">在 npm 上查看</a>
</p>
