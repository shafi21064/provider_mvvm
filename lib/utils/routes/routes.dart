
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_mvvm/utils/routes/routes_name.dart';
import 'package:model_mvvm/view/home_screen.dart';
import 'package:model_mvvm/view/login_screen.dart';

class Routes{

  static Route<dynamic> generatedRoutes(RouteSettings settings){
    switch(settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (_)=> const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No routes defined'),
            ),
          );
        });
    }
  }
}