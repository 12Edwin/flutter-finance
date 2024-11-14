import 'package:finance_app/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  late final SharedPreferences prefs;

  Future<void> _onTap() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isTutorialDone', true);
    Navigator.pushReplacementNamed(context, '/menu');
  }

  Future<void> _nextTap() async {
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const Navigation(nextButton: true),
    ),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          children:[
            Image.network(
              'https://cdn.prod.website-files.com/65e89895c5a4b8d764c0d70e/664dda58ab18c9f5b15d9f46_89d8f603-fff4-4cba-8cdd-19ca1a4a30b4.webp',
              width: double.infinity,
              height: 256,
            ),
            const Center(
              child: Text(
                'Bienvenido a la app de finanzas',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _nextTap,
              child: const Text('Continuar'),
            ),
            InkWell(onTap: _onTap, child: const Text('No mostrar de nuevo')),
          ]
        ),
      ),
    );
  }
}
