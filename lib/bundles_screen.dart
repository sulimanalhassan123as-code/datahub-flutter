import 'package:flutter/material.dart';
import '../api.dart';

class BundlesScreen extends StatefulWidget {
  const BundlesScreen({super.key});

  @override
  State<BundlesScreen> createState() => _BundlesScreenState();
}

class _BundlesScreenState extends State<BundlesScreen> {
  late Future<Map<String, dynamic>> bundlesFuture;

  @override
  void initState() {
    super.initState();
    bundlesFuture = ApiService.getBundles();
  }

  Future<void> buy({
    required String network,
    required String bundleId,
  }) async {
    final msg = await ApiService.buyBundle(
      network: network,
      bundleId: bundleId,
      phone: "0240000000", // TEMP (safe)
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Available Bundles")),
      body: FutureBuilder<Map<String, dynamic>>(
        future: bundlesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Failed to load bundles"));
          }

          final data = snapshot.data!;
          final mtn = data['mtn'] ?? [];
          final telecel = data['telecel'] ?? [];

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                "MTN",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              ...mtn.map<Widget>((b) => ListTile(
                    title: Text(b['name']),
                    trailing: Text("GHS ${b['price']}"),
                    onTap: () => buy(
                      network: "mtn",
                      bundleId: b['id'],
                    ),
                  )),

              const SizedBox(height: 20),

              const Text(
                "Telecel",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              ...telecel.map<Widget>((b) => ListTile(
                    title: Text(b['name']),
                    trailing: Text("GHS ${b['price']}"),
                    onTap: () => buy(
                      network: "telecel",
                      bundleId: b['id'],
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }
}
