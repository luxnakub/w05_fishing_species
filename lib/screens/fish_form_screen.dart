import 'package:flutter/material.dart';

class FishFormScreen extends StatefulWidget {
  const FishFormScreen({super.key});

  @override
  State<FishFormScreen> createState() => _FishFormScreenState();
}

class _FishFormScreenState extends State<FishFormScreen> {
  // Key สำหรับตรวจสอบความถูกต้องของฟอร์ม
  final _formKey = GlobalKey<FormState>();

  // Controllers สำหรับ TextField
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _scientificNameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  
  // ตัวแปรสำหรับเก็บค่าฟอร์มต่างๆ
  String _selectedDifficulty = 'ปานกลาง'; // สำหรับ Radio
  String _selectedWaterType = 'น้ำจืดทั่วไป'; // สำหรับ Dropdown
  bool _isProtectedSpecies = false; // สำหรับ Checkbox
  bool _isAvailableForFishing = true; // สำหรับ Switch

  // รายการตัวเลือกสำหรับ Dropdown
  final List<String> _waterTypes = ['น้ำจืดทั่วไป', 'แม่น้ำ/เขื่อน', 'หนอง คลอง บึง', 'น้ำไหลเชี่ยว'];

  @override
  void dispose() {
    // คืนทรัพยากรเมื่อปิดหน้าจอ
    _nameController.dispose();
    _scientificNameController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text('เพิ่มข้อมูลสปีชีส์ปลา (W06 Form)', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1E293B),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // 1. TextField: ชื่อปลา
              TextFormField(
                controller: _nameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'ชื่อปลา',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.cyan)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกชื่อปลา';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // 2. TextField: ชื่อวิทยาศาสตร์
              TextFormField(
                controller: _scientificNameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'ชื่อวิทยาศาสตร์',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.cyan)),
                ),
              ),
              const SizedBox(height: 16),

              // 3. TextField: น้ำหนักเฉลี่ย
              TextFormField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'น้ำหนักเฉลี่ย (กก.)',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.cyan)),
                ),
              ),
              const SizedBox(height: 20),

              // 4. DropdownButtonFormField: เลือกประเภทแหล่งน้ำ
              DropdownButtonFormField<String>(
                value: _selectedWaterType,
                dropdownColor: const Color(0xFF1E293B),
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'ประเภทแหล่งน้ำที่อยู่อาศัย',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.cyan)),
                ),
                items: _waterTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type, style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedWaterType = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),

              // 5. Radio: เลือกระดับความยากในการตกปลา
              const Text('ระดับความยากในการตก:', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('ง่าย', style: TextStyle(color: Colors.white, fontSize: 14)),
                      value: 'ง่าย',
                      groupValue: _selectedDifficulty,
                      contentPadding: EdgeInsets.zero,
                      onChanged: (value) {
                        setState(() {
                          _selectedDifficulty = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('ปานกลาง', style: TextStyle(color: Colors.white, fontSize: 14)),
                      value: 'ปานกลาง',
                      groupValue: _selectedDifficulty,
                      contentPadding: EdgeInsets.zero,
                      onChanged: (value) {
                        setState(() {
                          _selectedDifficulty = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('ยาก', style: TextStyle(color: Colors.white, fontSize: 14)),
                      value: 'ยาก',
                      groupValue: _selectedDifficulty,
                      contentPadding: EdgeInsets.zero,
                      onChanged: (value) {
                        setState(() {
                          _selectedDifficulty = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // 6. Checkbox: ปลาคุ้มครอง / ปลาหายาก
              CheckboxListTile(
                title: const Text('เป็นปลาคุ้มครอง / ห้ามล่า', style: TextStyle(color: Colors.white)),
                value: _isProtectedSpecies,
                activeColor: Colors.cyan,
                contentPadding: EdgeInsets.zero,
                onChanged: (bool? value) {
                  setState(() {
                    _isProtectedSpecies = value ?? false;
                  });
                },
              ),

              // 7. Switch: อนุญาตให้ตกได้หรือไม่
              SwitchListTile(
                title: const Text('เปิดให้ตกในฤดูกาลนี้', style: TextStyle(color: Colors.white)),
                value: _isAvailableForFishing,
                activeColor: Colors.cyan,
                contentPadding: EdgeInsets.zero,
                onChanged: (bool value) {
                  setState(() {
                    _isAvailableForFishing = value;
                  });
                },
              ),
              const SizedBox(height: 30),

              // ปุ่มบันทึกข้อมูล
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('บันทึกข้อมูล "${_nameController.text}" สำเร็จ!')),
                    );
                  }
                },
                child: const Text('บันทึกข้อมูลปลา', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}