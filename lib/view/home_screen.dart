import 'package:flutter/material.dart';
import 'package:model_mvvm/utils/routes/routes_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: ()=> Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false),
          child: Text('click me'),
        ),
      ),
    );
  }
}
