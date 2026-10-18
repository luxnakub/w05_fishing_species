import 'package:flutter/material.dart';
import '../models/fish.dart';

class FishDetailScreen extends StatelessWidget {
  final Fish fish;

  const FishDetailScreen({super.key, required this.fish});

  void _showFullImage(BuildContext context, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(backgroundColor: Colors.transparent, iconTheme: const IconThemeData(color: Colors.white)),
          body: Center(
            child: InteractiveViewer(child: Image.asset(imagePath)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: Text(fish.name, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1E293B),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // แกลเลอรีรูปภาพหลายรูป (Multi-image Slider แนวนอน)
            Container(
              height: 250,
              color: Colors.black26,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: fish.imagePaths.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () => _showFullImage(context, fish.imagePaths[index]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          fish.imagePaths[index],
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fish.name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 4),
                  Text('ชื่อวิทยาศาสตร์: ${fish.scientificName}', style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.cyanAccent)),
                  const Divider(color: Colors.grey, height: 30),
                  const Text('คุณสมบัติและรายละเอียด:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.amber)),
                  const SizedBox(height: 10),
                  _buildDetailRow(Icons.location_on, 'ถิ่นที่อยู่อาศัย', fish.habitat),
                  _buildDetailRow(Icons.monitor_weight, 'น้ำหนักเฉลี่ย', '${fish.avgWeightKg} กิโลกรัม'),
                  _buildDetailRow(Icons.local_fire_department, 'ระดับความยาก', fish.difficulty),
                  _buildDetailRow(Icons.info_outline, 'คำอธิบายเพิ่มเติม', fish.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.cyan, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
                Text(value, style: const TextStyle(color: Colors.white, fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}