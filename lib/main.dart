import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolis/kalender.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todolis/tambah.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null); // Lokal Indonesia
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final List<Map<String, dynamic>> attendanceList = [
    {
      'judul': 'Sistem Cerdas Automasi',
      'isi': 'Mata Kuliah Mahasiswa Semester 5 Program Studi Teknik Komputer di Universitas Pendidikan Indonesia',
    },
    {
      'judul': 'Sistem Operasi',
      'isi': 'Mata Kuliah Mahasiswa Semester 5 Program Studi Teknik Komputer di Universitas Pendidikan Indonesia',
    },
    {
      'judul': 'Pemograman Aplikasi Bergerak',
      'isi': 'Mata Kuliah Mahasiswa Semester 5 Program Studi Teknik Komputer di Universitas Pendidikan Indonesia',
    },
    {
      'judul': 'Sistem Tertanam',
      'isi': 'Mata Kuliah Mahasiswa Semester 5 Program Studi Teknik Komputer di Universitas Pendidikan Indonesia',
    },
    {
      'judul': 'Pemograman Web',
      'isi': 'Mata Kuliah Mahasiswa Semester 5 Program Studi Teknik Komputer di Universitas Pendidikan Indonesia',
    },
    {
      'judul': 'Metodologi Penelitian',
      'isi': 'Mata Kuliah Mahasiswa Semester 5 Program Studi Teknik Komputer di Universitas Pendidikan Indonesia',
    },
    {
      'judul': 'Keamanan Jaringan Komputer',
      'isi': 'Mata Kuliah Mahasiswa Semester 5 Program Studi Teknik Komputer di Universitas Pendidikan Indonesia',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
          'Daftar Tugas',
          style: GoogleFonts.sora(
            color: Color(0XFF144795),
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        )),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Kalender(),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: attendanceList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: const Color(0XFF144795),
                        elevation: 4,
                        child: ExpansionTile(
                          iconColor: Colors.white,
                          collapsedIconColor: Colors.white,
                          childrenPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          expandedAlignment: Alignment.topLeft,
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          title: Text(
                            attendanceList[index]['judul'],
                            style: GoogleFonts.sora(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          children: [
                            Text(attendanceList[index]['isi'],
                                style: GoogleFonts.sora(color: Colors.white, fontWeight: FontWeight.w200)),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Konfirmasi"),
                                          content: Text(
                                              "Apakah Anda yakin ingin menghapus tugas ini?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(
                                                    context); // Tutup dialog
                                              },
                                              child: Text("Batal"),
                                            ),
                                            TextButton(
                                              onPressed: () {// Jalankan fungsi deleteTask
                                                Navigator.pop(
                                                    context); // Tutup dialog setelah eksekusi
                                              },
                                              child: Text(
                                                "Oke",
                                                style: TextStyle(
                                                    color: Colors
                                                        .red), // Warna teks Oke
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          )),
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TambahView()), // Halaman tujuan
                );
              },
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.add,
                color: Color(0XFF144795),
              ), // Icon plus
            ),
          ),
        )
      ),
    );
  }
}
