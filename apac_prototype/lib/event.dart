class Event {
  int id;
  String name;
  String date;
  String time;
  AlarmSettings alarmSettings;

  Event({
    required this.id,
    required this.name,
    required this.date,
    required this.time,
    required this.alarmSettings,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'time': time,
      'alarmSettings': alarmSettings.toMap(),
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'],
      name: map['name'],
      date: map['date'],
      time: map['time'],
      alarmSettings: AlarmSettings.fromMap(map['alarmSettings']),
    );
  }
}

class AlarmSettings {
  int alarmSettingsId;
  String notificationSound;
  String alertVoice;

  AlarmSettings({
    required this.alarmSettingsId,
    required this.notificationSound,
    required this.alertVoice,
  });

  Map<String, dynamic> toMap() {
    return {
      'alarmSettingsId': alarmSettingsId,
      'notificationSound': notificationSound,
      'alertVoice': alertVoice,
    };
  }

  factory AlarmSettings.fromMap(Map<String, dynamic> map) {
    return AlarmSettings(
      alarmSettingsId: map['alarmSettingsId'],
      notificationSound: map['notificationSound'],
      alertVoice: map['alertVoice'],
    );
  }
}
