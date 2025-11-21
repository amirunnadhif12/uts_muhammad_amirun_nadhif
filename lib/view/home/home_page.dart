import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/auth_controller.dart';
import '../../controller/obat_controller.dart';
import '../obat/beli_obat_page.dart';
import '../transaksi/riwayat_page.dart';
import '../profil/profil_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF1AAE6F);
    final auth = Provider.of<AuthController>(context);
    final obatCtrl = Provider.of<ObatController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Apotek'), foregroundColor: Colors.white,
        backgroundColor: primaryGreen,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RiwayatPage())),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilPage())),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Align(alignment: Alignment.centerLeft, child: Text('Halo, ${auth.user?.nama ?? 'User'}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: obatCtrl.list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.78, mainAxisSpacing: 10, crossAxisSpacing: 10),
                itemBuilder: (context, i) {
                  final o = obatCtrl.list[i];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: o.gambar.isNotEmpty
                                  ? Image.asset(o.gambar, width: double.infinity, fit: BoxFit.cover)
                                  : const Icon(Icons.medical_services, size: 60),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(o.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(o.kategori, style: const TextStyle(color: Colors.black54, fontSize: 12)),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Rp ${o.harga}', style: const TextStyle(fontWeight: FontWeight.bold)),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: primaryGreen,  foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BeliObatPage(preselectedObatId: o.id))),
                                child: const Text('Beli', style: TextStyle(fontSize: 12)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
