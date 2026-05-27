---
name: skill-creator-lite
version: 1.0.0
description: 캠프 진행 중 빠진 기능을 새 Markdown 스킬로 만든다. GBrain skill-creator의 경량 버전이다.
triggers:
  - 새 스킬 만들기
  - 스킬 생성
  - 부족한 스킬
  - skill creator
mutating: true
source: inspired by garrytan/gbrain skill-creator
---

# Skill Creator Lite

## 목적

캠프 중 반복되는 작업이 있는데 기존 스킬로 커버되지 않으면 새 스킬 초안을 만든다.

## 절차

1. 어떤 참가자 문제를 해결하는지 한 문장으로 정의한다.
2. 기존 스킬과 겹치는지 확인한다.
3. 겹치면 기존 스킬을 확장한다.
4. 겹치지 않으면 아래 템플릿으로 새 `SKILL.md`를 작성한다.
5. `skills/manifest.json`에 추가한다.

## 새 스킬 템플릿

```markdown
---
name: skill-name
version: 1.0.0
description: 무엇을 언제 쓰는지 한 문장으로 설명한다.
triggers:
  - 트리거 문구 1
  - 트리거 문구 2
mutating: false
---

# Skill Title

## 역할

## 입력

## 절차

## 출력 형식

## 품질 기준

## 안티패턴
```

## 안티패턴

- 이미 있는 스킬과 같은 일을 하는 스킬을 새로 만들지 않는다.
- 실행 절차 없이 설명만 있는 스킬을 만들지 않는다.
- 참가자가 읽기 어려운 내부 용어로만 쓰지 않는다.
