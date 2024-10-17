import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    .listen((User? user) async {
      if (user != null) {
        Navigator.pushNamed(context, '/menu');
      }else{
        Navigator.pushNamed(context, '/login');
      }
    });

    // Future.delayed(const Duration(seconds: 3), (){
    //   Navigator.pushReplacementNamed(context, '/login');
    // });
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
