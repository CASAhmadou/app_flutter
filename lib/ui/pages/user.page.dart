import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var query;
  bool notVisible=false;
  TextEditingController textController = new TextEditingController();
  dynamic data;

  void _search(String query) {
    String url = "https://api.github.com/search/users?q=${query}&per_page=20&page=0";
    print(url);
    http.get(Uri.parse(url))
        .then((response) {
          setState(() {
            this.data =json.decode(response.body);
          });
    })
        .catchError((err){
      print(err);
    });
  }
@override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Users => ${query}'),),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: notVisible,
                        onChanged: (value){
                          setState(() {
                            this.query=value;
                          });
                        },
                        controller: textController,
                        decoration: InputDecoration(
                          //icon: Icon(Icons.logout),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  notVisible=!notVisible;
                                });
                              },
                              icon: Icon(
                                  notVisible==true?Icons.visibility_off:Icons.visibility),
                            ),
                            contentPadding: EdgeInsets.only(left: 20),
                            counterText: '0 character',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.deepOrange
                                )
                            )
                        ),
                      )
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.search, color: Colors.deepOrange),
                    onPressed: (){
                      setState(() {
                        this.query = textController.text;
                        _search(query);
                      });
                    }
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: (data==null)?0:data['items'].length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text("${data['items'][index]['login']}"),
                    );
                  }
              ),
            )
          ],
        )
    ),
    );
  }
}