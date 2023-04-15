import 'package:flutter/material.dart';
class UserPage extends StatefulWidget {
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var search;
  bool notVisible=false;
  TextEditingController textController = new TextEditingController();

@override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Users => ${search}'),),
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
                            this.search=value;
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
                              icon: Icon(Icons.visibility),
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
                        this.search = textController.text;
                      });
                    }
                )
              ],
            )
          ],
        )
    ),
    );
  }
}