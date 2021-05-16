import 'package:flutter/material.dart';

class MenuButton {
  String title;
  IconData icon;
  LinearGradient backgroundColor;
  MenuButton({this.title, this.icon, this.backgroundColor});
}

List<MenuButton> menuButtons = [
  MenuButton(
    title: 'Create Playlist',
    icon: Icons.add,
    backgroundColor: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.grey,
        Colors.grey,
      ],
    ),
  ),
  MenuButton(
    title: 'Liked Songs',
    icon: Icons.favorite,
    backgroundColor: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.deepPurple,
        Colors.white,
      ],
    ),
  ),
];
