#!/usr/bin/env bash
# roadmap/*.md → DOCX 내보내기 (단계별 + 통합), 가독성 템플릿(assets/reference.docx) 적용
# 사용법:  bash scripts/export-docx.sh [소스폴더]
#   예)   bash scripts/export-docx.sh
#         bash scripts/export-docx.sh examples/sample-run-건강정보플랫폼
set -euo pipefail

SRC="${1:-roadmap}"
OUTDIR="$SRC/docx"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REF="$ROOT/assets/reference.docx"

[ -d "$SRC" ] || { echo "✗ 소스 폴더가 없습니다: $SRC"; exit 1; }
if ! command -v pandoc >/dev/null 2>&1; then
  echo "⚠ pandoc이 없어 DOCX를 만들 수 없습니다."
  echo "  설치: macOS  brew install pandoc / Windows  choco install pandoc / Linux  sudo apt install pandoc"
  echo "  (자세히: docs/troubleshooting.md)"
  exit 1
fi

# 1) 단계별 DOCX → roadmap/docx/NN_*.docx (Word에서 수정·개선할 파일)
mkdir -p "$OUTDIR"
count=0
for f in "$SRC"/*.md; do
  [ -e "$f" ] || continue
  base="$(basename "${f%.md}")"
  if [ -f "$REF" ]; then
    pandoc -f gfm --reference-doc "$REF" -o "$OUTDIR/$base.docx" "$f"
  else
    pandoc -f gfm -o "$OUTDIR/$base.docx" "$f"
  fi
  count=$((count+1))
done
[ "$count" -gt 0 ] || { echo "✗ $SRC 에 .md 산출물이 없습니다."; exit 1; }

# 2) 통합 DOCX → README(목차) + 01~09 병합
files=()
[ -f "$SRC/README.md" ] && files+=("$SRC/README.md")
while IFS= read -r f; do files+=("$f"); done < <(ls "$SRC"/*.md 2>/dev/null | grep -v '/README.md$' | sort)
if [ -f "$REF" ]; then
  pandoc -f gfm --toc --reference-doc "$REF" --metadata title="나의 창업 로드맵" -o "$SRC/나의_창업로드맵.docx" "${files[@]}"
else
  pandoc -f gfm --toc --metadata title="나의 창업 로드맵" -o "$SRC/나의_창업로드맵.docx" "${files[@]}"
fi

NOTE=""; [ -f "$REF" ] && NOTE=" (서식 템플릿 적용)"
echo "✅ 단계별 DOCX ${count}개 → $OUTDIR/$NOTE  (Word에서 열어 수정·개선)"
echo "✅ 통합 DOCX → $SRC/나의_창업로드맵.docx"
echo "ℹ Word에서 고친 뒤에는  bash scripts/sync-docx.sh $SRC  로 다시 반영하세요."
