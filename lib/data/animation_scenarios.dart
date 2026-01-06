import 'package:flutter/material.dart';
import '../models/animation_stage.dart';

/// Registry of all pattern animation scenarios
class AnimationScenarios {
  static final Map<String, List<AnimationStage>> _scenarios = {
    'singleton': _singletonStages,
    'observer': _observerStages,
    'strategy': _strategyStages,
    'factory': _factoryStages,
    'abstract_factory': _abstractFactoryStages,
    'builder': _builderStages,
    'prototype': _prototypeStages,
    'adapter': _adapterStages,
    'bridge': _bridgeStages,
    'composite': _compositeStages,
    'decorator': _decoratorStages,
    'facade': _facadeStages,
    'flyweight': _flyweightStages,
    'proxy': _proxyStages,
    'command': _commandStages,
    'state': _stateStages,
    'template': _templateStages,
    'iterator': _iteratorStages,
    'mediator': _mediatorStages,
    'memento': _mementoStages,
    'chain': _chainStages,
    'visitor': _visitorStages,
    'interpreter': _interpreterStages,
  };

  static List<AnimationStage> getStages(String patternId) {
    return _scenarios[patternId] ?? _defaultStages;
  }

  static bool hasAnimation(String patternId) {
    return _scenarios.containsKey(patternId);
  }

