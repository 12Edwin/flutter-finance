import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../entities/User.dart';

class Detail extends StatelessWidget {
  final User user;

  const Detail({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16/9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: user.images.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(image, fit: BoxFit.cover, width: double.infinity);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Text('Name: ${user.name}', style: const TextStyle(fontSize: 18)),
            Text('Surname: ${user.surname}', style: const TextStyle(fontSize: 18)),
            Text('Age: ${user.age}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            StarRating(
              rating: user.ratting.toDouble(),
              starCount: 5,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(user.lat, user.lng),
                  zoom: 14.4746,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId('location'),
                    position: LatLng(user.lat, user.lng),
                    infoWindow: const InfoWindow(title: 'Location'),
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}