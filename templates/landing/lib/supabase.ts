import { createClient } from '@supabase/supabase-js';

// anon key 는 공개되어도 안전하다. 실제 보호는 Supabase RLS 정책이 한다.
// (waitlist 테이블은 익명 INSERT 만 허용, SELECT 차단)
export const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL!,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
);
