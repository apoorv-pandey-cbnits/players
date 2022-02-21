import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  final String imageUrl;

  const ImageNetwork(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl, errorBuilder:
        (BuildContext context, Object exception, StackTrace? stackTrace) {
      return const Text(
        'Error loading image',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      );
    }, loadingBuilder:
        (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
      if (loadingProgress == null) {
        return child;
      }
      return Center(
        child: CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
              : null,
        ),
      );
    });
  }
}
