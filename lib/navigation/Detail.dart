import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import '../entities/User.dart';

class Detail extends StatelessWidget {
  final User user;

  const Detail({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.name} ${user.surname}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(user.images[0], width: double.infinity, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text('Name: ${user.name}', style: const TextStyle(fontSize: 18)),
            Text('Surname: ${user.surname}', style: const TextStyle(fontSize: 18)),
            Text('Age: ${user.age}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            StarRating(
              rating: user.ratting.toDouble(),
              starCount: 5,
            ),
          ],
        ),
      ),
    );
  }
}