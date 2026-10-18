import 'package:flutter/material.dart';
import '../data/fish_data.dart';
import 'fish_detail_screen.dart';
import 'fish_form_screen.dart'; // นำเข้าหน้าฟอร์มที่เราสร้างขึ้น

class FishListScreen extends StatelessWidget {
  const FishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สปีชีส์ปลาและข้อมูลการตกปลา (W06)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1E293B),
      ),
      backgroundColor: const Color(0xFF0F172A),
      body: ListView.builder(
        itemCount: fishList.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final fish = fishList[index];
          return Card(
            color: const Color(0xFF1E293B),
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(fish.imagePaths[0], width: 70, height: 70, fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(width: 70, height: 70, color: Colors.grey, child: const Icon(Icons.image)),
                ),
              ),
              title: Text(fish.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text('ถิ่นที่อยู่: ${fish.habitat}\nความยาก: ${fish.difficulty}', style: const TextStyle(color: Colors.grey, fontSize: 13)),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.amber, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FishDetailScreen(fish: fish),
                  ),
                );
              },
            ),
          );
        },
      ),
      // ปุ่มลอยมุมขวาล่าง สำหรับกดเปิดหน้าฟอร์มเพิ่มข้อมูลปลา
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        child: const Icon(Icons.add, color: Colors.black),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FishFormScreen(),
            ),
          );
        },
      ),
    );
  }
}