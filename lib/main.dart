import 'package:app_flutter/ui/pages/counter.page.dart';
import 'package:app_flutter/ui/pages/gallery.page.dart';
import 'package:app_flutter/ui/pages/home.page.dart';
import 'package:app_flutter/ui/pages/meteo.page.dart';
import 'package:app_flutter/ui/pages/user.page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/":(context)=>HomePage(),
        "/user":(context)=>UserPage(),
        "/meteo":(context)=>MeteoPage(),
        "/gallery":(context)=>GalleryPage(),
        "/counter":(context)=>CounterPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      initialRoute: "/user",
    );
  }
}
