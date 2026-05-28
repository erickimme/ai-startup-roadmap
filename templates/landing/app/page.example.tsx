import { WaitlistForm } from '@/components/WaitlistForm';

// 이 파일을 app/page.tsx 로 복사한 뒤, 아래 [...] 자리를
// roadmap/01_아이디어정의서.md · 03_GTM.md 의 실제 카피로 교체하세요.
export default function Page() {
  return (
    <main>
      {/* Hero */}
      <section>
        <h1>[한 줄 가치 제안 — 01_아이디어정의서의 '정제된 한 줄 정의']</h1>
        <p>[서브 헤드라인 — 03_GTM.md의 서브 헤드라인]</p>
        <WaitlistForm />
      </section>

      {/* 문제 / 해결 */}
      <section>
        <h2>이런 문제, 있으셨죠?</h2>
        <p>[문제 — 01_아이디어정의서의 '어떤 문제를']</p>
        <h2>이렇게 해결합니다</h2>
        <p>[해결 — '어떻게 해결' + 기존 대안과의 차별점]</p>
      </section>

      {/* 마무리 CTA — waitlist 다시 한 번 */}
      <section>
        <h2>가장 먼저 써보세요</h2>
        <WaitlistForm />
      </section>
    </main>
  );
}
