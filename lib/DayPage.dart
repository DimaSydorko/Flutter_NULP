import 'package:flutter/material.dart';
import 'package:mobile/Utils/objects.dart';

class DayPage extends StatefulWidget {
  const DayPage({super.key, required this.day});

  final Day day;

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule (${widget.day.name})'),
      ),
      body: Center(
          child: ListView.builder(itemCount: widget.day.subjects.length,
              itemBuilder: (BuildContext context, int idx) {
                return ListTile(title: Text(widget.day.subjects[idx].name));
              })
      ),);
  }
}
