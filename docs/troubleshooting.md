# 설치·실행 트러블슈팅 (현장용)

대부분의 문제는 ① Node 미설치 ② 전역 설치 권한 ③ 로그인 ④ 승인 단계에서 생깁니다.

## 0. 빠른 점검
```bash
node -v   # v18 이상이면 OK
codex --version   # 버전이 나오면 설치 OK
```

## 1. `node: command not found`
- Node.js가 없습니다. https://nodejs.org 에서 LTS 설치 후 터미널을 새로 엽니다.
- 회사/학교 노트북이라 설치가 막히면 강사에게 문의(백업 환경 제공).

## 2. `npm install -g` 권한 오류 (EACCES / permission denied)
- macOS/Linux: 앞에 `sudo` 를 붙여 `sudo npm install -g @openai/codex`
- 또는 nvm 사용자는 `sudo` 없이 그대로 다시 시도(셸 재시작 후).
- Windows: PowerShell을 **관리자 권한**으로 실행.

## 3. `codex: command not found` (설치는 됐는데 실행 안 됨)
- 터미널을 완전히 닫았다가 다시 엽니다(PATH 갱신).
- 그래도 안 되면 `npm bin -g` 경로가 PATH에 있는지 확인하거나 강사 호출.

## 4. 로그인이 안 돼요
- `codex` 실행 시 안내되는 로그인은 **ChatGPT(Business/Plus) 계정**입니다. 회사 SSO 계정이 아니라 워크숍용 계정으로 로그인하세요(강사 안내).
- 브라우저가 안 열리면 터미널에 표시되는 URL을 직접 복사해 엽니다.

## 5. "git clone 해도 될까요?" / 파일을 만들어도 될까요? 라고 물어봐요
- **정상입니다.** Codex는 저장소를 가져오거나 `roadmap/` 폴더에 파일을 쓰기 전 승인을 요청합니다.
- `y`(또는 Enter)로 **승인**하세요. 매번 물어보는 게 번거로우면 세션 동안 허용을 선택해도 됩니다.

## 6. Windows에서 자꾸 막혀요
- **WSL(Ubuntu)** 사용을 권장합니다. WSL 터미널에서 Node·Codex를 설치하면 macOS와 동일하게 동작합니다.

## 7. 한국어 응답이 영어로 나와요
- "한국어로 진행해줘"라고 한 번 말하면 됩니다. (AGENTS.md 기본값은 한국어)

## 8. 결과가 부실하거나 너무 일반적이에요
- "내 상황( ___ )에 맞춰 더 구체적으로 고쳐줘", "숫자는 [가정]으로 표시하고 근거를 붙여줘"라고 요청하세요.
- 그래도 막히면 `examples/pathpivot.md`의 구조를 참고하되 내용은 본인 아이디어로.

## 9. 완전히 막히면
- 손을 들어 강사·조교를 부르세요. 백업으로 **웹 ChatGPT + `prompts/bootcamp-agent-prompt.md`** 복붙 방식으로 전환할 수 있습니다.

## 10. DOCX 내보내기가 안 돼요 (`scripts/export-docx.sh`)
- "pandoc이 없습니다" 메시지: pandoc 설치 후 다시 실행.
  - macOS: `brew install pandoc` / Windows: `choco install pandoc` (또는 https://pandoc.org/installing.html) / Linux: `sudo apt install pandoc`
- ".md 산출물이 없습니다": 아직 `roadmap/`에 문서가 없는 경우입니다. 코치와 단계를 먼저 진행하세요.
- 표가 깨져 보이면 pandoc 버전이 오래된 것일 수 있습니다(`pandoc --version`으로 확인, 2.x 이상 권장).

## 11. 출처(citation)·웹 검색
- Codex는 **기본적으로 웹 검색이 켜져** 있습니다(cached). **최신 출처**가 필요하면 `codex --search`로 실행하거나 `~/.codex/config.toml`에 `web_search = "live"`를 추가하세요.
- 시장 규모·가격·통계 같은 숫자는 코치에게 **"웹에서 확인해 출처 달아줘"**라고 하면 `evidence-research`가 출처 URL을 붙입니다(못 찾으면 `[가정]` 표시).
- ⚠️ 웹 결과는 **신뢰할 수 없는 정보로 간주**하고(인젝션 주의), 공식·1차 자료를 우선하세요.

## 12. Vercel / Supabase 로그인·배포가 안 돼요 (Day 2 빌드)
- CLI가 없으면 설치: `npm i -g vercel`, `npm i -g supabase`.
- 로그인은 **사람이 한 번만**: `vercel login`, `supabase login` (둘 다 GitHub 계정으로 무료 가입). 이후 배포·DB는 에이전트가 진행합니다.
- 배포 후 화면이 비거나 폼이 안 되면 **환경변수**부터 확인: `vercel env`에 `NEXT_PUBLIC_SUPABASE_URL`·`NEXT_PUBLIC_SUPABASE_ANON_KEY`가 있는지 보고, 추가 후 `vercel --prod`로 재배포.

## 13. waitlist 신청이 저장이 안 돼요 (Supabase RLS)
- waitlist 테이블에 **익명 INSERT 정책**이 없으면 등록이 막힙니다. `templates/landing/supabase/migrations/0001_waitlist.sql`을 적용했는지 확인(`supabase db push`).
- 클라이언트에는 **anon key만** 쓰세요(공개돼도 안전, RLS가 보호). `service_role` 키는 절대 코드/배포에 넣지 않습니다.
- "이미 신청됨"은 정상입니다(중복 이메일은 무시). 저장 여부는 Supabase 대시보드 Table editor에서 확인하세요.
- ⚠️ RLS 테이블에 **upsert를 쓰면 권한 오류(42501)**가 납니다(ON CONFLICT가 SELECT 정책을 요구). waitlist는 **`insert` + 중복(23505) 처리**로 합니다(템플릿 `app/actions.ts` 기본 적용).

## 14. 배포한 사이트가 열리지 않고 로그인을 요구해요 (Vercel 배포 보호)
- Vercel **Team/Pro** 프로젝트는 "Deployment Protection(Vercel Authentication)"이 켜져 있어 배포 URL이 로그인을 요구할 수 있습니다(HTTP 401). 데모를 공개하려면 Vercel 프로젝트 → Settings → **Deployment Protection**을 끄세요.
- 개인 **Hobby** 계정은 기본적으로 꺼져 있어 배포 URL이 바로 공개됩니다(대부분의 참가자 해당).
