import 'package:finance_app/navigation/Detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../entities/User.dart';

class UserRow extends StatelessWidget {
  final User user;

  const UserRow({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
        return Detail(user: user);
    }));
      },
      child: Row(
        children: [
          Image.network(user.images[0], width: 100),
          const SizedBox(width: 8),
          Column(
            children: [
              Text(user.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text(user.surname, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              Text(user.age.toString(), style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const Spacer(),
          StarRating(
            rating: user.ratting,
            starCount: 5,
          ),
        ],
      ),
    );
  }
}