# Cherry-picked sources

이 저장소는 두 공개 하네스에서 캠프에 필요한 아이디어만 선별했습니다.

## garrytan/gbrain

선별한 개념:

- 스킬을 `SKILL.md` 단위로 분리하는 방식
- `manifest.json`으로 스킬을 라우팅하는 방식
- 리서치, 보고서, 스킬 생성, 지식 축적을 분리하는 방식
- 에이전트가 먼저 근거를 찾고, 없으면 가정을 명시하는 방식

가져오지 않은 것:

- GBrain 데이터베이스, MCP 서버, 데몬, 전체 CLI
- 개인 지식 그래프 운영 코드
- 장기 메모리/드림 사이클

캠프에서는 참가자가 복잡한 설치 없이 ChatGPT Plus만 써야 하므로, GBrain의 실행 시스템이 아니라 스킬 설계 철학만 경량화했습니다.

## hackinggrowth/korean-synthetic-consumer

선별한 개념:

- 한국형 합성 소비자 패널
- `message-test`, `product-fit`, `objection-map`, `persona-panel`, `interview-script`, `full-report` 모드
- 합성 패널 결과를 가설로만 취급하는 안전 문구

가져오지 않은 것:

- Hugging Face 데이터셋 다운로드 자동화
- Python 샘플러 실행 필수 요구사항
- 팀 캐시 운영 방식

캠프에서는 빠른 진행이 중요하므로, 합성 패널은 템플릿과 프롬프트 중심으로 사용합니다. 실제 운영 환경에서는 원본 repo의 sampler를 붙일 수 있습니다.
