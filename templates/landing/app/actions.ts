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

  // 중복 이메일은 무시(on conflict do nothing). RLS 가 익명 INSERT 만 허용한다.
  const { error } = await supabase
    .from('waitlist')
    .upsert(
      { email: parsed.data.email, source: 'landing' },
      { onConflict: 'email', ignoreDuplicates: true },
    );

  if (error) {
    return { ok: false, message: '잠시 후 다시 시도해 주세요.' };
  }
  return { ok: true, message: '신청 완료! 출시 소식을 가장 먼저 보내드릴게요.' };
}
