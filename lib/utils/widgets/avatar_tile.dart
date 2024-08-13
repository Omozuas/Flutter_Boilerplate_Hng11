import 'package:flutter/material.dart';

class AvatarTile extends StatelessWidget {
  final String? image;

  const AvatarTile({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 40.0,
        backgroundImage: NetworkImage(image ??
            'https://github.com/user-attachments/assets/93e38020-8447-4f79-a623-cfea02d6bd4b'));
  }
}
