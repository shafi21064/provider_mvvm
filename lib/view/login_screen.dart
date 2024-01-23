import 'package:flutter/material.dart';
import 'package:model_mvvm/utils/routes/routes_name.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: ()=> Navigator.pushNamed(context, RoutesName.home),
          child: Text('click to login'),
        ),
      ),
    );
  }
}