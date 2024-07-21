import 'package:flutter/material.dart';
import 'package:photo_app/components/theme.dart';
import 'package:photo_app/models/photo_model.dart';

class CustomCard extends StatelessWidget {
  final PhotoModel photo;

  const CustomCard({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Container(
      height: 88,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: customColors!.outlineVariant),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              photo.imageUrl,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  photo.photographer,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: customColors.onSurface),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                // SizedBox(height: 2),
                Text(
                  photo.name,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: customColors.onSurfaceVariant),
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
