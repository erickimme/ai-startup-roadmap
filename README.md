# AI와 함께 만들어보는 나의 창업 로드맵 🚀

연세대학교 × One Degree Labs · 2일 창업 워크숍 **실습 키트**

이 키트를 컴퓨터에 받고 **Codex CLI로 대화**하면, AI 코치가 단계별로 안내하며
당신의 1문장 아이디어를 **9종 창업 문서**로 만들어 `roadmap/` 폴더에 차곡차곡 저장합니다.
복잡한 명령 없이 **그냥 대화만** 하면 됩니다.

> 이 스킬팩은 [retention-corp/road-to-founders](https://github.com/retention-corp/road-to-founders)(MIT, Retention Corp)를 기반으로 Codex CLI 배포용으로 구성했습니다. 출처/라이선스는 `LICENSE`·`NOTICE.md` 참고.

---

## 1. 설치 (최초 1회)

1. **Node.js 18+** 설치 → https://nodejs.org
2. **Codex CLI** 설치:
   ```bash
   npm install -g @openai/codex
   ```
   - macOS/Linux는 `bash setup.sh` 로 한 번에 설치해도 됩니다.
   - Windows는 **WSL** 사용을 권장합니다(강사 안내).

## 2. 이 키트 받기

```bash
git clone https://github.com/erickimme/ai-startup-roadmap.git
cd ai-startup-roadmap
```

## 3. 시작하기 (그냥 대화하세요)

```bash
codex
```

- 처음 실행하면 **ChatGPT(Business/Plus) 계정으로 로그인**합니다.
- 로그인 후, 코치에게 이렇게 말하세요:

> 안녕! 내 창업 아이디어는 **[여기에 한두 문장]** 이야. 워크숍 시작하자.

Codex가 폴더의 `AGENTS.md`를 자동으로 읽어 **코치**가 되고, `skills/`를 라우팅하며 1단계부터 순서대로 안내합니다. 결과물은 `roadmap/` 폴더에 `.md`로 쌓입니다.

| 이렇게 말하면 | 이렇게 동작 |
|---|---|
| `다음` / `계속` | 다음 단계로 |
| `더 구체적으로 고쳐줘` | 현재 문서 개선 |
| `다른 방향으로 다시` | 접근 바꿔 재작성 |
| `지금까지 뭐 만들었어?` | 완성된 파일 목록 확인 |

막히면 손들어 주세요 — 강사·조교가 도와드립니다. 🙋

## 다른 AI 환경에서 쓰기

- **Claude Code / Cursor / OpenClaw / GBrain** — repo를 열고 “AGENTS.md를 읽고 Road to Founders 스킬팩으로 진행해줘”라고 요청. `skills/manifest.json`으로 라우팅됩니다.
- **ChatGPT Plus(웹, repo를 못 읽는 경우)** — `prompts/bootcamp-agent-prompt.md`를 첫 메시지로 붙여넣고, 각 단계에서 필요한 `skills/<name>/SKILL.md`를 복사해 사용. 산출물은 `templates/participant-workbook.md` 양식으로 정리.

## 구성

```text
.
├── AGENTS.md        # 에이전트 공통 코치 지침 (Codex가 자동 로드)
├── skills/          # 단계별 스킬 14종 + manifest.json (orchestrator가 라우팅)
├── templates/       # 참가자 워크북 · 피어리뷰 체크리스트 · 합성소비자 템플릿
├── prompts/         # ChatGPT용 부트캠프 프롬프트 / 단계별 프롬프트
├── docs/            # 강사용 runbook(분 단위 진행표) · 호환성 · 출처
├── roadmap/         # ← 내 산출물(.md)이 여기에 쌓입니다
└── knowledge/       # (선택) 전문가 자료를 넣으면 코치가 참고
```

## 결과물 (9종)

1. 아이디어 정의서 · 2. 비즈니스 모델 캔버스 · 3. GTM 전략서 · 4. 세일즈 플랜 · 5. 미니 피칭
6. 개발 로드맵 · 7. HR 플랜 · 8. 실행 타임라인 · 9. 피어 리뷰 → **최종 수정본 + 최종 피치**

빠른 참가자는 `korean-synthetic-consumer`(합성 소비자 패널)와 `vc-red-team-review`(투자자 레드팀)까지 진행합니다.

> ⚠️ 합성 소비자 패널 결과는 **시장 검증이 아니라 가설**입니다. 실제 인터뷰·결제 의향 확인으로 이어가세요.

---

## 라이선스

MIT License. retention-corp/road-to-founders(© 2026 Retention Corp)에서 파생. 자세한 출처는 `NOTICE.md`·`docs/cherry-picked-sources.md` 참고.

문의: eric.kim@onedegreelabs.io
