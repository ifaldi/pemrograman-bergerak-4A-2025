import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GridView')),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return Container(
            margin: EdgeInsets.all(8),
            color: Colors.teal,
            child: Center(child: Text('Item $index')),
          );
        }),
      ),
    );
  }
}
