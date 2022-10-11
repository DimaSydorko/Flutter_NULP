import 'package:flutter/material.dart';
import 'package:mobile/HomePage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, required this.userName, required setUserName});

  final String userName;

  @override
  State<SignInPage> createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  late TextEditingController _controller;
  String _userName = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Enter User Name'),
        ),

        body: Container(
            padding: EdgeInsets.all(25),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(widget.userName),
            TextField(
              controller: _controller,
              onChanged: (String value) {
                _userName = value;
              },
              onSubmitted: (String value) async {
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Thanks!'),
                      content: Text(
                          'You typed "$value", which has (${_userName}) length ${value
                              .characters.length}.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage(userName: _userName)
                ),
            )},
            child: Text('Submit'))],
    ),
    ),
    );
  }
}