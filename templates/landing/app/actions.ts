'use server';

import { z } from 'zod';
import { supabase } from '@/lib/supabase';

const schema = z.object({
  email: z.string().email('이메일 형식이 올바르지 않아요.'),
});

export type WaitlistState = { ok: boolean; message: string };

export async function joinWaitlist(
  _prev: WaitlistState,
  formData: FormData,
): Promise<WaitlistState> {
  const parsed = schema.safeParse({ email: formData.get('email') });
  if (!parsed.success) {
    return { ok: false, message: parsed.error.issues[0]?.message ?? '입력을 확인해 주세요.' };
  }

  // RLS(익명 INSERT만 허용, SELECT 차단)에서는 upsert가 ON CONFLICT 평가 때문에 막힌다.
  // 그래서 평범한 insert를 쓰고, 중복 이메일(unique 위반, 코드 23505)은 "이미 신청"으로 처리한다.
  const { error } = await supabase
    .from('waitlist')
    .insert({ email: parsed.data.email, source: 'landing' });

  if (error) {
    if (error.code === '23505') {
      return { ok: true, message: '이미 신청하셨어요! 출시 소식을 보내드릴게요.' };
    }
    return { ok: false, message: '잠시 후 다시 시도해 주세요.' };
  }
  return { ok: true, message: '신청 완료! 출시 소식을 가장 먼저 보내드릴게요.' };
}
