
class Configurator {
  int strikes;
  int modules;
  int batteries;
  String serial;
  Map<String, bool> labels;
  Map<String, bool> _ports;

  Configurator() {
    strikes = 0;
    modules = 5;
    batteries = 0;
    serial = "";
    labels = {};

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

  void addLabel(Map<String, bool> entry) {
    labels.addAll(entry);
  }

  bool getLabel (String label, bool led){
    return labels.containsKey(label) && labels[label] == led
        ? true
        : false;
  }
}


