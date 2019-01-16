import 'helper.dart';

class Configurator {
  int strikes;
  int modules;
  int batteries;
  String serial;
  List<Label> _labels;
  Map<String, bool> _ports;

  Configurator() {
    strikes = 0;
    modules = 5;
    batteries = 0;
    serial = "";
    _labels = new List(0);
    _ports = {"DVI":false,"Parallel":false,"PS2":false,"RJ45":false,"Serial":false,"Stereo":false};
  }

  bool lastDigitEven() {
    return RegExp(r'.*([2|4|6|8|0])$').hasMatch(serial);
  }

  bool getPortValue (String name){
    return _ports[name];
  }

  void togglePortValue (String name){
    _ports[name] = !_ports[name];
  }

  void addLabel(Label newLabel) {
    _labels.add(newLabel);
  }

  void createLabel(bool led, String labelText) {
    _labels.add(new Label(led, labelText));
  }
}

