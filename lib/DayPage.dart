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
          child: ListView.builder(
              itemCount: widget.day.subjects.length,
              itemBuilder: (BuildContext context, int idx) {
                return Row(children: [
                  Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width *
                          (widget.day.subjects[idx].isAllGroup ? 0.45 : 0.95),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromRGBO(200, 197, 242, 1),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Colors.black26)
                          ]),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.day.subjects[idx].type,
                                  style:
                                      const TextStyle(color: Colors.black38)),
                              Text(
                                  "Start at: ${widget.day.subjects[idx].start}")
                            ],
                          ),
                          ListTile(
                              title: Text(
                            widget.day.subjects[idx].name,
                            style: const TextStyle(color: Colors.deepPurple),
                          )),
                          Text(widget.day.subjects[idx].teacher,
                              style: const TextStyle(color: Colors.black38)),
                          Text(widget.day.subjects[idx].room),
                          Text(
                              widget.day.subjects[idx].isAllGroup
                                  ? '*Half of group'
                                  : '',
                              style: const TextStyle(color: Colors.black38)),
                        ],
                      ))
                ]);
              })),
    );
  }
}
