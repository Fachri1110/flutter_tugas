import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hari Besar 2025',
      theme: ThemeData(
        primaryColor: Colors.deepPurple, // Warna utama aplikasi
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber), // Warna aksen
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black, fontSize: 16), // Perbaikan di sini
        ),
      ),
      home: const DataListScreen(),
    );
  }
}

class DataListScreen extends StatefulWidget {
  const DataListScreen({super.key});

  @override
  _DataListScreenState createState() => _DataListScreenState();
}

class _DataListScreenState extends State<DataListScreen> {
  List<dynamic> dataList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const String url = 'https://script.google.com/macros/s/AKfycbxTj7WY21RLM8RO6biCeobN5BGAzRUgvfzGxvGJ-Scww6rsgXZWIbK0WSpMjhac5vxs/exec?tahun=2025';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          dataList = data['data'];  // Ambil data dari JSON
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hari Besar 2025'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final item = dataList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  color: Colors.lightBlue[100], // Warna latar belakang kartu
                  child: ListTile(
                    leading: Icon(Icons.calendar_today, color: Colors.deepPurple), // Ikon kalender
                    title: Text(
                      '${item['tanggal']} ${item['bulan']}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      item['title'],
                      style: const TextStyle(color: Colors.grey),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            tanggal: item['tanggal'],
                            bulan: item['bulan'],
                            title: item['title'],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String tanggal;
  final String bulan;
  final String title;

  const DetailScreen({
    super.key,
    required this.tanggal,
    required this.bulan,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Hari Besar'),
        backgroundColor: Colors.deepPurple, // Warna latar belakang AppBar
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple[100]!, Colors.deepPurple[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tanggal: $tanggal', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 10),
            Text('Bulan: $bulan', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 10),
            Text('Judul: $title', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
