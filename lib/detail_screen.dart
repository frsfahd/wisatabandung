import 'package:flutter/material.dart';
import 'package:wisatabandung/model/tourism_place.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
      color: Colors.red,
    );
  }
}

class DetailScreen extends StatelessWidget {
  final TourismPlace place;
  const DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            // Image
            Stack(
              children: [
                Image.asset(place.imageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back),
                            color: Colors.white,
                          ),
                        ),
                        const FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Title
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),

            // Icons
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(height: 8.0),
                      Text(place.openDays),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.timer_rounded),
                      SizedBox(height: 8.0),
                      Text(place.openTime),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.money),
                      SizedBox(height: 8.0),
                      Text(place.ticketPrice),
                    ],
                  ),
                ],
              ),
            ),

            // Description
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                place.description,
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ),

            // list of images
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
