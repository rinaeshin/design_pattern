Design Patterns - Flutter Demo

요약
- 이 프로젝트는 Flutter(웹 포함)로 작성된 디자인 패턴 데모입니다.
- GOF 23개 디자인 패턴에 대한 대화형 데모, 코드 뷰, 개요(의도 및 설명)를 제공합니다.
- 웹 빌드를 GitHub Pages로 배포하여 데모를 공개할 수 있습니다.

프로젝트 위치
- 로컬 루트: `/Users/rinaeshin/IdeaProjects/android_project/design_pattern`
- 원격 리포지토리: `https://github.com/rinaeshin/design_pattern`
- 배포 사이트(예시): `https://rinaeshin.github.io/design_pattern/` (gh-pages를 통해 호스팅)

주요 변경 사항 (최근)
- UI: 패턴 상세화면에서 `Code` / `Overview`를 하단의 1:1 버튼으로 이동시키고, 데스크톱에서는 중앙 다이얼로그, 모바일에서는 바텀시트로 표시하도록 변경 (Demo는 기본 표시).
- Composite 데모: `print` 대신 문자열 반환으로 변경하여 UI에서 결과를 표시하도록 수정.
- 테스트: 기본 counter 테스트를 간단한 스모크 테스트로 교체.
- CI: `.github/workflows/deploy_github_pages.yml`에 웹 빌드 후 gh-pages 배포 워크플로 추가(권한 문제로 수동 배포함).

주요 파일
- UI 및 페이지
  - `lib/pages/pattern_detail_page.dart`
  - `lib/pages/home_page.dart`, `lib/pages/category_page.dart`, `lib/pages/lobby_page.dart`
- 데모 위젯
  - `lib/widgets/demo/*_demo.dart` (각 패턴별 데모)
- 패턴 구현
  - `lib/patterns/**`
- CI 워크플로
  - `.github/workflows/deploy_github_pages.yml`

로컬에서 실행하기
- 의존성 설치: `flutter pub get`
- 정적 검사: `flutter analyze`
- 테스트 실행: `flutter test`
- 개발 서버로 실행(Chrome): `flutter run -d chrome`

웹 빌드 및 배포
- GitHub Pages에 호스팅할 때는 base-href 확인이 필요합니다. 예: `flutter build web --release --base-href /design_pattern/`
- 수동 배포(간단한 방법):
  - `flutter build web --release --base-href /design_pattern/`
  - `cp -R build/web/. /tmp/gh-pages-dir/`
  - `cd /tmp/gh-pages-dir && git init && git checkout -b gh-pages && git add . && git commit -m "chore: publish web build" && git remote add origin https://github.com/<your>/design_pattern.git && git push -u origin gh-pages --force`

CI(자동 배포) 관련 주의사항
- 워크플로에서 `GITHUB_TOKEN`(기본 토큰)을 사용해 gh-pages에 푸시하려면 리포지토리의 Actions 권한을 "Read and write"로 설정해야 합니다.
- 권한 변경이 불가능한 경우, 개인 액세스 토큰(PAT)을 생성해 리포지토리 시크릿(예: `GH_PAGES_PAT`)으로 추가한 뒤 워크플로에서 해당 시크릿을 사용하도록 설정하면 됩니다.

다음 권장 작업
- `README.md`(이 파일) 검토 및 필요시 보강
- 워크플로에 PAT fallback 추가 또는 리포지토리 설정에서 Actions 권한 변경
- Code 모달에 문법 하이라이팅 추가
- 다이얼로그/모달 스타일 개선 및 접근성 확인
- 주요 UI 동작(모달 열기/복사 버튼 등)에 대한 위젯 테스트 추가

문의 및 도움
- 원하시면 제가 워크플로를 PAT 사용 방식으로 수정해 드리거나, 권한 변경 절차(관리자 설정)를 안내해 드리겠습니다.

파일 참고
- 워크플로 파일: `.github/workflows/deploy_github_pages.yml`
- 패턴 상세 페이지: `lib/pages/pattern_detail_page.dart`
