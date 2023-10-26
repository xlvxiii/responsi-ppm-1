import 'package:flutter/material.dart';
import 'package:responsi_ppm_1/ikan_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ikan',
      debugShowCheckedModeBanner: false,
      home: IkanPage(),
    );
  }
}
