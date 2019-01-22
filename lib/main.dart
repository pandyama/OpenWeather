import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'favorite.dart';


void main() => runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp()
    )
);

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();

}

TextEditingController myControl = TextEditingController();
bool onOff = false;


class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  TabController tbc;
  final fav = new Favorite();
  bool flag = false;
  bool _value = false;



  @override
  void initState(){
    super.initState();
    tbc = new TabController(length: 2, vsync: this);
  }

  void onChanged(bool value){
    setState(() {
      _value = value;
      if(value){
        onOff = true;
      }
      else{
        onOff = false;
      }
    });
  }

  Map<String, dynamic> data;
  var res1;
  var apiKey;

 Future<String> getData() async{
    var res = await http.get(
        Uri.encodeFull('https://api.openweathermap.org/data/2.5/weather?q=${getCity()}&units=imperial&appid=${apiKey}'),
        headers:{"Accept": "application/json"});

    res1 = jsonDecode(res.body);

    flag = true;
    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(title: new Text("Weather"),
        bottom: new TabBar(
          controller: tbc,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.home),
            ),
            new Tab(
              icon: new Icon(Icons.view_day),
            )
          ],
        ),
      ),
      body: new TabBarView(
        children: <Widget>[
          new Column(
              children: <Widget>[
                new TextField(
                  controller: myControl,
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: 'Enter a city',
                      icon: new Icon(Icons.search)
                  ),
                ),
                new Padding(padding: EdgeInsets.all(30.0)),
                new MaterialButton(height: 40.0, minWidth: 70.0, child: Text("Search"),onPressed: (){getData();},),
                new Padding(padding: EdgeInsets.all(15.0)),
                new Switch(value: _value, onChanged: (bool val){onChanged(val);},),
                new Text(getText(),
                  style: new TextStyle(fontSize: 15.0)),
              ]), fav
        ],
        controller: tbc,
      ),
    );
  }

  getText(){
   if(flag) {
     //getData();
     return "${res1['main']['temp']} F, ${res1['weather'][0]['description']}";
   }
   else{
     return "";
   }
  }

}

String getCity(){
  String x = myControl.text.toString();
  return x;
}


