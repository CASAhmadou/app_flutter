import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery'),),
      body: Center(
        child: Text('Gallery Page', style: Theme.of(context).textTheme.headline3,),
      ),
    );
  }
}
