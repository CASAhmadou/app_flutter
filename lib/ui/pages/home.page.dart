import 'package:app_flutter/ui/widgets/drawer.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar( title: Text('Page bou gneuk'),),
      body: Center(
        child: Text('Akcil ak diam!',
            style: Theme.of(context).textTheme.headline3
        ),
      ),
    );
  }
}