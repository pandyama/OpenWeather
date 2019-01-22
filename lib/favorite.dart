import 'package:flutter/material.dart';

class Favorite extends StatefulWidget{
  @override
  favoriteState createState() => favoriteState();
}

class favoriteState extends State<Favorite>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child:
            new ListView(
              children: <Widget>[
                new TextField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: 'Fav city 1',
                      icon: new Icon(Icons.add_box)
                  ),
                ),
                new TextField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: 'Fav city 2',
                      icon: new Icon(Icons.add_box)
                  ),
                ),
                new TextField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: 'Fav city 3',
                      icon: new Icon(Icons.add_box)
                  ),
                ),
              ],
            )
        )
      )
    );
  }

}