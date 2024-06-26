import 'package:flutter/material.dart';
import 'package:save_things/src/pages/add_items.dart';
import 'package:save_things/src/pages/home_page.dart';
import 'package:save_things/src/pages/login_page.dart';
import 'package:save_things/src/pages/make_login.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoginPage(),
      routes: {
        '/home': (context) => HomePage(),
        '/adicionarItens': (context) => AddItens(),
        '/fazerlogin': (context) => MakeLogin(),
      },
    );
  }
}
