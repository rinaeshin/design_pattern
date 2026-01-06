import '../models/design_pattern.dart';

final List<DesignPattern> patterns = [
  // Creational
  DesignPattern(
    id: 'factory',
    category: 'creational',
    name: 'Factory',
    intent: '객체 생성 책임을 캡슐화하여 클라이언트가 세부 구현에 의존하지 않게 한다.',
    summary: '객체 생성 로직을 분리하여 확장에 유리하게 만든다.',
    exampleCode: r'''abstract class Product {}
class ConcreteProductA implements Product {}
class ConcreteProductB implements Product {}
class ProductFactory {
  static Product create(String type) {
    if (type == 'A') return ConcreteProductA();
    return ConcreteProductB();
  }
}
''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'abstract_factory',
    category: 'creational',
    name: 'Abstract Factory',
    intent: '관련된 혹은 의존하는 객체들의 군(패밀리)을 생성하는 인터페이스를 제공한다.',
    summary: '구체 클래스에 의존하지 않고 객체군을 생성한다.',
    exampleCode: r'''abstract class WidgetFactory { Button createButton(); }
class MacFactory implements WidgetFactory { @override Button createButton() => MacButton(); }
''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'builder',
    category: 'creational',
    name: 'Builder',
    intent: '복합 객체의 생성과 표현을 분리하여 동일한 생성 절차에서 서로 다른 표현을 만들 수 있게 한다.',
    summary: '복잡한 객체를 단계별로 생성한다.',
    exampleCode:
        r'''class ProductBuilder { void buildPartA(){} void buildPartB(){} Product getResult(){} }
''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'prototype',
    category: 'creational',
    name: 'Prototype',
    intent: '이미 존재하는 객체를 복사(clone)해서 새로운 객체를 생성한다.',
    summary: '새 인스턴스를 만드는 비용이 클 때 복제를 사용한다.',
    exampleCode: r'''class Prototype { Prototype clone() => Prototype(); }
''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'singleton',
    category: 'creational',
    name: 'Singleton',
    intent: '클래스의 인스턴스를 한 개만 만들고 전역적으로 접근을 제공한다.',
    summary: '애플리케이션 전체에서 공유되는 단일 인스턴스를 보장한다.',
    exampleCode:
        r'''class Singleton { Singleton._(); static final Singleton _inst = Singleton._(); factory Singleton() => _inst; }
''',
    dartpadUrl: null,
  ),

  // Structural
  DesignPattern(
    id: 'adapter',
    category: 'structural',
    name: 'Adapter',
    intent: '호환되지 않는 인터페이스를 가진 클래스들을 함께 작동하도록 연결한다.',
    summary: '기존 코드를 변경하지 않고 인터페이스를 변환한다.',
    exampleCode: r'''class Adaptee { String specificRequest() => 'specific'; }
class Target { String request() => 'default'; }
class Adapter implements Target { final Adaptee adaptee; Adapter(this.adaptee); String request() => adaptee.specificRequest(); }
''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'bridge',
    category: 'structural',
    name: 'Bridge',
    intent: '추상화와 구현을 분리하여 독립적으로 변형할 수 있도록 한다.',
    summary: '인터페이스(Abstraction)와 구현(Implementor)을 분리한다.',
    exampleCode: r'''abstract class Implementor { String operation(); }
class ConcreteImplA implements Implementor { String operation() => 'A'; }
class Abstraction { final Implementor impl; Abstraction(this.impl); String operation() => impl.operation(); }
''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'composite',
    category: 'structural',
    name: 'Composite',
    intent: '객체들을 트리 구조로 구성하여 부분-전체 계층을 표현한다.',
    summary: '개별 객체와 복합 객체를 동일하게 다룬다.',
    exampleCode: r'''abstract class Component { void operation(); }
class Leaf implements Component { void operation() => print('leaf'); }
class Composite implements Component { final List<Component> children = []; void operation(){ for(var c in children) c.operation(); } }
''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'decorator',
    category: 'structural',
    name: 'Decorator',
    intent: '객체에 추가 행동을 동적으로 더한다.',
    summary: '상속 대신 조합을 사용하여 책임을 확장한다.',
    exampleCode: r'''abstract class Component { String operation(); }
class ConcreteComponent implements Component { String operation() => 'core'; }
class Decorator implements Component { final Component wrap; Decorator(this.wrap); String operation() => '${wrap.operation()} + added'; }
''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'facade',
    category: 'structural',
    name: 'Facade',
    intent: '복잡한 서브시스템에 대한 단순한 인터페이스를 제공한다.',
    summary: '서브시스템을 캡슐화하고 간단한 인터페이스를 노출한다.',
    exampleCode:
        r'''class SubA{String a()=>'A';} class SubB{String b()=>'B';} class Facade{final SubA a; final SubB b; Facade(this.a,this.b); String op()=>a.a() + b.b();}
''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'flyweight',
    category: 'structural',
    name: 'Flyweight',
    intent: '공유 가능한 객체들을 사용해 많은 수의 비슷한 객체 생성 비용을 줄인다.',
    summary: '상태를 공유하고 외부 상태는 별도로 관리한다.',
    exampleCode:
        r'''class Flyweight{ final String intrinsic; Flyweight(this.intrinsic); }
class FlyweightFactory{ final Map<String,Flyweight> pool={}; Flyweight get(String k)=>pool.putIfAbsent(k, ()=>Flyweight(k)); }
''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'proxy',
    category: 'structural',
    name: 'Proxy',
    intent: '다른 객체에 대한 접근을 제어하거나 대리한다.',
    summary: '접근 제어, 지연 초기화, 로깅 등에 사용한다.',
    exampleCode:
        r'''class RealSubject{ String request()=> 'real'; } class Proxy{ final RealSubject real; Proxy(this.real); String request()=> real.request(); }
''',
    dartpadUrl: null,
  ),

  // Behavioral
  DesignPattern(
    id: 'strategy',
    category: 'behavioral',
    name: 'Strategy',
    intent: '알고리즘을 캡슐화하고 런타임에 교체할 수 있게 한다.',
    summary: '동일한 작업을 다양한 방식으로 수행할 수 있게 한다.',
    exampleCode: r'''abstract class Strategy { String run(String input); }
class StrategyA implements Strategy { String run(String input)=>'A($input)'; }
class Context{ Strategy s; Context(this.s); String exec(String i)=>s.run(i);}''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'observer',
    category: 'behavioral',
    name: 'Observer',
    intent: '객체 상태 변화를 다른 객체들에게 통지한다.',
    summary: '발행-구독 형태로 구성하여 느슨한 결합을 유지한다.',
    exampleCode:
        r'''class Subject{ final _listeners=<void Function(int)>[]; int _v=0; void add(void Function(int)l)=>_listeners.add(l); void inc(){_v++; _listeners.forEach((l)=>l(_v));}}''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'command',
    category: 'behavioral',
    name: 'Command',
    intent: '요청을 객체로 캡슐화하여 호출자와 수행자를 분리한다.',
    summary: '작업을 객체로 만들어 큐잉, 로깅, 취소 등을 쉽게 한다.',
    exampleCode:
        r'''abstract class Command{ void execute(); } class Light{ bool on=false; void onCmd()=>on=true; void offCmd()=>on=false;} class OnCommand implements Command{ final Light l; OnCommand(this.l); void execute()=>l.onCmd(); }''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'state',
    category: 'behavioral',
    name: 'State',
    intent: '객체의 상태에 따라 행동이 달라지도록 한다.',
    summary: '상태를 객체로 캡슐화하여 상태 전환을 관리한다.',
    exampleCode:
        r'''abstract class State{ String action(); } class Happy implements State{ String action()=> 'happy'; } class Context{ State s; Context(this.s); String doAction()=>s.action(); }''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'template',
    category: 'behavioral',
    name: 'Template Method',
    intent: '알고리즘의 골격을 정의하고 일부 단계를 하위 클래스에서 구현하게 한다.',
    summary: '공통 알고리즘 흐름을 유지하면서 세부 단계를 하위 클래스에서 구현한다.',
    exampleCode:
        r'''abstract class Game{ void initialize(); void start(); void end(); void play(){ initialize(); start(); end(); } }''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'iterator',
    category: 'behavioral',
    name: 'Iterator',
    intent: '순회 방법을 제공하여 내부 표현을 노출하지 않고 컬렉션 요소에 접근한다.',
    summary: '컬렉션의 순회를 캡슐화한다.',
    exampleCode:
        r'''class MyList{ final items=<int>[]; Iterator<int> iterator()=>items.iterator; }''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'mediator',
    category: 'behavioral',
    name: 'Mediator',
    intent: '여러 객체 간의 상호작용을 중재하여 직접적인 참조를 줄인다.',
    summary: '중앙 객체가 협력 객체 간의 통신을 관리한다.',
    exampleCode: r'''class Mediator{ void notify(String msg){} }''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'memento',
    category: 'behavioral',
    name: 'Memento',
    intent: '객체의 내부 상태를 캡쳐하여 나중에 복원할 수 있게 한다.',
    summary: '외부에서 상태를 노출하지 않고 상태 복원을 제공한다.',
    exampleCode:
        r'''class Memento{ final String state; Memento(this.state);}''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'chain',
    category: 'behavioral',
    name: 'Chain of Responsibility',
    intent: '요청을 처리할 수 있는 객체를 연결하여 처리 책임을 위임한다.',
    summary: '요청을 여러 객체가 순차적으로 처리한다.',
    exampleCode:
        r'''abstract class Handler{ Handler? next; void handle(String req){ if(next!=null) next!.handle(req);} }''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'visitor',
    category: 'behavioral',
    name: 'Visitor',
    intent: '연산을 객체 구조에서 분리하여 새로운 연산을 추가하기 쉽게 한다.',
    summary: '객체 구조에 새로운 연산을 추가한다.',
    exampleCode: r'''abstract class Visitor{ void visit(Element e);}''',
    dartpadUrl: null,
  ),
  DesignPattern(
    id: 'interpreter',
    category: 'behavioral',
    name: 'Interpreter',
    intent: '언어의 문법을 표현하고 해석기(인터프리터)를 정의한다.',
    summary: '간단한 언어를 정의하고 해석한다.',
    exampleCode: r'''abstract class Expression{ int interpret(); }''',
    dartpadUrl: null,
  ),
];
