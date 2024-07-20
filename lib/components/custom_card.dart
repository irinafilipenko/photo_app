import 'package:flutter/material.dart';
import 'package:photo_app/models/photo_model.dart';

class CustomCard extends StatelessWidget {
  final PhotoModel beer;

  const CustomCard({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFC3C6CF)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              beer.imageUrl,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  beer.photographer,
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1C1E)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                // SizedBox(height: 2),
                Text(
                  beer.name,
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF43474E)),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
