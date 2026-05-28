'use client';

import { useActionState } from 'react';
import { joinWaitlist, type WaitlistState } from '@/app/actions';

const initial: WaitlistState = { ok: false, message: '' };

export function WaitlistForm() {
  const [state, formAction, pending] = useActionState(joinWaitlist, initial);

  if (state.ok) {
    return <p role="status">{state.message}</p>;
  }

  return (
    <form action={formAction}>
      <input
        type="email"
        name="email"
        required
        placeholder="이메일 주소"
        aria-label="이메일 주소"
      />
      <button type="submit" disabled={pending}>
        {pending ? '신청 중…' : 'waitlist 신청'}
      </button>
      {state.message && !state.ok ? <p role="alert">{state.message}</p> : null}
    </form>
  );
}
