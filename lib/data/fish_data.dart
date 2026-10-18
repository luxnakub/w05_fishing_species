import '../models/fish.dart';

final List<Fish> fishList = [
  Fish(
    id: 1,
    name: 'ปลาช่อน',
    scientificName: 'Channa striata',
    habitat: 'แหล่งน้ำจืดทั่วไป แม่น้ำ หนอง คลอง บึง',
    avgWeightKg: 2.5,
    difficulty: 'ปานกลาง',
    description: 'ปลาเศรษฐกิจและปลาเกมยอดนิยม นักตกปลานิยมใช้เหยื่อปลอมประเภทกบยางหรือปลาปลอมในการตก',
    imagePaths: [
      'assets/images/fish1.jpg',
      'assets/images/fish1.jpg',
      'assets/images/fish1.jpg',
    ],
  ),
  Fish(
    id: 2,
    name: 'ปลากราย',
    scientificName: 'Chitala ornata',
    habitat: 'แม่น้ำเจ้าพระยา และแม่น้ำสายใหญ่',
    avgWeightKg: 5.0,
    difficulty: 'ยาก',
    description: 'ปลาน้ำจืดขนาดใหญ่ มีเอกลักษณ์คือจุดสีดำขอบขาวบริเวณโคนหาง เนื้อเหนียวแน่นนิยมนำมาทำทอดมัน',
    imagePaths: [
      'assets/images/fish2.jpg',
      'assets/images/fish2.jpg',
      'assets/images/fish2.jpg',
    ],
  ),
  Fish(
    id: 3,
    name: 'ปลาชะอม (ชะโด)',
    scientificName: 'Channa micropeltes',
    habitat: 'แม่น้ำลึก เขื่อนขนาดใหญ่ และอ่างเก็บน้ำ',
    avgWeightKg: 10.0,
    difficulty: 'ยากมาก',
    description: 'ปลาล่าเหยื่อขนาดใหญ่ที่สุดในวงศ์ปลาช่อน ดุร้ายและทรงพลัง เป็นที่ชื่นชอบของนักตกปลาล่าเหยื่อผิวน้ำ',
    imagePaths: [
      'assets/images/fish3.jpg',
      'assets/images/fish3.jpg',
      'assets/images/fish3.jpg',
    ],
  ),
  Fish(
    id: 4,
    name: 'ปลาบึก',
    scientificName: 'Pangasianodon gigas',
    habitat: 'แม่น้ำโขง และบ่อตกปลาเชิงพาณิชย์',
    avgWeightKg: 80.0,
    difficulty: 'ยากมาก',
    description: 'ปลาน้ำจืดไร้เกล็ดขนาดใหญ่ที่สุดในโลก กินพืชเป็นอาหาร แรงดึงมหาศาล สถิติการตกปลาเกมที่ได้รับความนิยมสูง',
    imagePaths: [
      'assets/images/fish4.jpg',
      'assets/images/fish4.jpg',
      'assets/images/fish4.jpg',
    ],
  ),
  Fish(
    id: 5,
    name: 'ปลานิล',
    scientificName: 'Oreochromis niloticus',
    habitat: 'แม่น้ำ คลอง และบ่อเลี้ยงปลาทั่วไป',
    avgWeightKg: 1.0,
    difficulty: 'ง่าย',
    description: 'ปลาเศรษฐกิจสำคัญที่นำเข้าจากต่างประเทศ เจริญเติบโตเร็ว เลี้ยงง่าย และตกได้ง่ายด้วยเหยื่อรำหรือขนมปัง',
    imagePaths: [
      'assets/images/fish5.jpg',
      'assets/images/fish5.jpg',
      'assets/images/fish5.jpg',
    ],
  ),
];