import 'package:flutter/material.dart';

void main() {
  runApp(const TanikuApp());
}

class TanikuApp extends StatelessWidget {
  const TanikuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF104211),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            CustomAppBar(),
            SizedBox(height: 40),
            NewsBox(),
            SizedBox(height: 16),
            IconRow(),
            SizedBox(height: 30),
            Center(child: Tulisan()),
            SizedBox(height: 20),
            ProductGrid(),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF5C7E5D),
        border: const Border(
          bottom: BorderSide(color: Color(0xFF1B4720), width: 2),
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/images.jpg'),
              backgroundColor: Colors.transparent,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Mr. Rusdi',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'TENGKULAK',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(190, 255, 255, 255),
                  ),
                ),
                Text(
                  'Salatiga, Indonesia',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(115, 255, 255, 255),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewsBox extends StatelessWidget {
  const NewsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('assets/images.jpg'), // ganti dengan asset yang sesuai
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black.withOpacity(0.6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '📢 Kabar Hari Ini',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Text(
                'Harga cabai turun drastis karena panen raya. Petani dihimbau tetap tenang, permintaan masih tinggi.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13.5,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconRow extends StatelessWidget {
  const IconRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 24,
        runSpacing: 12,
        alignment: WrapAlignment.center,
        children: const [
          IconLabel(icon: Icons.home, label: 'Icon A'),
          IconLabel(icon: Icons.shopping_cart, label: 'Icon B'),
          IconLabel(icon: Icons.store, label: 'Icon C'),
          IconLabel(icon: Icons.favorite, label: 'Icon D'),
        ],
      ),
    );
  }
}

class IconLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconLabel({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(10),
          child: Icon(
            icon,
            color: Color(0xFF104211),
            size: 24,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11.5,
          ),
        ),
      ],
    );
  }
}

class Tulisan extends StatelessWidget {
  const Tulisan({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "HARGA HARI INI",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {'name': 'Cabai Merah', 'price': 'Rp 15.000', 'icon': Icons.local_fire_department},
      {'name': 'Tomat', 'price': 'Rp 10.000', 'icon': Icons.local_florist},
      {'name': 'Bawang Merah', 'price': 'Rp 20.000', 'icon': Icons.grass},
      {'name': 'Jeruk', 'price': 'Rp 12.000', 'icon': Icons.eco},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            shrinkWrap: true,
            clipBehavior: Clip.hardEdge,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 2.8, // sedikit lebih pendek untuk menghindari overflow
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        product['icon'] as IconData,
                        size: 22,
                        color: Colors.green[900],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['name'] as String,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.5,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            product['price'] as String,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12.5,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
