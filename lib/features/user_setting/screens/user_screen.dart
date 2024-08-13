import 'package:flutter/material.dart';

import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';

import 'package:flutter_boilerplate_hng11/utils/widgets/custom_dropdown_button.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAccountSetting extends StatefulWidget {
  const UserAccountSetting({super.key});

  @override
  State<UserAccountSetting> createState() => _UserAccountSettingState();
}

class _UserAccountSettingState extends State<UserAccountSetting> {
  bool _isSwitched = false;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.lightGray,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Members',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text('Manage who has access to this workspace'),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Invite Link',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.6,
                      child: Switch(
                        value: _isSwitched,
                        onChanged: (value) {
                          setState(() {
                            _isSwitched = value;
                          });
                        },
                        activeTrackColor: const Color(0xFFF97316),
                      ),
                    ),
                  ],
                ),
                const Text(
                    'This provide a unique URL that allows anyone to join your workspace'),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Manage members',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //Reasons why I used this instead is because of the onTap that is required
                    Container(
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFFF97316),
                      ),
                      child: const Center(
                        child: Text(
                          'Invite people',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'On the Free plan all members in a workspace are administrators. Upgrade to a paid plan to add the ability to assign or remove administrator roles',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text(
                      'Go to Plans',
                      style: TextStyle(
                        color: Color(0xFFF97316),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Color(0xFFF97316),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(2),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            Text('Search by name or email')
                          ],
                        ),
                      ),
                    ),

                    //I used a placeholder here since it's not my task to implement the dropdown for search
                    Container(
                      height: 50,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('All'),
                            Icon(Icons.keyboard_arrow_down)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text(
                      '3 active members',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // SettingsTile(leadingIcon: Icons.more_vert, title: title, onTap: onTap)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.more_vert),
                    const CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://github.com/user-attachments/assets/93e38020-8447-4f79-a623-cfea02d6bd4b'),
                    ),
                    const SizedBox(width: 5.0),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Chad Bosewick',
                              style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: const Color(0xff0A0A0A)),
                            ),
                            Text(
                              'chadbosewick@gmail.com',
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: const Color(0xff525252),
                              ),
                            ),
                          ],
                        )),
                    // const CustomAvatar(
                    //   profileName: 'Chad Bosewick',
                    //   profileEmail: 'chadbosewick@gmail.com',
                    // ),
                    const SizedBox(width: 5.0),
                    CustomDropdownButton(
                      items: const ['Admin', 'User', 'Guest'],
                      initialValue: 'Admin',
                      placeholder: "Select",
                      onChanged: (value) {
                        print("Selected role: $value");
                      },
                      borderColor: Colors.transparent,
                      height: 50,
                      containerColor: GlobalColors.lightGray,
                      width: 90,
                      textColor: Colors.black,
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                // SettingsTile(leadingIcon: Icons.more_vert, title: title, onTap: onTap)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.more_vert),
                    const CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://github.com/user-attachments/assets/93e38020-8447-4f79-a623-cfea02d6bd4b'),
                    ),
                    const SizedBox(width: 5.0),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Chad Bosewick',
                              style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: const Color(0xff0A0A0A)),
                            ),
                            Text(
                              'chadbosewick@gmail.com',
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: const Color(0xff525252),
                              ),
                            ),
                          ],
                        )),
                    // const CustomAvatar(
                    //   profileName: 'Chad Bosewick',
                    //   profileEmail: 'chadbosewick@gmail.com',
                    // ),
                    const SizedBox(width: 5.0),
                    CustomDropdownButton(
                      items: const ['Admin', 'User', 'Guest'],
                      initialValue: 'Admin',
                      placeholder: "Select",
                      onChanged: (value) {
                        print("Selected role: $value");
                      },
                      borderColor: Colors.transparent,
                      height: 50,
                      containerColor: GlobalColors.lightGray,
                      width: 90,
                      textColor: Colors.black,
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                // SettingsTile(leadingIcon: Icons.more_vert, title: title, onTap: onTap)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.more_vert),
                    const CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://github.com/user-attachments/assets/93e38020-8447-4f79-a623-cfea02d6bd4b'),
                    ),
                    const SizedBox(width: 5.0),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Chad Bosewick',
                              style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: const Color(0xff0A0A0A)),
                            ),
                            Text(
                              'chadbosewick@gmail.com',
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: const Color(0xff525252),
                              ),
                            ),
                          ],
                        )),
                    // const CustomAvatar(
                    //   profileName: 'Chad Bosewick',
                    //   profileEmail: 'chadbosewick@gmail.com',
                    // ),
                    const SizedBox(width: 5.0),
                    CustomDropdownButton(
                      items: const ['Admin', 'User', 'Guest'],
                      initialValue: 'Admin',
                      placeholder: "Select",
                      onChanged: (value) {
                        print("Selected role: $value");
                      },
                      borderColor: Colors.transparent,
                      height: 50,
                      containerColor: GlobalColors.lightGray,
                      width: 90,
                      textColor: Colors.black,
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Export Members List',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Custombutton(
                    //   onTap: ,
                    //   borderColor: Colors.transparent,
                    //   text: 'Invite people',
                    //   height: 35,
                    //   containerColor: Color(0x0ff97315),
                    //   width: 100,
                    //   textColor: Colors.white,
                    // )
                    //Reasons why I used this instead is because of the onTap that is required
                    Container(
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFFF97316),
                      ),
                      child: const Center(
                        child: Text(
                          'Export CSV',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Export a CSV with information of all members of your team',
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
