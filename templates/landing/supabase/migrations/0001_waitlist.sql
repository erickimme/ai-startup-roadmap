-- waitlist 테이블 + RLS
-- 익명(anon) 사용자가 이메일을 등록(INSERT)할 수 있게만 허용하고,
-- 읽기/수정/삭제는 막아 이메일을 비공개로 둔다. (관리자 service_role 은 RLS 우회)

create table if not exists public.waitlist (
  id         uuid primary key default gen_random_uuid(),
  email      text not null unique,
  source     text,
  created_at timestamptz not null default now()
);

alter table public.waitlist enable row level security;

-- 익명 사용자: INSERT 만 허용
create policy "anon can join waitlist"
  on public.waitlist
  for insert
  to anon
  with check (true);

-- SELECT/UPDATE/DELETE 정책은 두지 않는다 → anon 에게 자동 차단(이메일 비공개).
