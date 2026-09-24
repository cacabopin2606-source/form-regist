import 'package:flutter/material.dart';
import '../models/mahasiswa.dart';

class ResultPage extends StatelessWidget {
  final Mahasiswa mahasiswa;
  final List<Mahasiswa> anggotaKelompok;

  const ResultPage({
    super.key,
    required this.mahasiswa,
    required this.anggotaKelompok,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Registrasi'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                'Registrasi Berhasil',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Data mahasiswa berhasil dibuat.',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              // Data mahasiswa
              const Text(
                'Data Mahasiswa',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(
                    mahasiswa.fullname,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    mahasiswa.email,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Anggota kelompok
              const Text(
                'Anggota Kelompok',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                height: 300,

                child: ListView.builder(
                  itemCount: anggotaKelompok.length,

                  itemBuilder: (context, index) {
                    final anggota =
                        anggotaKelompok[index];

                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            '${index + 1}',
                          ),
                        ),

                        title: Text(
                          anggota.fullname,
                        ),

                        subtitle: Text(
                          anggota.email.isEmpty
                              ? 'Mahasiswa'
                              : anggota.email,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}