# 보드게임 규칙서 한국어화 스킬

Codex와 Claude Code에서 같은 내용으로 사용하는 보드게임 규칙서 한국어화 스킬 세 가지입니다. [Agent Skills](https://agentskills.io/) 형식의 `SKILL.md`와 참조 자료를 `skills/`에 모았습니다. 원본 규칙서나 번역 결과물은 포함하지 않습니다.

| 스킬 | 역할 |
| --- | --- |
| [`localize-boardgame-rulebooks-ko`](skills/localize-boardgame-rulebooks-ko/SKILL.md) | 판본·에라타 확인부터 영한 대조 원고, 페이지별 조판·비교, 검색 가능한 PDF 합본까지 진행 |
| [`restore-rulebook-graphics`](skills/restore-rulebook-graphics/SKILL.md) | 저해상도 도해·아이콘을 개선하면서 규칙 정보와 원본 도형을 대조 |
| [`localize-rulebook-cover-title-ko`](skills/localize-rulebook-cover-title-ko/SKILL.md) | 사용자가 선택한 경우 표지의 게임 타이틀을 한국어 이미지로 제작 |

한국어화 스킬은 계획 단계에서 표지 게임 타이틀을 영문으로 유지할지 한국어 이미지로 만들지 묻습니다. 이미지 품질 개선이나 한국어 표지 타이틀 제작이 필요하면 해당 보조 스킬을 적용합니다. 단계별·페이지별 사용자 검토는 한국어화 스킬에서 관리합니다.

## Codex와 Claude Code에 설치

터미널에서 저장소를 보관할 위치에 복제한 뒤 설치 스크립트를 실행합니다.

```sh
mkdir -p "$HOME/.local/share"
git clone https://github.com/ricky0813/boardgame-rulebook-ko-skills.git "$HOME/.local/share/boardgame-rulebook-ko-skills"
sh "$HOME/.local/share/boardgame-rulebook-ko-skills/install.sh"
```

기본값은 세 스킬을 **Codex**의 `~/.agents/skills/`와 **Claude Code**의 `~/.claude/skills/`에 각각 연결합니다. 두 곳이 저장소의 같은 `skills/` 파일을 가리키므로 스킬을 복제하거나 따로 유지할 필요가 없습니다. 설치한 저장소는 이동하거나 삭제하지 마세요. 업데이트는 해당 저장소에서 `git pull`을 실행하면 됩니다. 새 스킬이 보이지 않으면 새 세션을 시작하세요.

한 도구에만 설치하려면 `install.sh --target codex` 또는 `install.sh --target claude`를 사용합니다. 설치 위치에 같은 이름의 다른 스킬이 있으면 스크립트는 덮어쓰지 않고 중단합니다. 이 경우 기존 스킬을 확인한 뒤 직접 이동하거나 제거하고 다시 실행하세요. 설치 스크립트는 계정 로그인이나 Git 설정을 변경하지 않습니다.

Codex에서는 `$localize-boardgame-rulebooks-ko`, Claude Code에서는 `/localize-boardgame-rulebooks-ko`로 직접 호출할 수 있습니다. 또는 규칙서 PDF의 한국어화를 요청하면 각 도구가 스킬 설명을 보고 선택할 수 있습니다. 이미지 생성, PDF 편집 등 실제 작업에 필요한 도구는 실행 환경에서 별도로 사용할 수 있어야 합니다.

## Codex 플러그인으로 설치하는 경우

Codex 플러그인 방식을 선호한다면 기존 마켓플레이스 설치도 지원합니다. 위의 직접 설치 방식과 **동시에 설치할 필요는 없습니다**.

```sh
codex plugin marketplace add ricky0813/boardgame-rulebook-ko-skills
```

그다음 Codex의 플러그인 목록에서 `보드게임 규칙서 한국어화`를 설치하세요. 플러그인도 같은 `skills/`를 사용합니다. [플러그인 매니페스트](.codex-plugin/plugin.json)와 [마켓플레이스 목록](.agents/plugins/marketplace.json)이 이 저장소에 있습니다.

스킬과 설치 파일은 [MIT 라이선스](LICENSE)로 배포합니다.
