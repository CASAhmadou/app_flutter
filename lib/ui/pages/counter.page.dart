import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter'),),
      body: Center(
        child: Text('Counter Value => ${counter}',
        style: TextStyle(fontSize: 22, color: Colors.deepOrange),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                --counter;
              });
              print(counter);
            },
            child: Icon(Icons.remove),
          ),

          SizedBox(width: 8,),

          FloatingActionButton(
            onPressed: () {
              setState(() {
                ++counter;
              });
              print(counter);
            },
            child: Icon(Icons.add),
          ),
        ],
      )
    );
  }
}
