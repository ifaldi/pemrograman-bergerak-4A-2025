import 'package:flutter/material.dart';
import '../models/model.dart';
import '../services/service.dart';

class MotorScreen extends StatefulWidget {
  const MotorScreen({Key? key}) : super(key: key);

  @override
  State<MotorScreen> createState() => _MotorScreenState();
}

class _MotorScreenState extends State<MotorScreen> {
  late Future<List<MapEntry<String, Motor>>> _motorList;

  final _merekCtrl = TextEditingController();
  final _noRangkaCtrl = TextEditingController();
  final _platMotorCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshMotor();
  }

  void _refreshMotor() {
    setState(() {
      _motorList = MotorService.fetchMotor();
    });
  }

  void _showForm({String? id, Motor? existing}) {
    if (existing != null) {
      _merekCtrl.text = existing.merek;
      _noRangkaCtrl.text = existing.noRangka;
      _platMotorCtrl.text = existing.platMotor;
    } else {
      _merekCtrl.clear();
      _noRangkaCtrl.clear();
      _platMotorCtrl.clear();
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(existing == null ? "Tambah Motor" : "Edit Motor"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _merekCtrl, decoration: InputDecoration(labelText: "Merek")),
            TextField(controller: _noRangkaCtrl, decoration: InputDecoration(labelText: "No Rangka")),
            TextField(controller: _platMotorCtrl, decoration: InputDecoration(labelText: "Plat Motor")),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final newMotor = Motor(
                merek: _merekCtrl.text,
                noRangka: _noRangkaCtrl.text,
                platMotor: _platMotorCtrl.text,
              );
              if (id == null) {
                await MotorService.addMotor(newMotor);
              } else {
                await MotorService.updateMotor(id, newMotor);
              }
              Navigator.pop(context);
              _refreshMotor();
            },
            child: Text("Simpan"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Motor'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<MapEntry<String, Motor>>>(
        future: _motorList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (snapshot.hasError)
            return Center(child: Text("Error: ${snapshot.error}"));

          final motors = snapshot.data!;
          if (motors.isEmpty) return Center(child: Text("Tidak ada data"));

          return ListView.builder(
            itemCount: motors.length,
            itemBuilder: (context, index) {
              final id = motors[index].key;
              final motor = motors[index].value;
              return ListTile(
                title: Text("${motor.platMotor} - ${motor.merek}"),
                subtitle: Text("No Rangka: ${motor.noRangka}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _showForm(id: id, existing: motor),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await MotorService.deleteMotor(id);
                        _refreshMotor();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(),
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        tooltip: 'Tambah Motor',
      ),
    );
  }
}
