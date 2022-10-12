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
  String _email = '';
  String _password = '';

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

  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.userName),
            TextField(
              decoration: const InputDecoration(
                labelText: 'email',
                icon: Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Icon(Icons.email)),
              ),
              controller: _controller,
              onChanged: (String value) {
                _email = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Password',
                  icon: Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Icon(Icons.lock),
                  )),
              onChanged: (String value) {
                _password = value;
              },
              obscureText: _obscureText,
            ),
            FloatingActionButton(
                onPressed: _toggle,
                child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility)),
            ElevatedButton(
                onPressed: () => _password != ''
                    ? {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(email: _email)),
                        )
                      }
                    : null,
                child: const Text('Submit'),
                style: TextButton.styleFrom(
                    backgroundColor:
                        _password != '' ? Colors.deepPurple : Colors.deepPurple))
          ],
        ),
      ),
    );
  }
}
