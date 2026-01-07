실행 방법(Flutter web build 명령)

GitHub Pages 배포 방식 요약
# GoF Design Patterns – Interactive Visualization

GoF(Gang of Four) 디자인 패턴 **23개**를  
**애니메이션 기반으로 시각화**한 Flutter 프로젝트입니다.

- 생성 패턴: 5
- 구조 패턴: 7
- 행위 패턴: 11

각 패턴은 단계(stage) 기반 애니메이션으로 동작하며,  
구조와 흐름을 직관적으로 이해할 수 있도록 구성되어 있습니다.

---

## 🚀 Demo (GitHub Pages)

**Live Demo URL**  
👉 https://rinaeshin.github.io/design_pattern/

### 📱 QR Code
아래 QR 코드를 통해 모바일에서도 바로 확인할 수 있습니다.

![Design Pattern Demo QR](docs/qr.png)](https://rinaeshin.github.io/design_pattern/

[![QR Code](https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=https://rinaeshin.github.io/design_pattern/)](https://rinaeshin.github.io/design_pattern/))

---

## 🧩 Project Structure (Flutter)

```text
lib/
 ├─ data/
 │   └─ animation_scenarios.dart   # 23개 패턴 애니메이션 시나리오 정의
 ├─ models/
 │   ├─ animation_stage.dart       # 단계(Stage) 모델
 │   └─ view_mode.dart             # 시각화 / 개발자 모드
 ├─ widgets/
 │   └─ animation/
 │       ├─ pattern_animation_widget.dart
 │       ├─ animation_canvas.dart
 │       └─ animation_controls.dart
 └─ pages/
     └─ pattern_detail_page.dart






