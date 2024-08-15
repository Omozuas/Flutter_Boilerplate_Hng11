import 'package:flutter/material.dart';

class LogOutTile extends StatelessWidget {
  final VoidCallback onTap;

  const LogOutTile({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0), // Adjust this to match other tiles
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0), // Adjust this padding to match icon alignment
                  child: Icon(Icons.logout, color: Colors.red),
                ),
                SizedBox(width: 24), // Adjust this spacing to match text alignment with icon
                Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.0), // Adjust this padding to match arrow alignment
              child: Icon(Icons.arrow_forward_ios, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
