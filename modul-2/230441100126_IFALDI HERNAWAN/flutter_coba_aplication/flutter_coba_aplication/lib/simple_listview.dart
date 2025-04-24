import 'package:flutter/material.dart';

class SimpleListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView Sederhana')),
      body: ListView(
        children: [
          ListTile(title: Text('Item 1')),
          ListTile(title: Text('Item 2')),
          ListTile(title: Text('Item 3')),
          ListTile(title: Text('Item 4')),
        ],
      ),
    );
  }
}