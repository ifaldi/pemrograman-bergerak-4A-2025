import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Modul 1 Praktikum Flutter',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => HomePage(),
//         '/listview': (context) => ListViewPage(),
//         '/gridview': (context) => GridViewPage(),
//         '/second': (context) => SecondPage(),
//       },
//     );
//   }
// }

// ================= HOME ===================
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/listview'),
              child: Text('Contoh ListView'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/gridview'),
              child: Text('Contoh GridView'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/second'),
              child: Text('Contoh Navigasi Halaman 2'),
            ),
          ],
        ),
      ),
    );
  }
}

// ================ LISTVIEW ================
class ListViewPage extends StatelessWidget {
  final List<String> items = List.generate(20, (index) => 'Item ke-${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(items[index]),
        ),
      ),
    );
  }
}

// ================ GRIDVIEW ================
class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GridView')),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: Center(
              child: Text('Item ${index + 1}', style: TextStyle(fontSize: 18)),
            ),
          );
        }),
      ),
    );
  }
}

// ================ SECOND PAGE ================
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Halaman Kedua')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Kembali ke Home'),
        ),
      ),
    );
  }
}
