# 에이전트 호환성

이 저장소는 특정 LLM 제품에 종속되지 않도록 설계했습니다.

## ChatGPT Plus

- 참가자가 가장 쉽게 쓰는 기본 모드입니다.
- 저장소를 직접 읽지 못하면 `prompts/bootcamp-agent-prompt.md`와 필요한 `skills/*/SKILL.md`를 복사해 붙여넣습니다.
- 파일 실행이나 장기 메모리는 기대하지 않습니다.

## Claude Code / Cursor / Codex

- 저장소 전체를 읽을 수 있는 경우 `AGENTS.md`를 먼저 읽습니다.
- `skills/manifest.json`에서 필요한 스킬을 고릅니다.
- 산출물은 Markdown으로 생성합니다.

## OpenClaw / GBrain

- `skills/` 디렉터리를 스킬팩으로 설치하거나 참조합니다.
- GBrain 전체 기능이 없어도 Markdown 스킬로 동작합니다.
- GBrain이 있으면 리서치, 보고서 저장, 출처 관리가 더 강해집니다.

## 공통 규칙

- 한국어 출력
- 단계별 진행
- 합성 패널은 가설로 표시
- 근거 없는 숫자는 `[가정]`으로 표시
- 최종 산출물은 `templates/participant-workbook.md` 형식을 따른다
