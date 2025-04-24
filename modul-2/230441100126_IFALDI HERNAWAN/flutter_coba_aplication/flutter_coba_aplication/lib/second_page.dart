import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String name;

  SecondPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Halaman Kedua')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Halo, $name!', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
