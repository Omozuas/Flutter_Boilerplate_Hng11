import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final String profileName;
  final String profileEmail;
  final String? image;
  final double? radius;
  final double? padding;
  final TextStyle? profileNameStyle, profileEmailStyle;

  const CustomAvatar(
      {super.key,
      required this.profileName,
      required this.profileEmail,
      this.image,
      this.radius,
      this.padding,
      this.profileNameStyle,
      this.profileEmailStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: radius ?? 40.0,
          backgroundImage: NetworkImage(image ??
              'https://github.com/user-attachments/assets/93e38020-8447-4f79-a623-cfea02d6bd4b'),
        ),
        const SizedBox(width: 10.0),
        Padding(
          padding: EdgeInsets.only(top: padding ?? 19.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(profileName, style: profileNameStyle),
              const SizedBox(height: 3.0),
              Text(profileEmail, style: profileEmailStyle)
            ],
          ),
        )
      ],
    );
  }
}
