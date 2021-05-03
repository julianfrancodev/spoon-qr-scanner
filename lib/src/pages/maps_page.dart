import 'package:flutter/material.dart';


class MapsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, i){
        return ListTile(
          leading: Icon(Icons.map, color: Theme.of(context).primaryColor,),
          title: Text("http://www.google.com"),
          subtitle: Text("ID: 1"),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,) ,
          onTap: (){
            print("abriedo algo");
          },
        );
      },
    );
  }
}
