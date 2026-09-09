<p align="center">
  <img src="../../assets/obsession-logo.svg" alt="obsession-ai" width="140" />
</p>
<p align="center">
  <strong align="center">散漫を強集中力に変える。診断は不要！</strong>
</p>
<p align="center">
  <a href="../../LICENSE"><img src="https://img.shields.io/github/license/ayghri/obsession-ai?style=flat" alt="ライセンス"></a>
  <a href="https://www.npmjs.com/package/obsession-ai"><img src="https://img.shields.io/npm/v/obsession-ai" alt="npm バージョン"></a>
</p>

<p align="center">
  <a href="../../README.md" title="English" aria-label="English">🇬🇧</a> ·
  <a href="README.zh-CN.md" title="简体中文" aria-label="简体中文">🇨🇳</a> ·
  <a href="README.pt-BR.md" title="Português (Brasil)" aria-label="Português (Brasil)">🇧🇷</a> ·
  <strong title="日本語" aria-label="日本語">🇯🇵</strong> ·
  <a href="README.vi.md" title="Tiếng Việt" aria-label="Tiếng Việt">🇻🇳</a> ·
  <a href="README.ko.md" title="한국어" aria-label="한국어">🇰🇷</a> ·
  <a href="README.th.md" title="ภาษาไทย" aria-label="ภาษาไทย">🇹🇭</a>
</p>

<p align="center">
  <img src="../../assets/hero-banner.svg" alt="Obsession-AI Banner" width="600" />
</p>

## インストール

🔗 [インストール手順](../install/INSTALL.ja.md)

## 機能

コーディングアシスタントの回答を長文で埋めさせないようにするスキル。**行動最優先。手順を番号付け。強集中力モードをオン。**

<p align="center">
  <img src="../../assets/flow-diagram.svg" alt="ワークフロー図" width="500" />
</p>

## 変化の例

<p align="center">
  <img src="../../assets/before-after.svg" alt="前後比較" width="600" />
</p>

<table>
<tr>
<td width="50%">

### 適用前

> 良い質問ですね！考えてみましょう。認証フローには、ミドルウェア、トークン検証、Cookie の処理といういくつかの要素があります。`src/auth.ts` を見ると、`verifyToken` 関数（42〜58 行目付近）は古い `jsonwebtoken` API を使っているようです。一つの方法としては、パッケージを更新してその関数を書き直すことです。変更後は、認証テストを実行して問題が起きていないことを確認するとよいでしょう。ついでに、依存関係のバージョンも全体的に確認したほうがよいかもしれません。お役に立てれば幸いです！さらに詳しく調べたい場合はお知らせください。

</td>

<td width="50%">

### 適用後

> `npm install jsonwebtoken@latest` を実行し、`src/auth.ts:42` を編集。
>
> 1. `src/auth.ts` を開く
> 2. `verifyToken` 関数（42〜58 行目）を以下のスニペットに置換
> 3. `npm test -- auth.spec.ts` を実行
>
> 次のステップ：テストが失敗したら、エラーの 1 行目を貼り付けてください。

</td>
</tr>
</table>

## 強集中力モードの 10 ルール

全 10 ルール。詳細は [SKILL.md](../../skills/obsession-ai/SKILL.md)。

<p align="center">
  <img src="../../assets/platform-grid.svg" alt="プラットフォーム対応" width="600" />
</p>

1. **次のアクションから始める** - コマンド/パス/スニペットを最初に
2. **複数ステップは番号付け** - 1 ステップ 1 アクション
3. **具体的な次のステップで終わる** - 2 分以内の作業
4. **脱線しない** - 現在のタスクを先に完了
5. **毎回状態を再確認** - 「5 ステップ中 3 ステップ目」
6. **明確な時間見積もり** - 「しばらく」ではなく「15 分」
7. **成果を目に見える形で** - 何が今動くかを示す
8. **エラーは事実ベース** - 原因と修正方法を述べる
9. **リストは最大 5 項目** - 「今やる」と「後でやる」に分割
10. **前置き・要約・結びなし** - 答えから始める

## 対応プラットフォーム

| カテゴリ | プラットフォーム |
|------|------|
| **AI アシスタント** | Claude Code, Cursor, Windsurf, GitHub Copilot, Codex, Pi, Qwen, Kimi, Gemini |
| **エディタ** | VS Code, JetBrains IDEs, Vim/Neovim, Emacs, Zed |
| **拡張機能** | Continue.dev, Tabnine, Cody |

## カスタマイズ

このリポジトリをフォークし、`skills/obsession-ai/SKILL.md` を編集して、自分のコピーを使用：

```bash
claude plugin uninstall obsession-ai            # 最初にアップストリームを削除
claude plugin marketplace remove obsession-ai   # フORK はアップストリームと同じ名前
claude plugin marketplace add <your-username>/obsession-ai
claude plugin install obsession-ai@obsession-ai
```

Claude Code を再起動し、`/obsession-ai` を再度呼び出します。

## 貢献

Issue と Pull Request を歓迎します！参加方法は [CONTRIBUTING.md](../../CONTRIBUTING.md) をご覧ください。

## ライセンス

MIT ライセンス。

---

<p align="center">
  <strong>スクロールを 1 回減らし、「良い質問ですね！」をスキップできるなら、スターをつけてください ⭐</strong>
</p>

<p align="center">
  <a href="https://github.com/ayghri/obsession-ai">GitHub で見る</a> · 
  <a href="https://www.npmjs.com/package/obsession-ai">npm で見る</a>
</p>
