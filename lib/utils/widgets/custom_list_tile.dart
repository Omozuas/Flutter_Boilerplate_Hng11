import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final Image image;
  final VoidCallback onTap;

  const SettingsTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon),
      title: Row(
        children: [
          image,
          SizedBox(width: 8),
          Text(title),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
