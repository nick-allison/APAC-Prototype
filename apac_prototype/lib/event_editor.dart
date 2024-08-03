import 'event.dart';

class EventEditor {
  final List<Event> _events = [];
  int _idCounter = 0;

  List<Event> get events => _events;

  void addEvent(String name, String date, String time, AlarmSettings alarmSettings) {
    final event = Event(
      id: _idCounter++,
      name: name,
      date: date,
      time: time,
      alarmSettings: alarmSettings,
    );
    _events.add(event);
  }

  void editEvent(int id, String newName, String newDate, String newTime, AlarmSettings newAlarmSettings) {
    final event = _events.firstWhere((event) => event.id == id);
    event.name = newName;
    event.date = newDate;
    event.time = newTime;
    event.alarmSettings = newAlarmSettings;
  }

  void deleteEvent(int id) {
    _events.removeWhere((event) => event.id == id);
  }
}
