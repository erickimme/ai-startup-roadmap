#!/usr/bin/env bash
# AI 창업 로드맵 실습 키트 — 설치 도우미 (macOS / Linux)
set -e

echo "▶ Node.js 확인..."
if ! command -v node >/dev/null 2>&1; then
  echo "✗ Node.js가 없습니다. 먼저 설치하세요: https://nodejs.org (18+ 권장)"
  exit 1
fi
echo "  Node $(node -v) OK"

echo "▶ Codex CLI 설치..."
npm install -g @openai/codex

echo ""
echo "✅ 설치 완료!"
echo "   이 폴더에서 'codex' 를 실행하고, 코치에게 아이디어를 말하며 시작하세요."
echo "   예) 안녕! 내 창업 아이디어는 ___ 이야. 워크숍 시작하자."
