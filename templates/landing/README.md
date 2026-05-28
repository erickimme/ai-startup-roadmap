# Landing 템플릿 (Next.js + Vercel + Supabase, waitlist 필수)

`vibe-build` 스킬의 🅰 Landing 트랙용 **오버레이**다. 전체 프로젝트가 아니라, `create-next-app`으로 만든 베이스 위에 **waitlist 조각만 덮어쓰는** 파일 모음이다. (버전 깨짐 방지 — 베이스는 항상 최신 create-next-app으로 생성)

## 적용 순서 (에이전트가 진행, 사람은 auth만)

```bash
# 1) 베이스 생성 (src 폴더 없이 → @/* 가 프로젝트 루트를 가리킴)
npx create-next-app@latest my-landing --ts --app --eslint --no-src-dir
cd my-landing
npm i @supabase/supabase-js zod

# 2) 이 템플릿의 파일을 프로젝트에 복사
#    lib/supabase.ts
#    app/actions.ts
#    components/WaitlistForm.tsx
#    app/page.tsx        ← page.example.tsx 를 page.tsx 로 (카피는 roadmap/ 에서 교체)
#    supabase/migrations/0001_waitlist.sql
#    .env.local          ← .env.example 참고

# 3) Supabase (사람은 supabase login 만, 나머지는 에이전트)
supabase link --project-ref <PROJECT_REF>
supabase db push                       # 0001_waitlist.sql 적용 (waitlist 테이블 + RLS)

# 4) 로컬 확인
npm run dev                            # http://localhost:3000

# 5) GitHub + Vercel 배포 (URL 확보)
gh repo create my-landing --public --source=. --remote=origin --push
vercel link
vercel env add NEXT_PUBLIC_SUPABASE_URL
vercel env add NEXT_PUBLIC_SUPABASE_ANON_KEY
vercel --prod                          # 공개 URL = 데모
```

## 파일 설명
- `supabase/migrations/0001_waitlist.sql` — `waitlist` 테이블 + **RLS**(익명 INSERT 허용, SELECT 차단으로 이메일 비공개)
- `lib/supabase.ts` — anon key 기반 Supabase 클라이언트 (공개 가능, RLS가 보호)
- `app/actions.ts` — waitlist 등록 Server Action (Zod로 이메일 검증, 중복은 무시)
- `components/WaitlistForm.tsx` — `useActionState` 기반 폼 (React 19)
- `app/page.example.tsx` — 랜딩 예시. `[...]` 자리를 `roadmap/01_아이디어정의서.md`·`03_GTM.md` 실제 카피로 교체

## 주의
- **waitlist 폼은 빼지 않는다.** 수요 신호를 받는 것이 이 페이지의 목적이다.
- `NEXT_PUBLIC_*` 키만 클라이언트에 노출한다. `service_role` 키는 절대 코드/클라이언트에 넣지 않는다.
