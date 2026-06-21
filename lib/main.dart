import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Praktikum Modul Flutter',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: HomePage.cBg,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // ============================================
  // PALET WARNA "PREMIUM"
  // ============================================
  static const Color cPrimary = Color(0xFF1B1F3B); // navy gelap
  static const Color cAccent = Color(0xFFD9A75A); // gold
  static const Color cBg = Color(0xFFF5F5FA); // abu sangat muda

  // ============================================
  // DATA DUMMY
  // ============================================
  final List<Map<String, dynamic>> categories = const [
    {'icon': Icons.fastfood, 'label': 'Makanan'},
    {'icon': Icons.local_drink, 'label': 'Minuman'},
    {'icon': Icons.cookie, 'label': 'Snack'},
    {'icon': Icons.devices, 'label': 'Elektronik'},
    {'icon': Icons.checkroom, 'label': 'Fashion'},
    {'icon': Icons.health_and_safety, 'label': 'Kesehatan'},
  ];

  final List<Map<String, String>> bestSellers = const [
    {'name': 'Sepatu Sneakers', 'price': 'Rp 250.000'},
    {'name': 'Tas Ransel', 'price': 'Rp 180.000'},
    {'name': 'Jaket Hoodie', 'price': 'Rp 220.000'},
    {'name': 'Kaos Polos', 'price': 'Rp 75.000'},
    {'name': 'Topi Baseball', 'price': 'Rp 50.000'},
  ];

  final List<Map<String, String>> transactions = const [
    {'id': 'Transaksi #1001', 'status': 'Berhasil'},
    {'id': 'Transaksi #1002', 'status': 'Diproses'},
    {'id': 'Transaksi #1003', 'status': 'Dibatalkan'},
    {'id': 'Transaksi #1004', 'status': 'Berhasil'},
  ];

  Color _statusColor(String status) {
    switch (status) {
      case 'Berhasil':
        return const Color(0xFF2E9E5B);
      case 'Diproses':
        return const Color(0xFFE2902B);
      case 'Dibatalkan':
        return const Color(0xFFD64545);
      default:
        return Colors.grey;
    }
  }

  IconData _statusIcon(String status) {
    switch (status) {
      case 'Berhasil':
        return Icons.check_circle;
      case 'Diproses':
        return Icons.hourglass_bottom;
      case 'Dibatalkan':
        return Icons.cancel;
      default:
        return Icons.help;
    }
  }

  static void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: cPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBg,
      appBar: AppBar(
        backgroundColor: cPrimary,
        elevation: 0,
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.storefront, color: cAccent),
            SizedBox(width: 8),
            Text(
              'Tugas 7 2311102234',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
        children: [
          // ============================================
          // 1. CONTAINER -> banner promo
          // ============================================
          const SectionHeader(
            icon: Icons.crop_square,
            title: 'Container',
            caption: 'Kotak berwarna untuk banner promo',
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [cPrimary, Color(0xFF3A3F77)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: cPrimary.withOpacity(0.35),
                  blurRadius: 18,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  right: -16,
                  top: -16,
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: cAccent.withOpacity(0.18),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '🔥 Promo Spesial Hari Ini',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Diskon hingga 50% untuk semua kategori produk pilihan',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap:
                          () => _showSnack(context, 'Menampilkan semua promo'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: cAccent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Lihat Promo',
                              style: TextStyle(
                                color: cPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward,
                              size: 14,
                              color: cPrimary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // ============================================
          // 2. GRIDVIEW -> kategori produk (6 item)
          // ============================================
          const SectionHeader(
            icon: Icons.grid_view,
            title: 'GridView',
            caption: '6 kategori produk dalam tampilan grid',
          ),
          SectionCard(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.95,
              ),
              itemBuilder: (context, index) {
                final category = categories[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap:
                      () => _showSnack(
                        context,
                        'Kategori dipilih: ${category['label']}',
                      ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.grey.withOpacity(0.15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: cAccent.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            category['icon'] as IconData,
                            color: cPrimary,
                            size: 22,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          category['label'] as String,
                          style: const TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 28),

          // ============================================
          // 3. LISTVIEW -> 3 paket membership (A, B, C)
          // ============================================
          const SectionHeader(
            icon: Icons.list_alt,
            title: 'ListView',
            caption: '3 item paket membership (A, B, C)',
          ),
          SectionCard(
            child: Column(
              children: [
                _MembershipTile(
                  letter: 'A',
                  title: 'Paket Basic',
                  subtitle: 'Cocok untuk pemula',
                  color: Colors.blueGrey,
                ),
                Divider(height: 1, color: Colors.grey.withOpacity(0.15)),
                _MembershipTile(
                  letter: 'B',
                  title: 'Paket Standard',
                  subtitle: 'Gratis ongkir + fitur lengkap',
                  color: cAccent,
                  badge: 'Populer',
                ),
                Divider(height: 1, color: Colors.grey.withOpacity(0.15)),
                const _MembershipTile(
                  letter: 'C',
                  title: 'Paket Premium',
                  subtitle: 'Akses semua fitur tanpa batas',
                  color: cPrimary,
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // ============================================
          // 4. LISTVIEW.BUILDER -> produk terlaris (data array)
          // ============================================
          const SectionHeader(
            icon: Icons.view_list,
            title: 'ListView.builder',
            caption: 'Daftar produk terlaris dari data array',
          ),
          SectionCard(
            child: SizedBox(
              height: 260,
              child: ListView.builder(
                itemCount: bestSellers.length,
                itemBuilder: (context, index) {
                  final item = bestSellers[index];
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap:
                          () => _showSnack(context, 'Dipilih: ${item['name']}'),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: cBg,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                color: cPrimary.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.shopping_bag,
                                color: cPrimary,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                item['name']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Text(
                              item['price']!,
                              style: const TextStyle(
                                color: cAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 28),

          // ============================================
          // 5. LISTVIEW.SEPARATED -> riwayat transaksi (+ garis pembatas)
          // ============================================
          const SectionHeader(
            icon: Icons.format_list_bulleted,
            title: 'ListView.separated',
            caption: 'Riwayat transaksi dengan garis pembatas',
          ),
          SectionCard(
            child: SizedBox(
              height: 240,
              child: ListView.separated(
                itemCount: transactions.length,
                separatorBuilder:
                    (context, index) =>
                        Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
                itemBuilder: (context, index) {
                  final trx = transactions[index];
                  final status = trx['status']!;
                  final color = _statusColor(status);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: color.withOpacity(0.15),
                          child: Icon(
                            _statusIcon(status),
                            color: color,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            trx['id']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            status,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 28),

          // ============================================
          // 6. STACK -> kartu promo bertumpuk
          // ============================================
          const SectionHeader(
            icon: Icons.layers,
            title: 'Stack',
            caption: 'Kartu promo dengan tampilan bertumpuk',
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF2D2F6B), Color(0xFF5A4FCF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.checkroom,
                      size: 80,
                      color: Colors.white.withOpacity(0.25),
                    ),
                  ),
                  Positioned(
                    top: 14,
                    right: 14,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD64545),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: const Text(
                        'SALE 50%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 28, 16, 14),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.75),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Jaket Hoodie Premium',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Rp 220.000',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 11,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                'Rp 110.000',
                                style: TextStyle(
                                  color: cAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================
// WIDGET PEMBANTU
// ============================================

class SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String caption;

  const SectionHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4,
            height: 34,
            decoration: BoxDecoration(
              color: HomePage.cAccent,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 17, color: HomePage.cPrimary),
                    const SizedBox(width: 6),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: HomePage.cPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  caption,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final Widget child;
  const SectionCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _MembershipTile extends StatelessWidget {
  final String letter;
  final String title;
  final String subtitle;
  final Color color;
  final String? badge;

  const _MembershipTile({
    required this.letter,
    required this.title,
    required this.subtitle,
    required this.color,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.15),
        child: Text(
          letter,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ),
      title: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5),
          ),
          if (badge != null) ...[
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: HomePage.cAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                badge!,
                style: const TextStyle(
                  fontSize: 9,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ],
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () => HomePage._showSnack(context, '$title dipilih'),
    );
  }
}
