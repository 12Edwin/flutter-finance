import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = '';
  String email = '';

  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance
    .authStateChanges()
    .listen((User? user) async {
      if (user != null) {
          for (final providerProfile in user.providerData) {
              setState(() {
                name = providerProfile.uid ?? '';
                email = providerProfile.email ?? '';
              });
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 16, right: 16),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.person, size: 50, color: Colors.white)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(email, style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:[ SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: const Text('Cerrar sesión'),
                    ),
                  ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}