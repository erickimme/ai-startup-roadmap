#!/usr/bin/env bash
# Word에서 수정한 단계별 DOCX를 다시 Markdown으로 반영 (docx → md)
# 각 단계 docx를 Word에서 고친 뒤 실행하면, 코치가 다음 단계에서 수정된 내용을 이어서 사용합니다.
# 사용법:  bash scripts/sync-docx.sh [소스폴더]
set -euo pipefail

SRC="${1:-roadmap}"
OUTDIR="$SRC/docx"

command -v pandoc >/dev/null 2>&1 || { echo "⚠ pandoc 필요 (docs/troubleshooting.md)"; exit 1; }
[ -d "$OUTDIR" ] || { echo "✗ $OUTDIR 없음 — 먼저 export-docx.sh를 실행하세요."; exit 1; }

n=0
for d in "$OUTDIR"/*.docx; do
  [ -e "$d" ] || continue
  base="$(basename "${d%.docx}")"
  pandoc "$d" -t gfm -o "$SRC/$base.md"
  echo "↩ 반영: docx/$base.docx → $base.md"
  n=$((n+1))
done

echo "✅ ${n}개 동기화 완료. 코치에게 '수정 반영해서 다음 단계 진행해줘'라고 하세요."
echo "ℹ 참고: docx→md 변환 시 표/서식이 일부 단순화될 수 있습니다. 큰 수정은 코치에게 말로 전달하는 방법도 좋습니다."
