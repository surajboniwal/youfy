import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotifyclone/bindings/home_bindings.dart';
import 'package:spotifyclone/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Spotify Clone',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
          binding: HomeBindings(),
        ),
      ],
    );
  }
}
