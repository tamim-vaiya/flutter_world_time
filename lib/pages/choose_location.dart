import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Europe/London',
        location: 'London',
        flag:
            'https://github.com/iamshaunjp/flutter-beginners-tutorial/blob/lesson-34/world_time_app/assets/uk.png?raw=true'),
    WorldTime(
        url: 'Europe/Berlin',
        location: 'Athens',
        flag:
            'https://github.com/iamshaunjp/flutter-beginners-tutorial/blob/lesson-34/world_time_app/assets/greece.png?raw=true'),
    WorldTime(
        url: 'Africa/Cairo',
        location: 'Cairo',
        flag:
            'https://github.com/iamshaunjp/flutter-beginners-tutorial/blob/lesson-34/world_time_app/assets/egypt.png?raw=true'),
    WorldTime(
        url: 'Africa/Nairobi',
        location: 'Nairobi',
        flag:
            'https://github.com/iamshaunjp/flutter-beginners-tutorial/blob/lesson-34/world_time_app/assets/kenya.png?raw=true'),
    WorldTime(
        url: 'America/Chicago',
        location: 'Chicago',
        flag:
            'https://github.com/iamshaunjp/flutter-beginners-tutorial/blob/lesson-34/world_time_app/assets/usa.png?raw=true'),
    WorldTime(
        url: 'America/New_York',
        location: 'New York',
        flag:
            'https://github.com/iamshaunjp/flutter-beginners-tutorial/blob/lesson-34/world_time_app/assets/usa.png?raw=true'),
    WorldTime(
        url: 'Asia/Seoul',
        location: 'Seoul',
        flag:
            'https://github.com/iamshaunjp/flutter-beginners-tutorial/blob/lesson-34/world_time_app/assets/south_korea.png?raw=true'),
    WorldTime(
        url: 'Asia/Jakarta',
        location: 'Jakarta',
        flag:
            'https://github.com/iamshaunjp/flutter-beginners-tutorial/blob/lesson-34/world_time_app/assets/indonesia.png?raw=true'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location ?? ' '),
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')), // Asset not working, don't know why,
              ),
            ),
          );
        },
      ),
    );
  }
}
