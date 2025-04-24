
import 'package:flutter/material.dart';

class ListWithImg extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('ListView')),
      body: ListView(
            children: [
              ListTile(
                leading: Image.asset(
                  'image_view.jpg',
                  width: 100,
                  height: 100,
                ),
                title: Text('Item dengan Gambar'),
                subtitle: Text('Gambar dari asset'),
              ),
            ],
          )
    );
  }

}