import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_2/screen/home/controller/home_controller.dart';
import 'package:task_2/screen/home/view/home_screen.dart';
import 'package:task_2/screen/login/view/login_screen.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (p0) => LoginScreen(),
          'home':(p0) => HomeScreen(),
        }
      ),
    ),
  );
}