  // Singleton stages (3 stages)
  static final List<AnimationStage> _singletonStages = [
    const AnimationStage(
      step: 1,
      description: '아직 인스턴스가 생성되지 않았습니다',
      circles: [],
      arrows: [],
    ),
    const AnimationStage(
      step: 2,
      description: '첫 번째 요청 시 인스턴스 생성',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF2196F3),
          label: 'Instance',
        ),
      ],
      arrows: [
        ArrowPath(
          start: Offset(50, 100),
          end: Offset(110, 100),
        ),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: '이후 요청도 같은 인스턴스 반환',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF4CAF50),
          label: 'Instance',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(50, 70), end: Offset(110, 90)),
        ArrowPath(start: Offset(50, 130), end: Offset(110, 110)),
      ],
    ),
  ];

  // Observer stages (5 stages)
  static final List<AnimationStage> _observerStages = [
    const AnimationStage(
      step: 1,
      description: 'Subject 객체 존재',
      circles: [
        CircleNode(
          position: Offset(150, 60),
          color: Color(0xFFFF9800),
          label: 'Subject',
        ),
      ],
      arrows: [],
    ),
    const AnimationStage(
      step: 2,
      description: 'Observer들이 구독',
      circles: [
        CircleNode(
          position: Offset(150, 60),
          color: Color(0xFFFF9800),
          label: 'Subject',
        ),
        CircleNode(
          position: Offset(60, 140),
          color: Color(0xFF9E9E9E),
          label: 'Obs1',
        ),
        CircleNode(
          position: Offset(150, 140),
          color: Color(0xFF9E9E9E),
          label: 'Obs2',
        ),
        CircleNode(
          position: Offset(240, 140),
          color: Color(0xFF9E9E9E),
          label: 'Obs3',
        ),
      ],
      arrows: [
        ArrowPath(
          start: Offset(150, 90),
          end: Offset(60, 120),
          dashed: true,
        ),
        ArrowPath(
          start: Offset(150, 90),
          end: Offset(150, 120),
          dashed: true,
        ),
        ArrowPath(
          start: Offset(150, 90),
          end: Offset(240, 120),
          dashed: true,
        ),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: 'Subject 상태 변경',
      circles: [
        CircleNode(
          position: Offset(150, 60),
          color: Color(0xFFF44336),
          label: 'Subject',
        ),
        CircleNode(
          position: Offset(60, 140),
          color: Color(0xFF9E9E9E),
          label: 'Obs1',
        ),
        CircleNode(
          position: Offset(150, 140),
          color: Color(0xFF9E9E9E),
          label: 'Obs2',
        ),
        CircleNode(
          position: Offset(240, 140),
          color: Color(0xFF9E9E9E),
          label: 'Obs3',
        ),
      ],
      arrows: [
        ArrowPath(
          start: Offset(150, 90),
          end: Offset(60, 120),
          dashed: true,
        ),
        ArrowPath(
          start: Offset(150, 90),
          end: Offset(150, 120),
          dashed: true,
        ),
        ArrowPath(
          start: Offset(150, 90),
          end: Offset(240, 120),
          dashed: true,
        ),
      ],
    ),
    const AnimationStage(
      step: 4,
      description: '모든 Observer에게 알림 전파',
      circles: [
        CircleNode(
          position: Offset(150, 60),
          color: Color(0xFFF44336),
          label: 'Subject',
        ),
        CircleNode(
          position: Offset(60, 140),
          color: Color(0xFF9E9E9E),
          label: 'Obs1',
        ),
        CircleNode(
          position: Offset(150, 140),
          color: Color(0xFF9E9E9E),
          label: 'Obs2',
        ),
        CircleNode(
          position: Offset(240, 140),
          color: Color(0xFF9E9E9E),
          label: 'Obs3',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(150, 90), end: Offset(60, 120)),
        ArrowPath(start: Offset(150, 90), end: Offset(150, 120)),
        ArrowPath(start: Offset(150, 90), end: Offset(240, 120)),
      ],
    ),
    const AnimationStage(
      step: 5,
      description: 'Observer들 상태 업데이트',
      circles: [
        CircleNode(
          position: Offset(150, 60),
          color: Color(0xFFF44336),
          label: 'Subject',
        ),
        CircleNode(
          position: Offset(60, 140),
          color: Color(0xFFF44336),
          label: 'Obs1',
        ),
        CircleNode(
          position: Offset(150, 140),
          color: Color(0xFFF44336),
          label: 'Obs2',
        ),
        CircleNode(
          position: Offset(240, 140),
          color: Color(0xFFF44336),
          label: 'Obs3',
        ),
      ],
      arrows: [],
    ),
  ];

  // Strategy stages (4 stages)
  static final List<AnimationStage> _strategyStages = [
    const AnimationStage(
      step: 1,
      description: 'Context가 Strategy A 사용',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF3F51B5),
          label: 'Context',
        ),
        CircleNode(
          position: Offset(200, 100),
          color: Color(0xFF4CAF50),
          label: 'StrategyA',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(130, 100), end: Offset(170, 100)),
      ],
    ),
    const AnimationStage(
      step: 2,
      description: 'Strategy A 알고리즘 실행',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF3F51B5),
          label: 'Context',
        ),
        CircleNode(
          position: Offset(200, 100),
          color: Color(0xFF8BC34A),
          label: 'StrategyA',
        ),
      ],
      arrows: [
        ArrowPath(
          start: Offset(130, 100),
          end: Offset(170, 100),
          strokeWidth: 3.5,
        ),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: 'Strategy B로 교체',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF3F51B5),
          label: 'Context',
        ),
        CircleNode(
          position: Offset(200, 70),
          color: Color(0xFFE0E0E0),
          label: 'StrategyA',
        ),
        CircleNode(
          position: Offset(200, 130),
          color: Color(0xFFFF9800),
          label: 'StrategyB',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(130, 110), end: Offset(170, 125)),
      ],
    ),
    const AnimationStage(
      step: 4,
      description: 'Strategy B 알고리즘 실행',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF3F51B5),
          label: 'Context',
        ),
        CircleNode(
          position: Offset(200, 130),
          color: Color(0xFFFFC107),
          label: 'StrategyB',
        ),
      ],
      arrows: [
        ArrowPath(
          start: Offset(130, 110),
          end: Offset(170, 125),
          strokeWidth: 3.5,
        ),
      ],
    ),
  ];

  // Factory stages (3 stages)
  static final List<AnimationStage> _factoryStages = [
    const AnimationStage(
      step: 1,
      description: '클라이언트가 제품 타입 A 요청',
      circles: [
        CircleNode(
          position: Offset(80, 100),
          color: Color(0xFF2196F3),
          label: 'Client',
        ),
        CircleNode(
          position: Offset(220, 100),
          color: Color(0xFF9C27B0),
          label: 'Factory',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(110, 100), end: Offset(190, 100)),
      ],
    ),
    const AnimationStage(
      step: 2,
      description: 'Factory가 제품 A 생성',
      circles: [
        CircleNode(
          position: Offset(80, 100),
          color: Color(0xFF2196F3),
          label: 'Client',
        ),
        CircleNode(
          position: Offset(220, 60),
          color: Color(0xFF9C27B0),
          label: 'Factory',
        ),
        CircleNode(
          position: Offset(220, 140),
          color: Color(0xFF4CAF50),
          label: 'Product A',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(220, 90), end: Offset(220, 110)),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: '제품 A를 클라이언트에 반환',
      circles: [
        CircleNode(
          position: Offset(80, 100),
          color: Color(0xFF2196F3),
          label: 'Client',
        ),
        CircleNode(
          position: Offset(220, 140),
          color: Color(0xFF4CAF50),
          label: 'Product A',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(190, 130), end: Offset(110, 110)),
      ],
    ),
  ];

  // Abstract Factory stages (4 stages)
  static final List<AnimationStage> _abstractFactoryStages = [
    const AnimationStage(
      step: 1,
      description: '제품군 선택 (Theme A)',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF673AB7),
          label: 'Theme A',
        ),
      ],
      arrows: [],
    ),
    const AnimationStage(
      step: 2,
      description: 'Theme A Factory 생성',
      circles: [
        CircleNode(
          position: Offset(150, 50),
          color: Color(0xFF673AB7),
          label: 'Theme A',
        ),
        CircleNode(
          position: Offset(150, 130),
          color: Color(0xFF9C27B0),
          label: 'Factory A',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(150, 80), end: Offset(150, 100)),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: 'Factory A가 여러 제품 생성',
      circles: [
        CircleNode(
          position: Offset(150, 50),
          color: Color(0xFF9C27B0),
          label: 'Factory A',
        ),
        CircleNode(
          position: Offset(60, 140),
          color: Color(0xFF4CAF50),
          label: 'Button A',
        ),
        CircleNode(
          position: Offset(150, 140),
          color: Color(0xFF2196F3),
          label: 'Input A',
        ),
        CircleNode(
          position: Offset(240, 140),
          color: Color(0xFFFF9800),
          label: 'Panel A',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(135, 80), end: Offset(75, 120)),
        ArrowPath(start: Offset(150, 80), end: Offset(150, 110)),
        ArrowPath(start: Offset(165, 80), end: Offset(225, 120)),
      ],
    ),
    const AnimationStage(
      step: 4,
      description: '일관된 제품군 완성',
      circles: [
        CircleNode(
          position: Offset(60, 100),
          color: Color(0xFF4CAF50),
          label: 'Button A',
        ),
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF2196F3),
          label: 'Input A',
        ),
        CircleNode(
          position: Offset(240, 100),
          color: Color(0xFFFF9800),
          label: 'Panel A',
        ),
      ],
      arrows: [],
    ),
  ];

  // Builder stages (5 stages)
  static final List<AnimationStage> _builderStages = [
    const AnimationStage(
      step: 1,
      description: 'Builder 준비',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF607D8B),
          label: 'Builder',
        ),
      ],
      arrows: [],
    ),
    const AnimationStage(
      step: 2,
      description: '부품 A 추가',
      circles: [
        CircleNode(
          position: Offset(150, 80),
          color: Color(0xFF607D8B),
          label: 'Builder',
        ),
        CircleNode(
          position: Offset(100, 140),
          color: Color(0xFF4CAF50),
          label: 'Part A',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(135, 110), end: Offset(115, 125)),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: '부품 B 추가',
      circles: [
        CircleNode(
          position: Offset(150, 80),
          color: Color(0xFF607D8B),
          label: 'Builder',
        ),
        CircleNode(
          position: Offset(100, 140),
          color: Color(0xFF4CAF50),
          label: 'Part A',
        ),
        CircleNode(
          position: Offset(200, 140),
          color: Color(0xFF2196F3),
          label: 'Part B',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(165, 110), end: Offset(185, 125)),
      ],
    ),
    const AnimationStage(
      step: 4,
      description: '부품 C 추가',
      circles: [
        CircleNode(
          position: Offset(150, 60),
          color: Color(0xFF607D8B),
          label: 'Builder',
        ),
        CircleNode(
          position: Offset(90, 130),
          color: Color(0xFF4CAF50),
          label: 'Part A',
          radius: 20,
        ),
        CircleNode(
          position: Offset(150, 130),
          color: Color(0xFF2196F3),
          label: 'Part B',
          radius: 20,
        ),
        CircleNode(
          position: Offset(210, 130),
          color: Color(0xFFFF9800),
          label: 'Part C',
          radius: 20,
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(150, 90), end: Offset(210, 115)),
      ],
    ),
    const AnimationStage(
      step: 5,
      description: '최종 제품 조립 완료',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF9C27B0),
          label: 'Product',
          radius: 40,
        ),
      ],
      arrows: [],
    ),
  ];

  // Prototype stages (3 stages)
  static final List<AnimationStage> _prototypeStages = [
    const AnimationStage(
      step: 1,
      description: '원본(Prototype) 객체',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF2196F3),
          label: 'Original',
        ),
      ],
      arrows: [],
    ),
    const AnimationStage(
      step: 2,
      description: '객체 복제(Clone)',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF2196F3),
          label: 'Original',
        ),
        CircleNode(
          position: Offset(200, 100),
          color: Color(0xFF4CAF50),
          label: 'Clone',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(130, 100), end: Offset(170, 100), dashed: true),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: '복제본 독립적 수정',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF2196F3),
          label: 'Original',
        ),
        CircleNode(
          position: Offset(200, 100),
          color: Color(0xFFFF9800),
          label: 'Modified',
        ),
      ],
      arrows: [],
    ),
  ];

  // Adapter stages (3 stages)
  static final List<AnimationStage> _adapterStages = [
    const AnimationStage(
      step: 1,
      description: '호환되지 않는 인터페이스',
      circles: [
        CircleNode(
          position: Offset(80, 100),
          color: Color(0xFF2196F3),
          label: 'Client',
        ),
        CircleNode(
          position: Offset(220, 100),
          color: Color(0xFFF44336),
          label: 'Service',
        ),
      ],
      arrows: [
        ArrowPath(
          start: Offset(110, 100),
          end: Offset(190, 100),
          color: Color(0xFFF44336),
          dashed: true,
        ),
      ],
    ),
    const AnimationStage(
      step: 2,
      description: 'Adapter가 중간에서 변환',
      circles: [
        CircleNode(
          position: Offset(80, 100),
          color: Color(0xFF2196F3),
          label: 'Client',
        ),
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF9C27B0),
          label: 'Adapter',
        ),
        CircleNode(
          position: Offset(220, 100),
          color: Color(0xFF607D8B),
          label: 'Service',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(110, 100), end: Offset(120, 100)),
        ArrowPath(start: Offset(180, 100), end: Offset(190, 100)),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: '호환 가능한 인터페이스 완성',
      circles: [
        CircleNode(
          position: Offset(80, 100),
          color: Color(0xFF2196F3),
          label: 'Client',
        ),
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF9C27B0),
          label: 'Adapter',
        ),
        CircleNode(
          position: Offset(220, 100),
          color: Color(0xFF4CAF50),
          label: 'Service',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(110, 100), end: Offset(120, 100)),
        ArrowPath(start: Offset(180, 100), end: Offset(190, 100)),
      ],
    ),
  ];

  // Bridge stages (4 stages)
  static final List<AnimationStage> _bridgeStages = [
    const AnimationStage(
      step: 1,
      description: '추상화와 구현 분리',
      circles: [
        CircleNode(
          position: Offset(100, 80),
          color: Color(0xFF3F51B5),
          label: 'Abstraction',
        ),
        CircleNode(
          position: Offset(200, 80),
          color: Color(0xFF4CAF50),
          label: 'ImplA',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(130, 80), end: Offset(170, 80), dashed: true),
      ],
    ),
    const AnimationStage(
      step: 2,
      description: 'Abstraction이 구현 A 사용',
      circles: [
        CircleNode(
          position: Offset(100, 80),
          color: Color(0xFF3F51B5),
          label: 'Abstraction',
        ),
        CircleNode(
          position: Offset(200, 80),
          color: Color(0xFF8BC34A),
          label: 'ImplA',
        ),
      ],
      arrows: [
        ArrowPath(
          start: Offset(130, 80),
          end: Offset(170, 80),
          strokeWidth: 3.5,
        ),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: '구현을 ImplB로 교체',
      circles: [
        CircleNode(
          position: Offset(100, 80),
          color: Color(0xFF3F51B5),
          label: 'Abstraction',
        ),
        CircleNode(
          position: Offset(200, 60),
          color: Color(0xFFE0E0E0),
          label: 'ImplA',
        ),
        CircleNode(
          position: Offset(200, 120),
          color: Color(0xFFFF9800),
          label: 'ImplB',
        ),
      ],
      arrows: [
        ArrowPath(
          start: Offset(130, 90),
          end: Offset(170, 110),
          dashed: true,
        ),
      ],
    ),
    const AnimationStage(
      step: 4,
      description: 'Abstraction이 구현 B 사용',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF3F51B5),
          label: 'Abstraction',
        ),
        CircleNode(
          position: Offset(200, 100),
          color: Color(0xFFFFC107),
          label: 'ImplB',
        ),
      ],
      arrows: [
        ArrowPath(
          start: Offset(130, 100),
          end: Offset(170, 100),
          strokeWidth: 3.5,
        ),
      ],
    ),
  ];

  // Composite stages (4 stages)
  static final List<AnimationStage> _compositeStages = [
    const AnimationStage(
      step: 1,
      description: 'Leaf 노드 생성',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF4CAF50),
          label: 'Leaf',
        ),
      ],
      arrows: [],
    ),
    const AnimationStage(
      step: 2,
      description: 'Composite 노드 추가',
      circles: [
        CircleNode(
          position: Offset(150, 60),
          color: Color(0xFF2196F3),
          label: 'Composite',
        ),
        CircleNode(
          position: Offset(150, 140),
          color: Color(0xFF4CAF50),
          label: 'Leaf',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(150, 90), end: Offset(150, 110)),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: '여러 자식 노드 추가',
      circles: [
        CircleNode(
          position: Offset(150, 50),
          color: Color(0xFF2196F3),
          label: 'Root',
        ),
        CircleNode(
          position: Offset(80, 130),
          color: Color(0xFF4CAF50),
          label: 'Leaf1',
          radius: 22,
        ),
        CircleNode(
          position: Offset(150, 130),
          color: Color(0xFF4CAF50),
          label: 'Leaf2',
          radius: 22,
        ),
        CircleNode(
          position: Offset(220, 130),
          color: Color(0xFF4CAF50),
          label: 'Leaf3',
          radius: 22,
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(135, 75), end: Offset(95, 112)),
        ArrowPath(start: Offset(150, 80), end: Offset(150, 108)),
        ArrowPath(start: Offset(165, 75), end: Offset(205, 112)),
      ],
    ),
    const AnimationStage(
      step: 4,
      description: '트리 구조 완성',
      circles: [
        CircleNode(
          position: Offset(150, 40),
          color: Color(0xFF2196F3),
          label: 'Root',
          radius: 25,
        ),
        CircleNode(
          position: Offset(90, 100),
          color: Color(0xFF9C27B0),
          label: 'Branch',
          radius: 22,
        ),
        CircleNode(
          position: Offset(210, 100),
          color: Color(0xFF4CAF50),
          label: 'Leaf',
          radius: 22,
        ),
        CircleNode(
          position: Offset(60, 160),
          color: Color(0xFF4CAF50),
          label: 'L1',
          radius: 18,
        ),
        CircleNode(
          position: Offset(120, 160),
          color: Color(0xFF4CAF50),
          label: 'L2',
          radius: 18,
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(140, 60), end: Offset(100, 82)),
        ArrowPath(start: Offset(160, 60), end: Offset(200, 82)),
        ArrowPath(start: Offset(80, 118), end: Offset(68, 145)),
        ArrowPath(start: Offset(100, 118), end: Offset(112, 145)),
      ],
    ),
  ];

  // Decorator stages (4 stages)
  static final List<AnimationStage> _decoratorStages = [
    const AnimationStage(
      step: 1,
      description: '기본 컴포넌트',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF2196F3),
          label: 'Component',
        ),
      ],
      arrows: [],
    ),
    const AnimationStage(
      step: 2,
      description: 'Decorator A로 감싸기',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF2196F3),
          label: 'Component',
          radius: 25,
        ),
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF4CAF50),
          label: 'Dec A',
          radius: 38,
        ),
      ],
      arrows: [],
    ),
    const AnimationStage(
      step: 3,
      description: 'Decorator B 추가',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF2196F3),
          label: 'Comp',
          radius: 20,
        ),
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF4CAF50),
          label: 'Dec A',
          radius: 33,
        ),
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFFFF9800),
          label: 'Dec B',
          radius: 46,
        ),
      ],
      arrows: [],
    ),
    const AnimationStage(
      step: 4,
      description: '기능이 확장된 객체 완성',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF9C27B0),
          label: 'Enhanced',
          radius: 45,
        ),
      ],
      arrows: [],
    ),
  ];

  // Facade stages (3 stages)
  static final List<AnimationStage> _facadeStages = [
    const AnimationStage(
      step: 1,
      description: '복잡한 서브시스템',
      circles: [
        CircleNode(
          position: Offset(80, 80),
          color: Color(0xFF9E9E9E),
          label: 'SubA',
          radius: 22,
        ),
        CircleNode(
          position: Offset(150, 80),
          color: Color(0xFF9E9E9E),
          label: 'SubB',
          radius: 22,
        ),
        CircleNode(
          position: Offset(220, 80),
          color: Color(0xFF9E9E9E),
          label: 'SubC',
          radius: 22,
        ),
        CircleNode(
          position: Offset(115, 140),
          color: Color(0xFF9E9E9E),
          label: 'SubD',
          radius: 22,
        ),
        CircleNode(
          position: Offset(185, 140),
          color: Color(0xFF9E9E9E),
          label: 'SubE',
          radius: 22,
        ),
      ],
      arrows: [],
    ),
    const AnimationStage(
      step: 2,
      description: 'Facade가 단순한 인터페이스 제공',
      circles: [
        CircleNode(
          position: Offset(150, 50),
          color: Color(0xFF2196F3),
          label: 'Facade',
        ),
        CircleNode(
          position: Offset(80, 120),
          color: Color(0xFF9E9E9E),
          label: 'A',
          radius: 18,
        ),
        CircleNode(
          position: Offset(130, 120),
          color: Color(0xFF9E9E9E),
          label: 'B',
          radius: 18,
        ),
        CircleNode(
          position: Offset(180, 120),
          color: Color(0xFF9E9E9E),
          label: 'C',
          radius: 18,
        ),
        CircleNode(
          position: Offset(105, 165),
          color: Color(0xFF9E9E9E),
          label: 'D',
          radius: 18,
        ),
        CircleNode(
          position: Offset(155, 165),
          color: Color(0xFF9E9E9E),
          label: 'E',
          radius: 18,
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(135, 75), end: Offset(90, 105)),
        ArrowPath(start: Offset(150, 80), end: Offset(130, 102)),
        ArrowPath(start: Offset(165, 75), end: Offset(170, 102)),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: '클라이언트는 Facade만 사용',
      circles: [
        CircleNode(
          position: Offset(80, 100),
          color: Color(0xFF4CAF50),
          label: 'Client',
        ),
        CircleNode(
          position: Offset(220, 100),
          color: Color(0xFF2196F3),
          label: 'Facade',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(110, 100), end: Offset(190, 100)),
      ],
    ),
  ];

  // Flyweight stages (4 stages)
  static final List<AnimationStage> _flyweightStages = [
    const AnimationStage(
      step: 1,
      description: '첫 번째 객체 생성 (타입 A)',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF2196F3),
          label: 'A',
        ),
      ],
      arrows: [],
    ),
    const AnimationStage(
      step: 2,
      description: '타입 A 재사용, 새 타입 B 생성',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF2196F3),
          label: 'A',
        ),
        CircleNode(
          position: Offset(200, 100),
          color: Color(0xFF4CAF50),
          label: 'B',
        ),
      ],
      arrows: [],
    ),
    const AnimationStage(
      step: 3,
      description: '기존 객체들 재사용',
      circles: [
        CircleNode(
          position: Offset(80, 70),
          color: Color(0xFF2196F3),
          label: 'A',
          radius: 25,
        ),
        CircleNode(
          position: Offset(150, 70),
          color: Color(0xFF4CAF50),
          label: 'B',
          radius: 25,
        ),
        CircleNode(
          position: Offset(220, 70),
          color: Color(0xFF2196F3),
          label: 'A',
          radius: 25,
        ),
        CircleNode(
          position: Offset(115, 140),
          color: Color(0xFF4CAF50),
          label: 'B',
          radius: 25,
        ),
        CircleNode(
          position: Offset(185, 140),
          color: Color(0xFF2196F3),
          label: 'A',
          radius: 25,
        ),
      ],
      arrows: [
        ArrowPath(
          start: Offset(80, 95),
          end: Offset(80, 70),
          dashed: true,
          color: Color(0xFF2196F3),
        ),
        ArrowPath(
          start: Offset(150, 95),
          end: Offset(150, 70),
          dashed: true,
          color: Color(0xFF4CAF50),
        ),
        ArrowPath(
          start: Offset(220, 95),
          end: Offset(220, 70),
          dashed: true,
          color: Color(0xFF2196F3),
        ),
      ],
    ),
    const AnimationStage(
      step: 4,
      description: '메모리 절약: 2개 객체만 공유',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF2196F3),
          label: 'A (shared)',
          radius: 35,
        ),
        CircleNode(
          position: Offset(200, 100),
          color: Color(0xFF4CAF50),
          label: 'B (shared)',
          radius: 35,
        ),
      ],
      arrows: [],
    ),
  ];

  // Proxy stages (3 stages)
  static final List<AnimationStage> _proxyStages = [
    const AnimationStage(
      step: 1,
      description: '클라이언트가 요청',
      circles: [
        CircleNode(
          position: Offset(80, 100),
          color: Color(0xFF2196F3),
          label: 'Client',
        ),
        CircleNode(
          position: Offset(220, 100),
          color: Color(0xFF9C27B0),
          label: 'Proxy',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(110, 100), end: Offset(190, 100)),
      ],
    ),
    const AnimationStage(
      step: 2,
      description: 'Proxy가 실제 객체 접근',
      circles: [
        CircleNode(
          position: Offset(80, 100),
          color: Color(0xFF2196F3),
          label: 'Client',
        ),
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF9C27B0),
          label: 'Proxy',
        ),
        CircleNode(
          position: Offset(220, 100),
          color: Color(0xFF4CAF50),
          label: 'Real',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(180, 100), end: Offset(190, 100)),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: '결과를 클라이언트에 반환',
      circles: [
        CircleNode(
          position: Offset(80, 100),
          color: Color(0xFF4CAF50),
          label: 'Client',
        ),
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF9C27B0),
          label: 'Proxy',
        ),
        CircleNode(
          position: Offset(220, 100),
          color: Color(0xFF4CAF50),
          label: 'Real',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(120, 100), end: Offset(110, 100)),
      ],
    ),
  ];

  // Command stages (4 stages)
  static final List<AnimationStage> _commandStages = [
    const AnimationStage(
      step: 1,
      description: 'Command 객체 생성',
      circles: [
        CircleNode(
          position: Offset(80, 100),
          color: Color(0xFF2196F3),
          label: 'Client',
        ),
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF9C27B0),
          label: 'Command',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(110, 100), end: Offset(120, 100)),
      ],
    ),
    const AnimationStage(
      step: 2,
      description: 'Invoker에 Command 전달',
      circles: [
        CircleNode(
          position: Offset(80, 100),
          color: Color(0xFF2196F3),
          label: 'Client',
        ),
        CircleNode(
          position: Offset(150, 70),
          color: Color(0xFF9C27B0),
          label: 'Command',
        ),
        CircleNode(
          position: Offset(150, 130),
          color: Color(0xFFFF9800),
          label: 'Invoker',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(150, 100), end: Offset(150, 110)),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: 'Command 실행',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF9C27B0),
          label: 'Command',
        ),
        CircleNode(
          position: Offset(200, 100),
          color: Color(0xFF4CAF50),
          label: 'Receiver',
        ),
      ],
      arrows: [
        ArrowPath(
          start: Offset(130, 100),
          end: Offset(170, 100),
          strokeWidth: 3.5,
        ),
      ],
    ),
    const AnimationStage(
      step: 4,
      description: 'Receiver가 작업 수행',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF9C27B0),
          label: 'Command',
        ),
        CircleNode(
          position: Offset(200, 100),
          color: Color(0xFF8BC34A),
          label: 'Receiver',
        ),
      ],
      arrows: [],
    ),
  ];

  // State stages (4 stages)
  static final List<AnimationStage> _stateStages = [
    const AnimationStage(
      step: 1,
      description: 'Context가 State A 사용',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF3F51B5),
          label: 'Context',
        ),
        CircleNode(
          position: Offset(200, 100),
          color: Color(0xFF4CAF50),
          label: 'State A',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(130, 100), end: Offset(170, 100)),
      ],
    ),
    const AnimationStage(
      step: 2,
      description: 'State A의 동작 실행',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF3F51B5),
          label: 'Context',
        ),
        CircleNode(
          position: Offset(200, 100),
          color: Color(0xFF8BC34A),
          label: 'State A',
        ),
      ],
      arrows: [
        ArrowPath(
          start: Offset(130, 100),
          end: Offset(170, 100),
          strokeWidth: 3.5,
        ),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: 'State B로 전환',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF3F51B5),
          label: 'Context',
        ),
        CircleNode(
          position: Offset(200, 70),
          color: Color(0xFFE0E0E0),
          label: 'State A',
        ),
        CircleNode(
          position: Offset(200, 130),
          color: Color(0xFFFF9800),
          label: 'State B',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(130, 110), end: Offset(170, 125)),
      ],
    ),
    const AnimationStage(
      step: 4,
      description: 'State B의 동작 실행',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF3F51B5),
          label: 'Context',
        ),
        CircleNode(
          position: Offset(200, 100),
          color: Color(0xFFFFC107),
          label: 'State B',
        ),
      ],
      arrows: [
        ArrowPath(
          start: Offset(130, 100),
          end: Offset(170, 100),
          strokeWidth: 3.5,
        ),
      ],
    ),
  ];

  // Template stages (3 stages)
  static final List<AnimationStage> _templateStages = [
    const AnimationStage(
      step: 1,
      description: '템플릿 메서드 정의',
      circles: [
        CircleNode(
          position: Offset(150, 80),
          color: Color(0xFF3F51B5),
          label: 'Base',
        ),
      ],
      arrows: [],
    ),
    const AnimationStage(
      step: 2,
      description: '서브클래스가 단계 구현',
      circles: [
        CircleNode(
          position: Offset(150, 60),
          color: Color(0xFF3F51B5),
          label: 'Base',
        ),
        CircleNode(
          position: Offset(100, 140),
          color: Color(0xFF4CAF50),
          label: 'SubA',
        ),
        CircleNode(
          position: Offset(200, 140),
          color: Color(0xFFFF9800),
          label: 'SubB',
        ),
      ],
      arrows: [
        ArrowPath(
          start: Offset(140, 85),
          end: Offset(110, 120),
          dashed: true,
        ),
        ArrowPath(
          start: Offset(160, 85),
          end: Offset(190, 120),
          dashed: true,
        ),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: '템플릿 알고리즘 실행',
      circles: [
        CircleNode(
          position: Offset(150, 60),
          color: Color(0xFF5C6BC0),
          label: 'Base',
        ),
        CircleNode(
          position: Offset(100, 140),
          color: Color(0xFF8BC34A),
          label: 'SubA',
        ),
        CircleNode(
          position: Offset(200, 140),
          color: Color(0xFFFFC107),
          label: 'SubB',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(140, 85), end: Offset(110, 120)),
        ArrowPath(start: Offset(160, 85), end: Offset(190, 120)),
      ],
    ),
  ];

  // Iterator stages (4 stages)
  static final List<AnimationStage> _iteratorStages = [
    const AnimationStage(
      step: 1,
      description: '컬렉션과 Iterator 생성',
      circles: [
        CircleNode(
          position: Offset(150, 80),
          color: Color(0xFF3F51B5),
          label: 'Collection',
        ),
        CircleNode(
          position: Offset(150, 140),
          color: Color(0xFF9C27B0),
          label: 'Iterator',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(150, 110), end: Offset(150, 120)),
      ],
    ),
    const AnimationStage(
      step: 2,
      description: '첫 번째 요소 접근',
      circles: [
        CircleNode(
          position: Offset(80, 60),
          color: Color(0xFF4CAF50),
          label: 'Item1',
          radius: 22,
        ),
        CircleNode(
          position: Offset(150, 60),
          color: Color(0xFF9E9E9E),
          label: 'Item2',
          radius: 22,
        ),
        CircleNode(
          position: Offset(220, 60),
          color: Color(0xFF9E9E9E),
          label: 'Item3',
          radius: 22,
        ),
        CircleNode(
          position: Offset(150, 140),
          color: Color(0xFF9C27B0),
          label: 'Iterator',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(135, 120), end: Offset(90, 80)),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: '두 번째 요소 접근',
      circles: [
        CircleNode(
          position: Offset(80, 60),
          color: Color(0xFF9E9E9E),
          label: 'Item1',
          radius: 22,
        ),
        CircleNode(
          position: Offset(150, 60),
          color: Color(0xFF4CAF50),
          label: 'Item2',
          radius: 22,
        ),
        CircleNode(
          position: Offset(220, 60),
          color: Color(0xFF9E9E9E),
          label: 'Item3',
          radius: 22,
        ),
        CircleNode(
          position: Offset(150, 140),
          color: Color(0xFF9C27B0),
          label: 'Iterator',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(150, 120), end: Offset(150, 82)),
      ],
    ),
    const AnimationStage(
      step: 4,
      description: '세 번째 요소 접근',
      circles: [
        CircleNode(
          position: Offset(80, 60),
          color: Color(0xFF9E9E9E),
          label: 'Item1',
          radius: 22,
        ),
        CircleNode(
          position: Offset(150, 60),
          color: Color(0xFF9E9E9E),
          label: 'Item2',
          radius: 22,
        ),
        CircleNode(
          position: Offset(220, 60),
          color: Color(0xFF4CAF50),
          label: 'Item3',
          radius: 22,
        ),
        CircleNode(
          position: Offset(150, 140),
          color: Color(0xFF9C27B0),
          label: 'Iterator',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(165, 120), end: Offset(210, 80)),
      ],
    ),
  ];

  // Mediator stages (4 stages)
  static final List<AnimationStage> _mediatorStages = [
    const AnimationStage(
      step: 1,
      description: '컴포넌트들이 직접 통신 (복잡함)',
      circles: [
        CircleNode(
          position: Offset(80, 80),
          color: Color(0xFF9E9E9E),
          label: 'C1',
          radius: 22,
        ),
        CircleNode(
          position: Offset(220, 80),
          color: Color(0xFF9E9E9E),
          label: 'C2',
          radius: 22,
        ),
        CircleNode(
          position: Offset(80, 140),
          color: Color(0xFF9E9E9E),
          label: 'C3',
          radius: 22,
        ),
        CircleNode(
          position: Offset(220, 140),
          color: Color(0xFF9E9E9E),
          label: 'C4',
          radius: 22,
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(100, 90), end: Offset(200, 90)),
        ArrowPath(start: Offset(90, 100), end: Offset(90, 120)),
        ArrowPath(start: Offset(210, 100), end: Offset(210, 120)),
        ArrowPath(start: Offset(100, 130), end: Offset(200, 130)),
      ],
    ),
    const AnimationStage(
      step: 2,
      description: 'Mediator 도입',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF9C27B0),
          label: 'Mediator',
        ),
        CircleNode(
          position: Offset(80, 50),
          color: Color(0xFF9E9E9E),
          label: 'C1',
          radius: 20,
        ),
        CircleNode(
          position: Offset(220, 50),
          color: Color(0xFF9E9E9E),
          label: 'C2',
          radius: 20,
        ),
        CircleNode(
          position: Offset(80, 150),
          color: Color(0xFF9E9E9E),
          label: 'C3',
          radius: 20,
        ),
        CircleNode(
          position: Offset(220, 150),
          color: Color(0xFF9E9E9E),
          label: 'C4',
          radius: 20,
        ),
      ],
      arrows: [
        ArrowPath(
          start: Offset(95, 65),
          end: Offset(135, 85),
          dashed: true,
        ),
        ArrowPath(
          start: Offset(205, 65),
          end: Offset(165, 85),
          dashed: true,
        ),
        ArrowPath(
          start: Offset(95, 135),
          end: Offset(135, 115),
          dashed: true,
        ),
        ArrowPath(
          start: Offset(205, 135),
          end: Offset(165, 115),
          dashed: true,
        ),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: 'C1이 Mediator를 통해 통신',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF9C27B0),
          label: 'Mediator',
        ),
        CircleNode(
          position: Offset(80, 50),
          color: Color(0xFF4CAF50),
          label: 'C1',
          radius: 20,
        ),
        CircleNode(
          position: Offset(220, 50),
          color: Color(0xFF9E9E9E),
          label: 'C2',
          radius: 20,
        ),
        CircleNode(
          position: Offset(80, 150),
          color: Color(0xFF9E9E9E),
          label: 'C3',
          radius: 20,
        ),
        CircleNode(
          position: Offset(220, 150),
          color: Color(0xFF9E9E9E),
          label: 'C4',
          radius: 20,
        ),
      ],
      arrows: [
        ArrowPath(
          start: Offset(95, 65),
          end: Offset(135, 85),
          strokeWidth: 3.0,
        ),
      ],
    ),
    const AnimationStage(
      step: 4,
      description: 'Mediator가 다른 컴포넌트에 전달',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF9C27B0),
          label: 'Mediator',
        ),
        CircleNode(
          position: Offset(80, 50),
          color: Color(0xFF4CAF50),
          label: 'C1',
          radius: 20,
        ),
        CircleNode(
          position: Offset(220, 50),
          color: Color(0xFF4CAF50),
          label: 'C2',
          radius: 20,
        ),
        CircleNode(
          position: Offset(80, 150),
          color: Color(0xFF4CAF50),
          label: 'C3',
          radius: 20,
        ),
        CircleNode(
          position: Offset(220, 150),
          color: Color(0xFF4CAF50),
          label: 'C4',
          radius: 20,
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(165, 85), end: Offset(205, 65)),
        ArrowPath(start: Offset(135, 115), end: Offset(95, 135)),
        ArrowPath(start: Offset(165, 115), end: Offset(205, 135)),
      ],
    ),
  ];

  // Memento stages (4 stages)
  static final List<AnimationStage> _mementoStages = [
    const AnimationStage(
      step: 1,
      description: 'Originator 초기 상태',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF2196F3),
          label: 'Originator',
        ),
      ],
      arrows: [],
    ),
    const AnimationStage(
      step: 2,
      description: '상태를 Memento에 저장',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF2196F3),
          label: 'Originator',
        ),
        CircleNode(
          position: Offset(200, 100),
          color: Color(0xFF9C27B0),
          label: 'Memento',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(130, 100), end: Offset(170, 100)),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: 'Originator 상태 변경',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFFFF9800),
          label: 'Modified',
        ),
        CircleNode(
          position: Offset(200, 100),
          color: Color(0xFF9C27B0),
          label: 'Memento',
        ),
      ],
      arrows: [],
    ),
    const AnimationStage(
      step: 4,
      description: 'Memento에서 상태 복원',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF2196F3),
          label: 'Restored',
        ),
        CircleNode(
          position: Offset(200, 100),
          color: Color(0xFF9C27B0),
          label: 'Memento',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(170, 100), end: Offset(130, 100)),
      ],
    ),
  ];

  // Chain stages (3 stages)
  static final List<AnimationStage> _chainStages = [
    const AnimationStage(
      step: 1,
      description: '요청이 첫 번째 핸들러로',
      circles: [
        CircleNode(
          position: Offset(70, 100),
          color: Color(0xFF2196F3),
          label: 'Request',
          radius: 25,
        ),
        CircleNode(
          position: Offset(140, 100),
          color: Color(0xFF9E9E9E),
          label: 'H1',
          radius: 25,
        ),
        CircleNode(
          position: Offset(210, 100),
          color: Color(0xFF9E9E9E),
          label: 'H2',
          radius: 25,
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(95, 100), end: Offset(115, 100)),
      ],
    ),
    const AnimationStage(
      step: 2,
      description: 'H1이 처리 못함, H2로 전달',
      circles: [
        CircleNode(
          position: Offset(70, 100),
          color: Color(0xFF2196F3),
          label: 'Request',
          radius: 25,
        ),
        CircleNode(
          position: Offset(140, 100),
          color: Color(0xFFE0E0E0),
          label: 'H1',
          radius: 25,
        ),
        CircleNode(
          position: Offset(210, 100),
          color: Color(0xFF9E9E9E),
          label: 'H2',
          radius: 25,
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(165, 100), end: Offset(185, 100)),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: 'H2가 요청 처리',
      circles: [
        CircleNode(
          position: Offset(70, 100),
          color: Color(0xFF4CAF50),
          label: 'Request',
          radius: 25,
        ),
        CircleNode(
          position: Offset(140, 100),
          color: Color(0xFFE0E0E0),
          label: 'H1',
          radius: 25,
        ),
        CircleNode(
          position: Offset(210, 100),
          color: Color(0xFF4CAF50),
          label: 'H2',
          radius: 25,
        ),
      ],
      arrows: [],
    ),
  ];

  // Visitor stages (4 stages)
  static final List<AnimationStage> _visitorStages = [
    const AnimationStage(
      step: 1,
      description: '여러 요소 타입 존재',
      circles: [
        CircleNode(
          position: Offset(100, 100),
          color: Color(0xFF2196F3),
          label: 'ElemA',
        ),
        CircleNode(
          position: Offset(200, 100),
          color: Color(0xFF4CAF50),
          label: 'ElemB',
        ),
      ],
      arrows: [],
    ),
    const AnimationStage(
      step: 2,
      description: 'Visitor 생성',
      circles: [
        CircleNode(
          position: Offset(100, 140),
          color: Color(0xFF2196F3),
          label: 'ElemA',
          radius: 25,
        ),
        CircleNode(
          position: Offset(200, 140),
          color: Color(0xFF4CAF50),
          label: 'ElemB',
          radius: 25,
        ),
        CircleNode(
          position: Offset(150, 60),
          color: Color(0xFF9C27B0),
          label: 'Visitor',
        ),
      ],
      arrows: [],
    ),
    const AnimationStage(
      step: 3,
      description: 'Visitor가 ElemA 방문',
      circles: [
        CircleNode(
          position: Offset(100, 140),
          color: Color(0xFF64B5F6),
          label: 'ElemA',
          radius: 25,
        ),
        CircleNode(
          position: Offset(200, 140),
          color: Color(0xFF4CAF50),
          label: 'ElemB',
          radius: 25,
        ),
        CircleNode(
          position: Offset(150, 60),
          color: Color(0xFF9C27B0),
          label: 'Visitor',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(135, 85), end: Offset(110, 120)),
      ],
    ),
    const AnimationStage(
      step: 4,
      description: 'Visitor가 ElemB 방문',
      circles: [
        CircleNode(
          position: Offset(100, 140),
          color: Color(0xFF64B5F6),
          label: 'ElemA',
          radius: 25,
        ),
        CircleNode(
          position: Offset(200, 140),
          color: Color(0xFF81C784),
          label: 'ElemB',
          radius: 25,
        ),
        CircleNode(
          position: Offset(150, 60),
          color: Color(0xFF9C27B0),
          label: 'Visitor',
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(165, 85), end: Offset(190, 120)),
      ],
    ),
  ];

  // Interpreter stages (4 stages)
  static final List<AnimationStage> _interpreterStages = [
    const AnimationStage(
      step: 1,
      description: '표현식 입력',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF9E9E9E),
          label: 'A+B',
        ),
      ],
      arrows: [],
    ),
    const AnimationStage(
      step: 2,
      description: '표현식 트리 구성',
      circles: [
        CircleNode(
          position: Offset(150, 60),
          color: Color(0xFF2196F3),
          label: '+',
          radius: 25,
        ),
        CircleNode(
          position: Offset(100, 130),
          color: Color(0xFF4CAF50),
          label: 'A',
          radius: 25,
        ),
        CircleNode(
          position: Offset(200, 130),
          color: Color(0xFF4CAF50),
          label: 'B',
          radius: 25,
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(140, 80), end: Offset(110, 110)),
        ArrowPath(start: Offset(160, 80), end: Offset(190, 110)),
      ],
    ),
    const AnimationStage(
      step: 3,
      description: '각 노드 해석',
      circles: [
        CircleNode(
          position: Offset(150, 60),
          color: Color(0xFF2196F3),
          label: '+',
          radius: 25,
        ),
        CircleNode(
          position: Offset(100, 130),
          color: Color(0xFF8BC34A),
          label: 'A',
          radius: 25,
        ),
        CircleNode(
          position: Offset(200, 130),
          color: Color(0xFF8BC34A),
          label: 'B',
          radius: 25,
        ),
      ],
      arrows: [
        ArrowPath(start: Offset(140, 80), end: Offset(110, 110)),
        ArrowPath(start: Offset(160, 80), end: Offset(190, 110)),
      ],
    ),
    const AnimationStage(
      step: 4,
      description: '최종 결과 계산',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF9C27B0),
          label: 'Result',
          radius: 35,
        ),
      ],
      arrows: [],
    ),
  ];

  // Default fallback
  static final List<AnimationStage> _defaultStages = [
    const AnimationStage(
      step: 1,
      description: '애니메이션이 아직 준비되지 않았습니다',
      circles: [
        CircleNode(
          position: Offset(150, 100),
          color: Color(0xFF9E9E9E),
          label: '?',
        ),
      ],
      arrows: [],
    ),
  ];
}
