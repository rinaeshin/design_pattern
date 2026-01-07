// Command pattern
abstract class Command {
  void execute();
}

class Light {
  bool on = false;
  void onCmd() => on = true; // Turn the light on
  void offCmd() => on = false; // Turn the light off
}

class OnCommand implements Command {
  final Light light;
  OnCommand(this.light);
  @override
  void execute() => light.onCmd(); // Execute the command to turn the light on
}

class OffCommand implements Command {
  final Light light;
  OffCommand(this.light);
  @override
  void execute() => light.offCmd(); // Execute the command to turn the light off
}

class Remote {
  Command? slot;
  void press() => slot?.execute(); // Execute the assigned command
}
