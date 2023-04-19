import 'dart:convert';
import 'package:app_flutter/ui/pages/repositories/detailUser.page.dart';
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
  int curentPage = 0;
  int totalPages = 0;
  int pageSize = 20;
  List<dynamic> items = [];
  ScrollController scrollController = new ScrollController();

  void _search(String query) {
    String url = "https://api.github.com/search/users?q=${query}&per_page=$pageSize&page=$curentPage";
    print(url);
    http.get(Uri.parse(url))
        .then((response) {
          setState(() {
            data =json.decode(response.body);
            items.addAll(data['items']);
            if(data['total_count'] % pageSize ==0){
              totalPages=data['total_count']~/pageSize;
            } else totalPages = (data['total_count']/pageSize).floor() + 1;
          });
    })
        .catchError((err){
      print(err);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
        setState(() {
          if(curentPage<totalPages-1){
            ++curentPage;
            _search(query);
          }
        });
      }
    });
  }

@override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Users => ${query} => $curentPage/$totalPages'),),
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
                        items = [];
                        curentPage = 0;
                        this.query = textController.text;
                        _search(query);
                      });
                    }
                )
              ],
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    Divider(height: 2, color: Colors.deepOrange),
                controller: scrollController,
                  itemCount: items.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder:
                                (context) => DetailUserPage(
                                  login: items[index]['login'],
                                  avatarUrl: items[index]['avatar_url'],
                                )));
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(items[index]['avatar_url']),
                                radius: 30,
                              ),
                              SizedBox(width: 20,),
                              Text("${items[index]['login']}"),
                            ],
                          ),
                          CircleAvatar(
                              child: Text("${items[index]['score']}")
                          )
                        ],
                      ),
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