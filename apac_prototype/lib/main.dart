import 'package:flutter/material.dart';
import 'event.dart';
import 'event_editor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EventListScreen(),
    );
  }
}

class EventListScreen extends StatefulWidget {
  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  final EventEditor _eventEditor = EventEditor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: ListView.builder(
        itemCount: _eventEditor.events.length,
        itemBuilder: (context, index) {
          final event = _eventEditor.events[index];
          return ListTile(
            title: Text(event.name),
            subtitle: Text('${event.date} at ${event.time}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _eventEditor.deleteEvent(event.id);
                });
              },
            ),
            onTap: () {
              _showEditEventDialog(event);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddEventDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddEventDialog() {
    final nameController = TextEditingController();
    final dateController = TextEditingController();
    final timeController = TextEditingController();
    final notificationSoundController = TextEditingController();
    final alertVoiceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Event Name'),
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Event Date'),
              ),
              TextField(
                controller: timeController,
                decoration: InputDecoration(labelText: 'Event Time'),
              ),
              TextField(
                controller: notificationSoundController,
                decoration: InputDecoration(labelText: 'Notification Sound'),
              ),
              TextField(
                controller: alertVoiceController,
                decoration: InputDecoration(labelText: 'Alert Voice'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _eventEditor.addEvent(
                    nameController.text,
                    dateController.text,
                    timeController.text,
                    AlarmSettings(
                      alarmSettingsId: DateTime.now().millisecondsSinceEpoch,
                      notificationSound: notificationSoundController.text,
                      alertVoice: alertVoiceController.text,
                    ),
                  );
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditEventDialog(Event event) {
    final nameController = TextEditingController(text: event.name);
    final dateController = TextEditingController(text: event.date);
    final timeController = TextEditingController(text: event.time);
    final notificationSoundController = TextEditingController(text: event.alarmSettings.notificationSound);
    final alertVoiceController = TextEditingController(text: event.alarmSettings.alertVoice);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Event Name'),
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Event Date'),
              ),
              TextField(
                controller: timeController,
                decoration: InputDecoration(labelText: 'Event Time'),
              ),
              TextField(
                controller: notificationSoundController,
                decoration: InputDecoration(labelText: 'Notification Sound'),
              ),
              TextField(
                controller: alertVoiceController,
                decoration: InputDecoration(labelText: 'Alert Voice'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _eventEditor.editEvent(
                    event.id,
                    nameController.text,
                    dateController.text,
                    timeController.text,
                    AlarmSettings(
                      alarmSettingsId: event.alarmSettings.alarmSettingsId,
                      notificationSound: notificationSoundController.text,
                      alertVoice: alertVoiceController.text,
                    ),
                  );
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
