import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/models/list_members_model.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/screens/organisational_settings/members_profile.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAvatar extends StatelessWidget {
  final Members memberDetail;
  final double? radius;
  final double? padding;
  final TextStyle? profileNameStyle, profileEmailStyle;

  const CustomAvatar({
    super.key,
    this.radius,
    this.padding,
    this.profileNameStyle,
    this.profileEmailStyle,
    required this.memberDetail,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MemberProfileScreen(
            memberDetail: memberDetail,
          );
        }));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,  // Center align image with text
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: radius ?? 20.0,
            backgroundImage: NetworkImage(
              memberDetail.avatarUrl ??
                  'https://github.com/user-attachments/assets/93e38020-8447-4f79-a623-cfea02d6bd4b',
            ),
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${memberDetail.firstName ?? "Member Name"} ${memberDetail.lastName ?? ""}",
                style: profileNameStyle ?? GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 16.94 / 14,
                  color: const Color(0xff525252),
                ),
              ),
              const SizedBox(height: 3.0),
              Text(
                memberDetail.email ?? "memberEmail@gmail.com",
                style: profileEmailStyle ?? GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 14.52 / 12,
                  color: const Color(0xff525252),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
