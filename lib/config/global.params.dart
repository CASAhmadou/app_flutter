import 'package:flutter/material.dart';

class GlobalParams{

  static List<Map<String, dynamic>> menus=[
    {"title": "Users",  "icon":Icon(Icons.man, color: Colors.orange,), "route": "/user"},

    {"title": "Counter", "icon":Icon(Icons.home, color: Colors.orange,), "route":"/counter"},

    {"title": "Gallery", "icon":Icon(Icons.map, color: Colors.orange,), "route":"/gallery"}
  ];
}