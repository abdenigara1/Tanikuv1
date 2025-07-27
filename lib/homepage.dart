import 'package:flutter/material.dart';

void main() {
  runApp(const TanikuApp());
}

class TanikuApp extends StatelessWidget {
  const TanikuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 92, 126, 93),
        body: Column(
          children: [
            // Bagian atas: latar hijau dan konten di dalamnya
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              width: double.infinity,
              child: Stack(
                children: [
                  // Latar belakang hijau dengan border bawah
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 16, 66, 17),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),

                  // Gambar dan tulisan TANIKUAPP di tengah
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 100),
                        Container(
                          width: 150,
                          height: 150,
                          padding: const EdgeInsets.all(3), // untuk border
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white, // warna border
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/logo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10), // Spasi antara gambar & teks
                        const Text(
                          'TANIKUAPP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bagian bawah layar
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 92, 126, 93),
                child: const Center(
                  child: Text(
                    'APP VERSION V.1.1',
                    style: TextStyle(
                      color: Color.fromARGB(94, 255, 255, 255),
                      fontWeight: FontWeight.w100,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
