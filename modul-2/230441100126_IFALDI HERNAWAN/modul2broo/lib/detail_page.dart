import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 82, 81, 81),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'National Park Yosemite',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/modul1.png',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),

          // Informasi lokasi, kategori, dan harga
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian kiri: Kategori & Lokasi
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Row(
                  children: [
                    Icon(Icons.landscape, size: 20, color: Colors.black54),
                    SizedBox(width: 4),
                    Text("Wisata Alam", style: TextStyle(color: Colors.black87)),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 20, color: Colors.black54),
                    SizedBox(width: 4),
                    Text("California", style: TextStyle(color: Colors.black87)),
                  ],
                ),
              ],
            ),

            // Bagian kanan: Harga
            Row(
              children: const [
                Icon(Icons.confirmation_number, size: 20, color: Colors.black54),
                SizedBox(width: 4),
                Text(
                  "30.000,00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),


          const SizedBox(height: 16),

          const Text(
            "Lorem ipsum est donec non interdum amet phasellus egestas id dignissim in vestibulum augue ut a lectus rhoncus sed ullamcorper at vestibulum sed mus neque amet turpis placerat in luctus at eget egestas praesent congue semper in facilisis purus dis pharetra odio ullamcorper euismod a donec consectetur pellentesque pretium sapien proin tincidunt non augue turpis massa euismod quis lorem et feugiat ornare id cras sed eget adipiscing dolor urna mi sit a a auctor mattis urna fermentum facilisi sed aliquet odio at suspendisse posuere tellus pellentesque id quis libero fames blandit ullamcorper interdum eget placerat tortor cras nulla consectetur et duis viverra mattis libero scelerisque gravida egestas blandit tincidunt ullamcorper auctor aliquam leo urna adipiscing est ut ipsum consectetur id erat semper fames elementum rhoncus quis varius pellentesque quam neque vitae sit velit leo massa habitant tellus velit pellentesque cursus laoreet donec etiam id vulputate nisi integer eget gravida volutpat.",
            style: TextStyle(fontSize: 14, height: 1.5, color: Colors.black87),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
