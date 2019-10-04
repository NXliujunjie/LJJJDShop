import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class ljjProductContentEvent {
  String str;
  ljjProductContentEvent(String str) {
    this.str = str;
  }
}