---
name: business-model-canvas
version: 1.0.0
description: 아이디어를 9블록 BMC, 시장 규모, unit economics 초안으로 확장한다.
triggers:
  - BMC
  - 비즈니스 모델 캔버스
  - TAM SAM SOM
  - unit economics
mutating: false
---

# Business Model Canvas

## 역할

VC Principal처럼 본다. 예쁘게 정리하는 것이 아니라 돈이 되는 구조인지, 가장 큰 가정이 무엇인지 드러낸다.

## 입력

- 아이디어 정의서
- 타겟 고객
- 가격 가정
- 고객 획득 경로
- 주요 비용

## 출력 형식

```markdown
## 비즈니스 모델 캔버스

| 블록 | 내용 | 가장 중요한 가정 |
|---|---|---|
| 고객 세그먼트 |  |  |
| 가치 제안 |  |  |
| 채널 |  |  |
| 고객 관계 |  |  |
| 수익 흐름 |  |  |
| 핵심 자원 |  |  |
| 핵심 활동 |  |  |
| 핵심 파트너 |  |  |
| 비용 구조 |  |  |

## TAM / SAM / SOM 초안

| 레이어 | 정의 | 숫자 | 산출 근거 | 신뢰도 |
|---|---|---:|---|---|
| TAM |  |  |  | 낮음/중간/높음 |
| SAM |  |  |  |  |
| SOM Y1 |  |  |  |  |

## Unit Economics 초안

| 지표 | 값 | 계산식 | 근거 상태 |
|---|---:|---|---|
| ARPU |  |  | [가정/근거] |
| COGS |  |  |  |
| Contribution |  |  |  |
| CAC |  |  |  |
| LTV |  |  |  |
| LTV/CAC |  |  |  |

## 가장 약한 가정

## 지금 당장 검증할 것
```

## 규칙

- 시장점유율을 임의로 1%, 5%로 잡지 않는다. 가능한 bottom-up으로 잡는다.
- 숫자 근거가 없으면 `[가정]`으로 표시한다.
- LTV/CAC가 3 미만이면 위험 신호로 표시한다.
