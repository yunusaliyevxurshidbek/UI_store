import 'package:flutter/material.dart';
import 'package:store/pages/home_page.dart';
import 'package:store/pages/info_page.dart';
import 'package:store/pages/main_page.dart';
import 'package:store/pages/signin_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      routes: {
        MainPage.id : (context) => MainPage(),
        SignInPage.id :(context) => SignInPage(),
        InfoPage.id :(context) => InfoPage(),
      },
    );
  }
}

