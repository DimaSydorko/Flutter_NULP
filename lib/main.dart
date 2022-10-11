import 'package:flutter/material.dart';
import './LoginPage.dart';


void main() {
  runApp(const AppRoute());
}

class AppRoute extends StatefulWidget {
  const AppRoute({super.key});

  @override
  State<AppRoute> createState() => _AppRouteState();
}

class _AppRouteState extends State<AppRoute> {
  String userName = '';

  @override
  void setUserName(newUserName) {
    userName = newUserName;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/main',
      routes: {
        '/main': (context) => SignInPage(userName: userName, setUserName: setUserName),
      },
    );
  }
}
