import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAvatar extends StatelessWidget {
  final String profileName;
  final String profileEmail;
  final String? image;

  const CustomAvatar({super.key, required this.profileName, required this.profileEmail,  this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 40.0,
          backgroundImage: NetworkImage('https://github.com/user-attachments/assets/93e38020-8447-4f79-a623-cfea02d6bd4b'),
        ),
        const SizedBox(width: 10.0),
        Padding(
          padding: const EdgeInsets.only(top: 19.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( profileName,
                style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: const Color(0xff0A0A0A)
                ),
              ),
              const SizedBox(height: 3.0),
              Text(profileEmail,
                style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color(0xff525252)
                ),
              )
            ],),
        )
      ],
    );
  }
}
