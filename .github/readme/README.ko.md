<p align="center">
  <img src="../../assets/obsession-logo.svg" alt="obsession-ai" width="140" />
</p>
<p align="center">
  <strong align="center">산만함을 초집중력으로 바꾸세요. 진단 불필요!</strong>
</p>
<p align="center">
  <a href="../../LICENSE"><img src="https://img.shields.io/github/license/ayghri/obsession-ai?style=flat" alt="라이선스"></a>
  <a href="https://www.npmjs.com/package/obsession-ai"><img src="https://img.shields.io/npm/v/obsession-ai" alt="npm 버전"></a>
</p>

<p align="center">
  <a href="../../README.md" title="English" aria-label="English">🇬🇧</a> ·
  <a href="README.zh-CN.md" title="简体中文" aria-label="简体中文">🇨🇳</a> ·
  <a href="README.pt-BR.md" title="Português (Brasil)" aria-label="Português (Brasil)">🇧🇷</a> ·
  <a href="README.ja.md" title="日本語" aria-label="日本語">🇯🇵</a> ·
  <a href="README.vi.md" title="Tiếng Việt" aria-label="Tiếng Việt">🇻🇳</a> ·
  <strong title="한국어" aria-label="한국어">🇰🇷</strong> ·
  <a href="README.th.md" title="ภาษาไทย" aria-label="ภาษาไทย">🇹🇭</a>
</p>

<p align="center">
  <img src="../../assets/hero-banner.svg" alt="Obsession-AI Banner" width="600" />
</p>

## 설치

🔗 [설치 안내](../install/INSTALL.ko.md)

## 기능

코딩 어시스턴트가 긴 설명 속에 답을 숨기지 않도록 하는 스킬입니다. **행동 우선. 단계 번호 매기기. 초집중 모드 켜기.**

<p align="center">
  <img src="../../assets/flow-diagram.svg" alt="워크플로우 다이어그램" width="500" />
</p>

## 변화 예시

<p align="center">
  <img src="../../assets/before-after.svg" alt="비교" width="600" />
</p>

<table>
<tr>
<td width="50%">

### 이전

> 좋은 질문입니다! 생각해보죠. 인증 플로우에는 미들웨어, 토큰 검증, 쿠키 처리 등 몇 가지 요소가 있습니다. `src/auth.ts` 를 보면 `verifyToken` 함수 (42~58 행 근처) 가 오래된 `jsonwebtoken` API 를 사용하는 것 같습니다. 한 가지 방법은 패키지를 업그레이드하고 함수를 다시 작성하는 것입니다. 변경 후에는 인증 테스트를 실행하여 문제가 없는지 확인해야 합니다.ついでに、의존성 버전도 전체적으로 확인하는 것이 좋을 수 있습니다. 도움이 되었으면 좋겠습니다! 더 자세히 조사하고 싶다면 알려주세요.

</td>

<td width="50%">

### 이후

> `npm install jsonwebtoken@latest` 실행 후 `src/auth.ts:42` 편집.
>
> 1. `src/auth.ts` 열기
> 2. `verifyToken` 함수 (42~58 행) 를 아래 스니펫으로 교체
> 3. `npm test -- auth.spec.ts` 실행
>
> 다음 단계: 테스트가 실패하면 첫 번째 오류 줄을 붙여넣으세요.

</td>
</tr>
</table>

## 초집중 모드의 10 가지 규칙

총 10 가지 규칙. 자세한 내용은 [SKILL.md](../../skills/obsession-ai/SKILL.md) 를 참조하세요.

<p align="center">
  <img src="../../assets/platform-grid.svg" alt="플랫폼 지원" width="600" />
</p>

1. **다음 행동부터 말하기** - 명령/경로/스니펫 우선
2. **다단계 작업은 번호 매기기** - 단계당 하나의 동작
3. **구체적인 다음 단계로 종료** - 2 분 이내 작업
4. **딴 길로 새지 않기** - 현재 문제 먼저 완료
5. **매번 상태 다시 말하기** - "5 단계 중 3 단계"
6. **명확한 시간 추정** - "잠시" 대신 "15 분"
7. **성과를 눈에 보이게** - 지금 작동하는 것 보여주기
8. **오류는 사실대로** - 원인과 수정 방법 명시
9. **리스트는 최대 5 개 항목** - "지금 할 일"과 "나중에 할 일"로 분리
10. **서론·요약·결론 없음** - 답부터 시작

## 지원 플랫폼

| 카테고리 | 플랫폼 |
|------|------|
| **AI 어시스턴트** | Claude Code, Cursor, Windsurf, GitHub Copilot, Codex, Pi, Qwen, Kimi, Gemini |
| **에디터** | VS Code, JetBrains IDEs, Vim/Neovim, Emacs, Zed |
| **확장기능** | Continue.dev, Tabnine, Cody |

## 커스터마이징

이 저장소를 포크하고 `skills/obsession-ai/SKILL.md` 를 편집한 후 자신의 사본을 사용하세요:

```bash
claude plugin uninstall obsession-ai            # 먼저 업스트림 제거
claude plugin marketplace remove obsession-ai   # 포크는 업스트림과 같은 이름 사용
claude plugin marketplace add <your-username>/obsession-ai
claude plugin install obsession-ai@obsession-ai
```

Claude Code 를 재시작한 후 `/obsession-ai` 를 다시 호출하세요.

## 기여

이슈와 풀 리퀘스트를 환영합니다! 참여 방법은 [CONTRIBUTING.md](../../CONTRIBUTING.md) 를 참조하세요.

## 라이선스

MIT 라이선스.

---

<p align="center">
  <strong>스크롤을 한 번 줄이고 "좋은 질문입니다!"를 건너뛸 수 있다면 스타를 눌러주세요 ⭐</strong>
</p>

<p align="center">
  <a href="https://github.com/ayghri/obsession-ai">GitHub 에서 보기</a> · 
  <a href="https://www.npmjs.com/package/obsession-ai">npm 에서 보기</a>
</p>
