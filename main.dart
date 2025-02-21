import 'package:flutter/material.dart';

void main() {
  runApp(const MotivationApp());
}

class MotivationApp extends StatelessWidget {
  const MotivationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kata-kata Motivasi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const MotivationPage(),
    );
  }
}

class MotivationPage extends StatefulWidget {
  const MotivationPage({super.key});

  @override
  State<MotivationPage> createState() => _MotivationPageState();
}

class _MotivationPageState extends State<MotivationPage> {
  final List<String> quotes = [
    "Kesuksesan adalah hasil dari kesempurnaan, kerja keras, belajar dari kegagalan, loyalitas, dan ketekunan.",
    "Jangan pernah menyerah pada mimpimu, karena mimpi memberimu tujuan hidup.",
    "Masa depan adalah milik mereka yang percaya pada keindahan mimpi-mimpi mereka.",
    "Kegagalan adalah bumbu yang membuat kesuksesan terasa lebih nikmat.",
    "Bekerja keras dan bersikap baik akan mengantarmu ke tempat yang menakjubkan."
  ];

  int currentIndex = 0;

  void _nextQuote() {
    setState(() {
      currentIndex = (currentIndex + 1) % quotes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kata-kata Motivasi'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.lightBlueAccent],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      quotes[currentIndex],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _nextQuote,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Kutipan Berikutnya',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
