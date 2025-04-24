import 'package:flutter/material.dart';
import 'simple_listview.dart';
import 'dynamic_listview.dart';
import 'horizontal_listview.dart';
import 'gridview_page.dart';
import 'second_page.dart';
import 'list_with_img.dart';

void main() => runApp(LayoutDemoApp());

class LayoutDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  void navigate(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Layout & Navigation')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () => navigate(context, SimpleListViewPage()),
            child: Text('ListView Sederhana'),
          ),
          ElevatedButton(
            onPressed: () => navigate(context, DynamicListViewPage()),
            child: Text('ListView.builder'),
          ),
          ElevatedButton(
            onPressed: () => navigate(context, HorizontalListViewPage()),
            child: Text('ListView Horizontal'),
          ),
          ElevatedButton(
            onPressed: () => navigate(context, GridViewPage()),
            child: Text('GridView'),
          ),
          ElevatedButton(
            onPressed: () => navigate(context, SecondPage(name: 'Praktikan')),
            child: Text('Navigasi & Kirim Data'),
          ),
          ElevatedButton(
            onPressed: () => navigate(context, ListWithImg()),
            child: Text('ListView Mengguankan IMAGE'),
          )
        ],
      ),
    );
  }
}
