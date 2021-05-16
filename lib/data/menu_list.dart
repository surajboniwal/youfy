import 'package:flutter/material.dart';

class MenuItem {
  String title;
  IconData icon;
  MenuItem({this.title, this.icon});
}

List<MenuItem> menuItems = [
  MenuItem(title: 'Home', icon: Icons.home),
  MenuItem(title: 'Search', icon: Icons.search),
  MenuItem(title: 'Your Library', icon: Icons.library_music_rounded),
];
