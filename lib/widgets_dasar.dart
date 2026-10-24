import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text
            const Text(
              'Assalamualaikum',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 16),

            // Container (kartu)
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 200,
                height: 100,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Text('Kartu'),
              ),
            ),
            const SizedBox(height: 16),

            // Column biodata
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama: Aisyah'),
                Text('Umur: 20'),
                Text('Hobi: membaca'),
              ],
            ),
            const SizedBox(height: 16),

            // Row dengan ikon
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.star),
                Text('Favorit'),
                Icon(Icons.arrow_forward),
              ],
            ),
            const SizedBox(height: 16),

            // Column judul & isi
            const Column(
              children: [
                Text('Judul'),
                SizedBox(height: 16),
                Text('Isi'),
              ],
            ),
            const SizedBox(height: 16),

            // Row dengan Expanded
            const SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Placeholder(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Placeholder(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Image dari asset
            const Text(
              'Gambar dari Asset',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/foto.png',
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),

            // Image dari network
            const Text(
              'Gambar dari Network',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://picsum.photos/400/200',
                height: 150,
                fit: BoxFit.cover,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}