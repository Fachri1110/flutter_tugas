import 'package:flutter/material.dart';
import 'editprofil.dart'; // Pastikan Anda sudah menambahkan file editprofil.dart pada folder proyek Anda.

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Nanad_manda',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Profile Image
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150', // Ganti dengan URL gambar profil Anda
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Stats
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            StatColumn(title: '1', subtitle: 'Posts'),
                            StatColumn(title: '432', subtitle: 'Followers'),
                            StatColumn(title: '324', subtitle: 'Following'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Name and Bio
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nadya Amanda',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '@Nanad_manda',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text('Ikan apa yang suka jalan-jalan?'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Edit Profile Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        // Navigasi ke halaman Edit Profile
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditProfilePage(),
                          ),
                        );
                      },
                      child: Text('Edit Profile'),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1),
            // Tabs (Posts)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.grid_on, color: Colors.black),
                  const SizedBox(width: 8),
                  Text(
                    'Posts',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1),
            // Post Grid
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 3, // Sesuaikan dengan jumlah postingan
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://via.placeholder.com/150', // Ganti dengan URL gambar postingan Anda
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: 3, // Set current index ke 'Profile'
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigasi
        },
      ),
    );
  }
}

class StatColumn extends StatelessWidget {
  final String title;
  final String subtitle;

  const StatColumn({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
