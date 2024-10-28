import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/entities/User.dart';
import 'package:flutter/material.dart';

import 'UserRow.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User> data = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    final db = FirebaseFirestore.instance;
    db
      .collection("users")
      .snapshots()
      .listen((event) {
        data = [];
        for (var doc in event.docs) {
          data.add(doc.data() as User);
        }
        if (mounted){
          setState(() {
            isLoading = false;
          });
        }
      });
  }
  @override
  Widget build(BuildContext context) {
    return isLoading ?
    const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ) :
    Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return UserRow(user: data[index]);
        }
      ),
    );
  }

}
