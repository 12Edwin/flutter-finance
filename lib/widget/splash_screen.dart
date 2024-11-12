import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance
    .authStateChanges()
    .listen((User? user) {
      Future.delayed(const Duration(seconds: 2), (){
        if (user != null) {
          Navigator.pushNamed(context, '/menu');
        }else{
          Navigator.pushNamed(context, '/login');
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActivityIndicator(),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: Text('Bienvenido', textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
