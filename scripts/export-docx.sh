#!/usr/bin/env bash
# roadmap/*.md 산출물을 하나의 DOCX로 내보냅니다.
# 사용법:  bash scripts/export-docx.sh [소스폴더] [출력파일]
#   예)   bash scripts/export-docx.sh                      # roadmap/ → roadmap/나의_창업로드맵.docx
#         bash scripts/export-docx.sh examples/sample-run-건강정보플랫폼
set -euo pipefail

SRC="${1:-roadmap}"
OUT="${2:-$SRC/나의_창업로드맵.docx}"

if [ ! -d "$SRC" ]; then
  echo "✗ 소스 폴더가 없습니다: $SRC"
  exit 1
fi

# 파일 순서: README(목차/표지) 먼저, 그다음 01~09 번호순
files=()
[ -f "$SRC/README.md" ] && files+=("$SRC/README.md")
while IFS= read -r f; do files+=("$f"); done < <(ls "$SRC"/*.md 2>/dev/null | grep -v '/README.md$' | sort)

if [ "${#files[@]}" -eq 0 ]; then
  echo "✗ $SRC 에 .md 산출물이 없습니다. 먼저 코치와 함께 산출물을 만드세요."
  exit 1
fi

if command -v pandoc >/dev/null 2>&1; then
  pandoc -f gfm --toc --metadata title="나의 창업 로드맵" -o "$OUT" "${files[@]}"
  echo "✅ DOCX 생성 완료: $OUT  (${#files[@]}개 문서 병합)"
else
  echo "⚠ pandoc이 없어 DOCX를 만들 수 없습니다."
  echo "  설치: macOS  →  brew install pandoc"
  echo "        Windows →  choco install pandoc  (또는 https://pandoc.org/installing.html)"
  echo "        Linux  →  sudo apt install pandoc"
  echo "  설치 후 이 명령을 다시 실행하세요."
  exit 1
fi
