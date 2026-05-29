---
name: vibe-build
version: 1.0.0
description: 어제 만든 창업 로드맵을 실제 동작하는 랜딩 페이지(waitlist 필수) 또는 MVP로 만들어 배포·데모한다. (Day 2 캡스톤)
triggers:
  - 빌드
  - MVP 구현
  - 랜딩 페이지
  - landing page
  - 데모 만들기
  - 배포
mutating: true
---

# Vibe Build (Day 2 — 실제로 만들어 데모하기)

## 목적

어제 `roadmap/`에 만든 로드맵을 **오늘 동작하는 것**으로 바꾼다. AI 덕분에 구현 장벽이 크게 낮아졌으니, 슬라이드가 아니라 **공개 URL로 데모**하고 첫 수요 신호(**waitlist**)를 받는다.

## 전제

- 먼저 `roadmap/01_아이디어정의서.md`, `roadmap/03_GTM.md`, (있으면) `roadmap/05_개발로드맵.md`를 읽는다. **카피와 기능은 여기서 그대로 가져온다.** 새로 지어내지 않는다.
- 완성도보다 **데모 가능한 한 조각**이 먼저다. 막히면 진짜 1개 + 나머지는 가짜(하드코딩)로 두고 흐름을 끊지 않는다.

## 기술 스택 (AI-native 기본)

**GitHub + Vercel + Supabase**, 프레임워크 **Next.js(App Router)**. 사람은 **로그인(auth)만** 하고, 나머지(레포 생성·스캐폴딩·DB·배포)는 에이전트가 CLI로 진행한다.

스택을 먼저 고르게 한다 (모르면 추천을 따른다):

| 선택 | 언제 |
|---|---|
| **Vercel + Supabase (추천·기본)** | 웹/앱/마켓플레이스/SaaS 등 대부분 |
| 이미 정한 스택이 있음 | 그 스택으로 하되, 오늘은 데모 가능한 범위만 |
| 정적 페이지만 원함 | 그래도 **waitlist는 Supabase로 받는다** |

## 트랙 (둘 중 하나)

| 트랙 | 누가 | 반드시 |
|---|---|---|
| 🅰 **Landing** (기본) | 전원 / 다음 단계가 수요 검증·인터뷰인 사람 | **waitlist 수집 필수** (이메일 → Supabase) |
| 🅱 **MVP** (야심) | 핵심 가치가 "직접 써봐야" 증명되고, 한 흐름으로 좁힐 수 있는 사람 | 핵심 기능 **1개 흐름**만. 복잡하면 한 부분만 진짜로 |

> 결정 규칙(강사 10초 안내): 기본은 Landing. **앱을 눌러봐야 가치가 증명되는** 사람만 MVP. MVP도 흐름 1개로 좁힌다. 딥테크/복잡은 한 흐름만 진짜, 나머지는 가짜.

## 진행 순서

### 0) 트랙·스택·범위 선택 (~10분)
트랙(A/B)과 스택을 고르고, `05_개발로드맵.md`의 MVP 범위에서 **오늘 만들 1개**만 정한다.

### 1) 로그인 체크 — 사람이 1회만 (~5분)
참가자에게 아래만 실행하게 한다. (계정은 모두 GitHub로 무료 가입 가능)
```bash
gh auth login        # GitHub
vercel login         # 필요시: npm i -g vercel
supabase login       # 필요시: npm i -g supabase
```
이후 단계는 에이전트가 CLI로 진행한다.

### 2) 스캐폴딩 + 빈 페이지 먼저 배포 (~10분)
- `npx create-next-app@latest <repo> --ts --app --eslint`로 베이스를 만든다(소스 폴더 `src/` 없이 → `@/*`가 루트를 가리킴).
- `templates/landing/`의 waitlist 조각을 덮어쓴다(자세한 순서: `templates/landing/README.md`).
- `gh repo create`로 GitHub에 올리고, **먼저 빈 페이지를 `vercel`로 배포해 URL을 확보**한다. (이후 푸시할 때마다 자동 재배포되어 데모가 항상 준비됨)

### 3) Supabase: waitlist 테이블 + RLS (~5분, 에이전트)
- `templates/landing/supabase/migrations/0001_waitlist.sql`을 적용한다.
- 테이블 `waitlist(email, source, created_at)`, **RLS 필수**: 익명 INSERT 허용, SELECT 차단(이메일 비공개).
- Supabase 프로젝트 URL/anon key를 `vercel env add`로 연결한다(`NEXT_PUBLIC_SUPABASE_URL`, `NEXT_PUBLIC_SUPABASE_ANON_KEY`).

### 4) 바이브코딩 반복 (~40~60분)
- **카피 주입**: `01_아이디어정의서.md`의 한 줄 정의·5블록·차별점, `03_GTM.md`의 헤드라인·서브·CTA를 페이지에 그대로 넣는다.
- **Landing 구성**: Hero(한 줄 가치) → 문제/해결 → 차별점 → **CTA = waitlist 폼**(이메일 → Supabase insert → "신청 완료").
- **MVP 구성**: 정한 핵심 기능 1개 흐름을 동작하게. 데이터는 Supabase. 막히면 가짜로 두고 흐름 유지.
- 고칠 때마다 push → Vercel 자동 재배포.

### 5) 데모 리허설 + 공개 데모 (~10분)
60~90초 데모: ① 누구의 무슨 문제 ② 화면에서 1개 동작/waitlist 신청 시연 ③ **이걸로 검증할 가설 1개**(예: "이 메시지로 방문자 중 N%가 waitlist 신청"). 끝나면 URL을 동료·잠재고객에게 실제로 공유한다.

## 산출물 기록

`roadmap/10_빌드.md`에 남긴다: 트랙 · 스택 · **배포 URL** · 무엇을 만들었나 · **검증할 가설 1개** · 다음 7일 행동(예: waitlist N명). 그리고 `bash scripts/export-docx.sh roadmap "<이름>"`로 통합 문서를 갱신한다.

## 규칙

- **Landing은 waitlist를 무조건 받는다.** 신청 폼 없는 랜딩은 의미가 없다.
- Supabase 테이블에는 **항상 RLS**를 건다(익명 INSERT만 허용, SELECT 차단).
- `service_role` 등 비밀키를 클라이언트에 노출하지 않는다. 폼 insert는 anon key + RLS로 한다.
- RLS 테이블(익명 INSERT only)에는 **`upsert` 대신 `insert` + 중복(코드 23505) 처리**를 쓴다. upsert는 ON CONFLICT 평가에 SELECT 정책이 필요해 익명 INSERT-only RLS와 충돌한다(실측: 42501 권한오류).
- 데모 URL이 로그인을 요구하면(Vercel **Team** 계정의 Deployment Protection) 프로젝트 Settings → Deployment Protection을 끈다. 개인 **Hobby** 계정은 기본 공개.

## 다음 단계
배포가 끝나면(못생겨도 OK · 핵심 작동·waitlist 확인) **`design-polish`** 스킬로 디자인을 올린다. 빌드와 디자인은 단계를 분리한다. → `docs/디자인-가이드.md`
- 범위를 1개로 좁힌다. 안 되면 진짜 1개 + 나머지 가짜.
- 사람은 auth만, 나머지는 에이전트가 CLI로.
