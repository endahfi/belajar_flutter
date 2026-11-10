import 'package:flutter/material.dart';

// Sandbox IT HSI · Flutter Akhwat · Pertemuan 4
// State Management Dasar: setState(), event handling, List & Map

// 1. STATELESSWIDGET: tampilan tetap, tidak punya state
class StatisText extends StatelessWidget {
  const StatisText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Halo World (Stateless, tidak bisa berubah)');
  }
}

// 2. STATEFULWIDGET: widget + class State-nya
class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  //  STATE (variabel yang bisa berubah)
  int angka = 0; // dipakai Button, FAB, GestureDetector
  bool suka = false; // dipakai IconButton
  bool sukaInkWell = false; // dipakai InkWell

  //  DATA CONTOH: List
  List<String> buku = ['Dart', 'Flutter'];

  //  DATA CONTOH: Map dan List of Map
  Map<String, String> profil = {'nama': 'Aisyah', 'hobi': 'membaca'};

  List<Map<String, String>> anggota = [
    {'nama': 'Aisyah'},
    {'nama': 'Fatimah'},
    {'nama': 'Khadijah'},
  ];

  //  GABUNGAN: List sebagai state
  late List<bool> daftarSuka = List.filled(anggota.length, false);

  // Fungsi biasa: dipanggil tanpa kurung -> onPressed: tambah
  void tambah() {
    setState(() {
      angka++;
    });
  }

  // Penanda tiap bagian materi
  Widget judul(String teks) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Text(
        teks,
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('State & Event Handling')),

      //  FLOATINGACTIONBUTTON
      // Dipasang di Scaffold lewat properti floatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => angka++);
        },
        child: const Icon(Icons.add),
      ),

      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
        children: [
          const StatisText(),
          const SizedBox(height: 12),
          Text(
            'Angka: $angka',
            style: Theme.of(context).textTheme.headlineMedium,
          ),

          //  BUTTON & onPressed
          judul('Button dan onPressed'),
          Wrap(
            spacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {
                  print('Ditekan');
                },
                child: const Text('Tekan'),
              ),
              // onPressed: tambah (tanpa kurung) -> dijalankan saat ditekan
              OutlinedButton(onPressed: tambah, child: const Text('Tambah')),
              // onPressed: null -> tombol nonaktif (abu-abu)
              const ElevatedButton(onPressed: null, child: Text('Nonaktif')),
            ],
          ),

          //  TEXTBUTTON
          judul('TextButton: tombol tanpa latar'),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  setState(() => angka = 0);
                },
                child: const Text('Batal'),
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Simpan')),
            ],
          ),

          //  ICONBUTTON
          judul('IconButton: tombol berbentuk ikon'),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() => suka = !suka);
                },
                tooltip: 'Suka',
                icon: Icon(
                  suka ? Icons.favorite : Icons.favorite_border,
                  color: Colors.pink,
                ),
              ),
              Text(suka ? 'Disukai' : 'Belum disukai'),
            ],
          ),

          //  INKWELL
          judul('InkWell: sentuhan di widget apa saja'),
          Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                setState(() => sukaInkWell = !sukaInkWell);
              },
              onLongPress: () => print('InkWell ditahan'),
              onDoubleTap: () => print('InkWell ditekan dua kali'),
              // Pakai Padding, bukan Container berwarna, agar riak terlihat
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Suka? ${sukaInkWell ? 'Ya' : 'Tidak'}'),
              ),
            ),
          ),

          //  GESTUREDETECTOR
          judul('GestureDetector: mendeteksi gestur'),
          GestureDetector(
            onTap: () {
              setState(() => angka++);
            },
            onLongPress: () {
              setState(() => angka = 0);
            },
            child: Container(
              padding: const EdgeInsets.all(24),
              color: Colors.purple.shade100,
              child: Text('Angka: $angka  (sentuh = tambah, tahan = nol)'),
            ),
          ),

          //  LIST
          judul('Data contoh: List'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [for (var b in buku) Text('• $b')],
          ),
          TextButton(
            onPressed: () {
              setState(() => buku.add('Fiqih'));
            },
            child: const Text('Tambah buku "Fiqih"'),
          ),

          // MAP
          judul('Data contoh: Map'),
          Text('Nama: ${profil['nama'] ?? ''}'),
          Text('Hobi: ${profil['hobi'] ?? ''}'),

          // LIST OF MAP
          judul('Menampilkan List of Map'),
          const Text('Cara 1: map() + toList()'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: anggota.map((a) {
              return Text(a['nama'] ?? '');
            }).toList(),
          ),
          const SizedBox(height: 8),
          const Text('Cara 2: for di dalam children'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [for (var a in anggota) Text(a['nama'] ?? '')],
          ),

          //  GABUNGAN
          judul('Data, event, dan state bersama'),
          for (var i = 0; i < anggota.length; i++)
            InkWell(
              onTap: () {
                setState(() {
                  daftarSuka[i] = !daftarSuka[i];
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Icon(
                      daftarSuka[i] ? Icons.favorite : Icons.favorite_border,
                      color: Colors.pink,
                    ),
                    const SizedBox(width: 12),
                    Text(anggota[i]['nama'] ?? ''),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
