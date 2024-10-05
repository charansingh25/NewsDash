import 'dart:ffi';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String content;
  final String imageUrl;
  const NewsCard(
      {super.key,
      required this.title,
      required this.description,
      required this.content,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: Colors.black,
        elevation: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Image.network(imageUrl,
                  width: double.infinity, height: 200, fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQppJKxBxJI-9UWLe2VVmzuBd24zsq4_ihxZw&s",
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                );
              }),
            ),
            Padding(padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
