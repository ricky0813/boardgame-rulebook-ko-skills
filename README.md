# 보드게임 규칙서 한국어화 스킬

Codex에서 보드게임 규칙서 PDF를 한국어화할 때 쓰는 세 가지 스킬을 묶은 저장소입니다. 원본 규칙서나 번역 결과물은 포함하지 않습니다.

| 스킬 | 역할 |
| --- | --- |
| [`localize-boardgame-rulebooks-ko`](plugins/boardgame-rulebook-ko/skills/localize-boardgame-rulebooks-ko/SKILL.md) | 판본·에라타 확인부터 영한 대조 원고, 페이지별 조판·비교, 검색 가능한 PDF 합본까지 진행 |
| [`restore-rulebook-graphics`](plugins/boardgame-rulebook-ko/skills/restore-rulebook-graphics/SKILL.md) | 저해상도 도해·아이콘을 개선하면서 규칙 정보와 원본 도형을 대조 |
| [`localize-rulebook-cover-title-ko`](plugins/boardgame-rulebook-ko/skills/localize-rulebook-cover-title-ko/SKILL.md) | 사용자가 선택한 경우 표지의 게임 타이틀을 한국어 이미지로 제작 |

한국어화 스킬은 계획 단계에서 표지 게임 타이틀을 영문으로 유지할지 한국어 이미지로 만들지 묻습니다. 이미지의 품질 개선이 필요하거나 한국어 표지 타이틀이 선택되면 해당 보조 스킬을 적용합니다. 단계별·페이지별 사용자 검토는 한국어화 스킬에서 관리합니다.

## Codex에 추가하기

Codex CLI에서 이 저장소를 플러그인 마켓플레이스로 등록합니다.

```sh
codex plugin marketplace add ricky0813/boardgame-rulebook-ko-skills
```

그다음 Codex의 플러그인 목록에서 `보드게임 규칙서 한국어화`를 설치하고 새 작업에서 사용합니다. 첫 요청에는 규칙서 PDF와 원하는 번역 범위를 전달하면 됩니다.

이 저장소는 [플러그인 매니페스트](plugins/boardgame-rulebook-ko/.codex-plugin/plugin.json)와 [마켓플레이스 목록](.agents/plugins/marketplace.json)을 포함합니다. 세 스킬은 각각 독립적으로도 사용할 수 있습니다.

스킬과 플러그인 설정은 [MIT 라이선스](LICENSE)로 배포합니다.
