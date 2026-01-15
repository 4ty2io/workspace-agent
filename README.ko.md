Language: [English](README.md) | [한국어](README.ko.md)

![License](https://img.shields.io/badge/License-MIT-green)
![Gemini](https://img.shields.io/badge/AI-Gemini_3.0_Pro-blue)
![Architecture](https://img.shields.io/badge/Architecture-Event_Driven-purple)
![Memory](https://img.shields.io/badge/Context-Infinite-orange)

# Workspace Agent (워크스페이스 에이전트)

Google Antigravity 워크스페이스를 위한 표준 에이전트 구성을 부트스트랩하는 템플릿 및 툴킷입니다.

## 사용법 (Usage)

이 프로젝트는 메인 워크스페이스에 서브모듈로 추가되도록 설계되었습니다.

### 1. 새로운 워크스페이스 초기화
새 프로젝트를 위한 폴더를 생성하고(예: `my-new-project`) 해당 폴더로 이동합니다.

### 2. 빠른 설치 (Quick Install)
프로젝트 루트에서 다음 한 줄 명령어를 실행하여 워크스페이스를 설정하세요:
```bash
git clone --depth 1 https://github.com/4ty2io/workspace-agent.git .temp-agent && ./.temp-agent/install.sh && rm -rf .temp-agent
```

### 3. 확인 (Verify)
이제 프로젝트 루트에 `.agent/` 및 `.context/` 디렉토리가 생성된 것을 확인할 수 있습니다.
```bash
ls -la .agent .context
```

**이 명령이 수행하는 작업:**
- `workspace-agent/`의 `.agent/` 및 `.context/`를 루트로 **복사(COPY)**합니다.
- 템플릿 파일들을 루트로 **복사(COPY)**합니다 (초기 설정).
- `.gitignore`를 구성합니다.

> [!IMPORTANT]
> 이제 워크스페이스 루트에 있는 구성 파일들의 소유권은 **사용자**에게 있습니다.

### 5. 사용자 정의 (Customization)
`.agent`와 `.context`는 이제 워크스페이스 내의 실제 파일이므로 자유롭게 수정할 수 있습니다!
- `code-review` 스킬을 변경하고 싶으신가요? `.agent/skills/code-review/SKILL.md`를 편집하세요.
- 사용자 정의 워크플로우를 추가하고 싶으신가요? `.agent/workflows/`에 추가하세요.

### 6. 업데이트 (Updating)
에이전트를 최신 버전으로 업데이트하려면 "빠른 설치" 과정을 반복하면 됩니다.

1.  최신 버전을 임시 디렉토리에 복제합니다.
2.  `install.sh`를 실행합니다.
    - 사용자가 수정한 파일이나 이미 존재하는 파일은 **건너뜁니다(SKIP)**.
    - 로컬 변경 사항을 최신 버전으로 **덮어쓰고(OVERWRITE)** 싶다면 다음 명령을 실행하세요:
      ```bash
      ./install.sh --force
      ```
    - ⚠️ **경고**: `--force` 옵션은 기존의 `.agent` 및 `.context` 디렉토리를 삭제하고 새로운 복사본으로 대체합니다.

### 7. 코딩 시작 (Start Coding)
이제 에이전트 기반 워크스페이스에서 작업을 시작할 준비가 되었습니다!
