import 'package:flutter/material.dart';

class HorizontalListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Horizontal ListView')),
      body: Container(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              width: 100,
              margin: EdgeInsets.all(8),
              color: Colors.blue,
              child: Center(child: Text('Item $index')),
            );
          },
        ),
      ),
    );
  }
}
