// Command pattern
abstract class Command {
  void execute();
}

class Light {
  bool on = false;
  void onCmd() => on = true;
  void offCmd() => on = false;
}

class OnCommand implements Command {
  final Light light;
  OnCommand(this.light);
  @override
  void execute() => light.onCmd();
}

class OffCommand implements Command {
  final Light light;
  OffCommand(this.light);
  @override
  void execute() => light.offCmd();
}

class Remote {
  Command? slot;
  void press() => slot?.execute();
}
