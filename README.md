# AI와 함께 만들어보는 나의 창업 로드맵 🚀

연세대학교 × One Degree Labs · 2일 창업 워크숍 **실습 키트**

Codex CLI를 설치하고 **아래 프롬프트 한 번만 붙여넣으면**, AI 코치가 이 저장소를 읽어
당신의 1문장 아이디어를 **9종 창업 문서**로 만들어 `roadmap/` 폴더에 저장합니다.
복잡한 설치(클론) 없이, **그냥 대화만** 하면 됩니다.

> 이 스킬팩은 [retention-corp/road-to-founders](https://github.com/retention-corp/road-to-founders)(MIT, Retention Corp)를 기반으로 Codex CLI 배포용으로 구성했습니다. 출처/라이선스는 `LICENSE`·`NOTICE.md` 참고.

---

## 1. 설치 (최초 1회)

1. **Node.js 18+** 설치 → https://nodejs.org
2. **Codex CLI** 설치:
   ```bash
   npm install -g @openai/codex
   ```
   - Windows는 **WSL** 사용을 권장합니다(강사 안내).

## 2. Codex 실행

터미널에서 아래를 실행하고, 처음이면 **ChatGPT(Business/Plus) 계정으로 로그인**합니다.

```bash
codex
```

## 3. 프롬프트 붙여넣기

아래 프롬프트를 복사해 Codex에 붙여넣고, **`[내 아이디어]`** 부분만 본인 것으로 바꿔 보내세요.

```text
https://github.com/erickimme/ai-startup-roadmap 저장소를 clone해서 읽고,
그 안의 AGENTS.md와 skills/ 를 따라 "Road to Founders" 창업 로드맵 코치로 진행해줘.

내 이름: [이름 입력]
내 창업 아이디어: [여기에 한두 문장으로 입력]

규칙:
- Stage 1(아이디어 정의서)부터 한 단계씩 진행하고, 단계마다 질문은 최대 5개만.
- 각 단계 산출물은 roadmap/ 폴더에 한국어 마크다운 파일로 저장해줘.
- 모르는 숫자는 [가정]으로 표시하고, 매 단계 '가장 약한 가정'을 짚어줘.
- 한국어로, 칭찬보다 구체적인 수정에 집중해줘.
- full 모드로 2일에 걸쳐 깊게 진행해줘 — 단계마다 필요하면 korean-synthetic-consumer(합성 소비자)와 evidence-research(근거 리서치)도 활용해 구체적으로.
먼저 환영 인사와 함께 Stage 1을 시작해줘.
모든 단계가 끝나면 bash scripts/export-docx.sh roadmap "내 이름" 으로 내 이름이 들어간 통합 문서를 만들어줘.
```

> 💡 Codex가 저장소를 가져오거나(`git clone`) `roadmap/` 폴더에 파일을 만들 때 **승인(y)** 을 물어봅니다 — 정상이니 승인하세요. 이후 코치가 1단계부터 순서대로 안내하고, 결과물이 `roadmap/` 폴더에 쌓입니다.
> 🛠 설치·로그인이 막히면 [`docs/troubleshooting.md`](docs/troubleshooting.md)를 보세요.

짧게 쓰고 싶으면 이렇게만 보내도 됩니다:

```text
https://github.com/erickimme/ai-startup-roadmap 를 활용해서 내 창업 로드맵을 만들어보고 싶어.
내 아이디어는 [여기에 한두 문장]. AGENTS.md를 읽고 Stage 1부터 진행해줘.
```

## 4. 대화 팁

| 이렇게 말하면 | 이렇게 동작 |
|---|---|
| `다음` / `계속` | 다음 단계로 |
| `더 구체적으로 고쳐줘` | 현재 문서 개선 |
| `다른 방향으로 다시` | 접근 바꿔 재작성 |
| `지금까지 뭐 만들었어?` | 완성된 파일 목록 확인 |

막히면 손들어 주세요 — 강사·조교가 도와드립니다. 🙋

## 다른 AI 환경에서 쓰기

- **Claude Code / Cursor / OpenClaw / GBrain** — 위 프롬프트의 저장소 URL을 그대로 알려주고 “AGENTS.md를 읽고 Road to Founders 스킬팩으로 진행해줘”라고 요청. `skills/manifest.json`으로 라우팅됩니다.
- **ChatGPT Plus(웹, 저장소를 못 읽는 경우)** — `prompts/bootcamp-agent-prompt.md`를 첫 메시지로 붙여넣고, 각 단계에서 필요한 `skills/<name>/SKILL.md`를 복사해 사용. 산출물은 `templates/participant-workbook.md` 양식으로 정리.

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

1. 아이디어 정의서 · 2. 비즈니스 모델 캔버스 · 3. GTM 전략서 · 4. 세일즈 플랜 · 5. 개발 로드맵
6. HR 플랜 · 7. 실행 타임라인 · 8. 피어 리뷰 · 9. **최종 수정본 + 최종 피치**

> 60초 미니 피치는 Day 1 마무리 **연습 활동**이며, 별도 산출물이 아니라 9번 최종 피치에 합쳐집니다.

빠른 참가자는 `korean-synthetic-consumer`(합성 소비자 패널)와 `vc-red-team-review`(투자자 레드팀)까지 진행합니다.

> ⚠️ 합성 소비자 패널 결과는 **시장 검증이 아니라 가설**입니다. 실제 인터뷰·결제 의향 확인으로 이어가세요.

## 결과물 내보내기 & Word에서 수정 (DOCX)

Markdown이 익숙하지 않아도 됩니다. **단계별 DOCX**를 받아 **Word에서 직접 고치는** 흐름입니다.

```bash
bash scripts/export-docx.sh roadmap "내 이름"   # → roadmap/내이름_창업로드맵.docx (통합) + roadmap/docx/01_….docx (단계별)
# 이름을 빼면 roadmap/나의_창업로드맵.docx 로 생성됩니다.
```

**수정·개선 루프**
1. 코치에게 **"문서로 내보내줘"** → Codex가 위 스크립트 실행(승인 필요).
2. `roadmap/docx/` 의 단계별 `.docx`를 **Word/한글에서 열어 직접 수정·보완**.
3. 고친 내용을 반영하는 두 가지 방법:
   - (간단·권장) 바꾼 핵심을 **코치에게 말로** 전달 → 코치가 갱신
   - (직접편집) `bash scripts/sync-docx.sh` 실행 → 수정한 docx를 md로 다시 반영 → 코치가 다음 단계에서 이어 사용
4. 마지막에 다시 내보내면 **통합 DOCX**가 최신본으로 갱신됩니다.

- 표까지 깔끔히 변환하려면 **pandoc** 필요: macOS `brew install pandoc` / Windows `choco install pandoc` / Linux `sudo apt install pandoc`. (자세히는 `docs/troubleshooting.md`)
- **가독성 서식**(맑은 고딕 · 브랜드 색 제목 · 표 테두리)은 `assets/reference.docx` 템플릿으로 자동 적용됩니다. 톤을 바꾸려면 이 파일을 Word에서 열어 스타일(제목/본문/표)만 수정해 저장하면 됩니다.
- 실제 출력 예시: `examples/sample-run-건강정보플랫폼/나의_창업로드맵.docx` (+ `bash scripts/export-docx.sh examples/sample-run-건강정보플랫폼`로 단계별 재생성)

---

## 라이선스

MIT License. retention-corp/road-to-founders(© 2026 Retention Corp)에서 파생. 자세한 출처는 `NOTICE.md`·`docs/cherry-picked-sources.md` 참고.

문의: eric.kim@onedegreelabs.io
