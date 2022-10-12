import 'package:flutter/material.dart';
import 'package:mobile/DayPage.dart';
import 'package:mobile/Utils/objects.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.email});

  final String email;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _days = [
    Day('Monday', [
      Subject('Flutter dev', 'Lecture', 'Boris Johnson ', 'V, 505', true, true,
          '8:30'),
      Subject('C++ dev', 'Practice', 'Boris Johnson ', 'V, 505', false, true,
          '10:20')
    ]),
    Day('Tuesday', [
      Subject(
          'AI dev', 'Lecture', 'Boris Johnson ', 'V, 505', true, true, '10:20'),
      Subject('Python dev', 'Practice', 'Boris Johnson ', 'V, 505', false, true,
          '12:10')
    ]),
    Day('Wednesday', [
      Subject(
          'JAVA', 'Lecture', 'Boris Johnson ', 'V, 505', true, true, '10:20'),
      Subject('React Native', 'Practice', 'Boris Johnson ', 'V, 505', true,
          false, '12:10')
    ]),
    Day('Thursday', []),
    Day('Friday', [
      Subject(
          'React', 'Practice', 'Boris Johnson ', 'V, 505', false, true, '10:20')
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule (${widget.email})'),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: _days.length,
              itemBuilder: (BuildContext context, int idx) {
                return ListTile(
                  title: Text(_days[idx].name),
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DayPage(day: _days[idx])),
                    )
                  },
                );
              })),
    );
  }
}
