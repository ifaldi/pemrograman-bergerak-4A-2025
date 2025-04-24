import 'package:flutter/material.dart';

class Frame3 extends StatefulWidget {
  const Frame3({Key? key}) : super(key: key);

  @override
  State<Frame3> createState() => _Frame3State();
}

class _Frame3State extends State<Frame3> {
  final _formKey = GlobalKey<FormState>();

  String _namaWisata = '';
  String _lokasiWisata = '';
  String _hargaTiket = '';
  String _deskripsiWisata = '';
  String? _jenisDipilih;

  final List<String> jenisWisata = [
    'Wisata Alam',
    'Wisata Sejarah',
    'Wisata Budaya'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Tambah Wisata",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Image Placeholder
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.add_photo_alternate,
                      size: 60, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      minimumSize: Size(double.infinity, 40)),
                  child: Text("Upload Image",
                      style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 20),

                // Input Nama Wisata
                const Text(
                  "Nama Wisata :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Masukkan Nama Wisata Disini',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama wajib diisi';
                      }
                      return null;
                    },
                    onSaved: (value) => _namaWisata = value!,
                  ),
                ),
                const SizedBox(height: 16),

                // Input Lokasi Wisata
                const Text(
                  "Lokasi Wisata :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Masukkan Lokasi Wisata Disini',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lokasi wajib diisi';
                      }
                      return null;
                    },
                    onSaved: (value) => _lokasiWisata = value!,
                  ),
                ),
                const SizedBox(height: 16),

                                // Dropdown Jenis Wisata
                const Text(
                "Jenis Wisata :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  hintText: 'Pilih Jenis Wisata',
                ),
                items: jenisWisata
                    .map((jenis) => DropdownMenuItem(
                          value: jenis,
                          child: Text(jenis),
                        ))
                    .toList(),
                value: _jenisDipilih,
                onChanged: (value) {
                  setState(() {
                    _jenisDipilih = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Pilih jenis wisata' : null,
              ),
                const SizedBox(height: 24),

                // Input Harga Tiket
                const Text(
                  "Harga Tiket :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan Harga Tiket',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Harga wajib diisi';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Harga hanya boleh berupa angka';
                    }
                      return null;
                    },
                    onSaved: (value) => _hargaTiket = value!,
                  ),
                ),
                const SizedBox(height: 16),

                // Input Deskripsi
                const Text(
                  "Deskripsi Wisata :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextFormField(
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: 'Masukkan Deskripsi Wisata',
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Deskripsi wajib diisi';
                      }
                      return null;
                    },
                    onSaved: (value) => _deskripsiWisata = value!,
                  ),
                ),
                const SizedBox(height: 16),

                // Tombol Simpan
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        // Debug print ke console
                        print("Nama: $_namaWisata");
                        print("Lokasi: $_lokasiWisata");
                        print("Harga: $_hargaTiket");
                        print("Deskripsi: $_deskripsiWisata");
                        print("Jenis: $_jenisDipilih");

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data wisata berhasil disimpan'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      minimumSize: Size(double.infinity, 40),
                    ),
                    child: const Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Center(
                  child: TextButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                      setState(() {
                        _namaWisata = '';
                        _lokasiWisata = '';
                        _hargaTiket = '';
                        _deskripsiWisata = '';
                        _jenisDipilih = null;
                      });
                    },
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        color: Color.fromARGB(255, 92, 54, 244),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF5E36F4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
