import 'package:flutter/material.dart';

// displays a single image being fetched using a url.
// displays a loadingProgress indicator by calculating the byte size
// to be downloaded and the bytes received already.
// displays an error icon if an error occurred while dowloading.
class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.url,
    this.fit,
    this.size,
    this.circleProgressSize = 20.0,
  });
  final String url;
  final BoxFit? fit;
  final Size? size;
  final double? circleProgressSize;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height: size?.height,
      width: size?.width,
      fit: fit,
      errorBuilder: (_, __, ___) {
        return const Center(child: Icon(Icons.error, size: 50.0));
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: SizedBox(
            height: circleProgressSize,
            width: circleProgressSize,
            child: CircularProgressIndicator.adaptive(
              strokeWidth: 3.0,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
    );
  }
}
