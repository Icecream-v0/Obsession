<p align="center">
  <img src="../../assets/obsession-logo.svg" alt="obsession-ai" width="140" />
</p>
<p align="center">
  <strong align="center">Transforme distração em hiperfoco. Sem diagnóstico necessário!</strong>
</p>
<p align="center">
  <a href="../../LICENSE"><img src="https://img.shields.io/github/license/ayghri/obsession-ai?style=flat" alt="Licença"></a>
  <a href="https://www.npmjs.com/package/obsession-ai"><img src="https://img.shields.io/npm/v/obsession-ai" alt="Versão npm"></a>
</p>

<p align="center">
  <a href="../../README.md" title="English" aria-label="English">🇬🇧</a> ·
  <a href="README.zh-CN.md" title="简体中文" aria-label="简体中文">🇨🇳</a> ·
  <strong title="Português (Brasil)" aria-label="Português (Brasil)">🇧🇷</strong> ·
  <a href="README.ja.md" title="日本語" aria-label="日本語">🇯🇵</a> ·
  <a href="README.vi.md" title="Tiếng Việt" aria-label="Tiếng Việt">🇻🇳</a> ·
  <a href="README.ko.md" title="한국어" aria-label="한국어">🇰🇷</a> ·
  <a href="README.th.md" title="ภาษาไทย" aria-label="ภาษาไทย">🇹🇭</a>
</p>

<p align="center">
  <img src="../../assets/hero-banner.svg" alt="Obsession-AI Banner" width="600" />
</p>

## Instalação

🔗 [Instruções de instalação](../install/INSTALL.pt-BR.md)

## Funcionalidades

Uma habilidade para assistentes de codificação, impedindo-os de esconder respostas em textos longos. **Ação primeiro. Passos numerados. Modo hiperfoco ativado.**

<p align="center">
  <img src="../../assets/flow-diagram.svg" alt="Diagrama de fluxo" width="500" />
</p>

## Exemplo de mudança

<p align="center">
  <img src="../../assets/before-after.svg" alt="Comparação antes e depois" width="600" />
</p>

<table>
<tr>
<td width="50%">

### Antes

> Boa pergunta! Deixe-me pensar. Seu fluxo de autenticação tem vários componentes: middleware, verificação de token e manipulação de cookies. Após examinar `src/auth.ts`, a função `verifyToken` (linhas 42–58 aproximadamente) parece estar usando uma API antiga do `jsonwebtoken`. Uma abordagem seria atualizar este pacote e reescrever a função. Após fazer as alterações, você precisa executar os testes de autenticação para confirmar que não quebrou nada. Aliás, você também pode querer verificar todas as versões de dependências. Espero que isso ajude! Se quiser investigar mais, me avise.

</td>

<td width="50%">

### Depois

> Execute `npm install jsonwebtoken@latest`, depois edite `src/auth.ts:42`.
>
> 1. Abra `src/auth.ts`
> 2. Substitua `verifyToken` (linhas 42–58) pelo snippet abaixo
> 3. Execute `npm test -- auth.spec.ts`
>
> Próximo passo: Se algum teste falhar, cole a primeira linha do erro.

</td>
</tr>
</table>

## 10 Regras do Modo Hiperfoco

Total de 10 regras. Conteúdo completo em [SKILL.md](../../skills/obsession-ai/SKILL.md).

<p align="center">
  <img src="../../assets/platform-grid.svg" alt="Suporte a plataformas" width="600" />
</p>

1. **Comece com a próxima ação** - Comando/caminho/snippet primeiro
2. **Numere tarefas multi-etapas** - Uma ação por etapa
3. **Termine com um próximo passo concreto** - Tarefa de menos de 2 minutos
4. **Evite divagações** - Complete o problema atual primeiro
5. **Reafirme o estado a cada turno** - "Etapa 3 de 5"
6. **Estimativas de tempo específicas** - "15 minutos" não "um pouco"
7. **Torne conquistas visíveis** - Mostre o que funciona agora
8. **Erros de forma objetiva** - Declare causa e correção
9. **Limite listas a 5 itens** - Divida em "fazer agora" e "depois"
10. **Sem introdução/resumo/fechamento** - Comece com a resposta

## Plataformas suportadas

| Categoria | Plataformas |
|------|------|
| **Assistentes AI** | Claude Code, Cursor, Windsurf, GitHub Copilot, Codex, Pi, Qwen, Kimi, Gemini |
| **Editores** | VS Code, JetBrains IDEs, Vim/Neovim, Emacs, Zed |
| **Extensões** | Continue.dev, Tabnine, Cody |

## Personalização

Faça fork deste repositório, edite `skills/obsession-ai/SKILL.md` e use sua própria cópia:

```bash
claude plugin uninstall obsession-ai            # Remova a versão upstream primeiro
claude plugin marketplace remove obsession-ai   # Fork usa o mesmo nome que o upstream
claude plugin marketplace add <your-username>/obsession-ai
claude plugin install obsession-ai@obsession-ai
```

Reinicie o Claude Code e chame `/obsession-ai` novamente.

## Contribuição

Issues e Pull Requests são bem-vindos! Veja [CONTRIBUTING.md](../../CONTRIBUTING.md) para saber como participar.

## Licença

Licença MIT.

---

<p align="center">
  <strong>Se isso te faz rolar a tela uma vez a menos, pular um "Boa pergunta!", deixe uma estrela ⭐</strong>
</p>

<p align="center">
  <a href="https://github.com/ayghri/obsession-ai">Ver no GitHub</a> · 
  <a href="https://www.npmjs.com/package/obsession-ai">Ver no npm</a>
</p>
