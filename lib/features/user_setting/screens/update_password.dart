import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/profile_dialog/profile_dialogs.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  bool oldPasswordVissible = false;
  bool newPasswordVissible = false;
  bool confPasswordVissible = false;

  // bool passwordVisible = false;
  String password = '';
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  FocusNode newPasswordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  bool isPasswordFieldFocused = false;
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool passwordsMatch = true;

  @override
  void initState() {
    super.initState();
    newPasswordFocusNode.addListener(() {
      setState(() {
        isPasswordFieldFocused = newPasswordFocusNode.hasFocus;
      });
    });
    confirmPasswordFocusNode.addListener(() {
      validatePasswords();
    });
  }

  @override
  void dispose() {
    newPasswordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void checkPasswordStrength(String password) {
    setState(() {
      this.password = password;
      hasUppercase = password.contains(RegExp(r'[A-Z]'));
      hasNumber = password.contains(RegExp(r'[0-9]'));
      hasMinLength = password.length >= 8;
    });
  }

  void validatePasswords() {
    if (confirmPasswordFocusNode.hasFocus) {
      setState(() {
        passwordsMatch =
            newPasswordController.text == confirmPasswordController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Password Setting',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff0A0A0A),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Update password for enhanced account security",
                style: TextStyle(color: Color(0xff434343), fontSize: 12),
              ),
              SizedBox(
                height: 32.h,
              ),
              // Form section starts here
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Current Password",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff434343),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: currentPasswordController,
                            obscureText: !oldPasswordVissible,
                            decoration: InputDecoration(
                              hintText: "Enter current password",
                              hintStyle: GoogleFonts.inter(
                                  color: const Color(0xff939393),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  oldPasswordVissible
                                      ? Icons.visibility
                                      : Icons.visibility_off_outlined,
                                  color: GlobalColors.iconColor,
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      oldPasswordVissible =
                                          !oldPasswordVissible;
                                    },
                                  );
                                },
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xffCBD5E1),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: GlobalColors.darkOne,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              "New Password",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff434343),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: newPasswordController,
                            focusNode: newPasswordFocusNode,
                            obscureText: !newPasswordVissible,
                            onChanged: (value) {
                              checkPasswordStrength(value);
                              validatePasswords();
                            },
                            decoration: InputDecoration(
                              hintText: "Enter New password",
                              hintStyle: GoogleFonts.inter(
                                  color: const Color(0xff939393),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  newPasswordVissible
                                      ? Icons.visibility
                                      : Icons.visibility_off_outlined,
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      newPasswordVissible =
                                          !newPasswordVissible;
                                    },
                                  );
                                },
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xffCBD5E1),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: GlobalColors.darkOne,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Password strength and criteria section starts here
                    if (isPasswordFieldFocused) ...[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 3.h,
                              width: 100.w,
                              color:
                                  password.isEmpty ? Colors.grey : getColor(),
                            ),
                            Container(
                              height: 3.h,
                              width: 100.w,
                              color: password.length >= 4
                                  ? getColor()
                                  : Colors.grey,
                            ),
                            Container(
                              height: 3.h,
                              width: 100.w,
                              color: password.length >= 8
                                  ? getColor()
                                  : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          "Password must contain:",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff434343)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Icon(
                                hasUppercase
                                    ? Icons.check_circle_outline_rounded
                                    : Icons.check_circle_outline_rounded,
                                color: hasUppercase
                                    ? Colors.green
                                    : const Color(0xffdc2626)),
                            const SizedBox(width: 8),
                            Text("At least 1 uppercase",
                                style: GoogleFonts.inter(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Icon(
                                hasNumber
                                    ? Icons.check_circle_outline_rounded
                                    : Icons.check_circle_outline_rounded,
                                color: hasNumber
                                    ? Colors.green
                                    : const Color(0xffdc2626)),
                            const SizedBox(width: 8),
                            Text("At least 1 number",
                                style: GoogleFonts.inter(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Row(
                          children: [
                            Icon(
                                hasMinLength
                                    ? Icons.check_circle_outline_rounded
                                    : Icons.check_circle_outline_rounded,
                                color: hasMinLength
                                    ? Colors.green
                                    : const Color(0xffdc2626)),
                            const SizedBox(width: 8),
                            Text("At least 8 characters",
                                style: GoogleFonts.inter(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    ],
                    // Password strength and criteria section ends here
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Confirm New Password",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff434343),
                              ),
                            ),
                          ),
                          TextFormField(
                            focusNode: confirmPasswordFocusNode,
                            controller: confirmPasswordController,
                            obscureText: !confPasswordVissible,
                            onChanged: (value) => validatePasswords(),
                            decoration: InputDecoration(
                              hintText: "Confirm new password",
                              errorText: passwordsMatch
                                  ? null
                                  : 'Passwords do not match',
                              hintStyle: GoogleFonts.inter(
                                  color: const Color(0xff939393),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  confPasswordVissible
                                      ? Icons.visibility
                                      : Icons.visibility_off_outlined,
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      confPasswordVissible =
                                          !confPasswordVissible;
                                    },
                                  );
                                },
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xffCBD5E1),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: passwordsMatch
                                      ? GlobalColors.darkOne
                                      : const Color(0xffdc2626),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: passwordsMatch
                                      ? GlobalColors.darkOne
                                      : const Color(0xffE80D0D),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Button section starts here.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffffffff),
                              side: const BorderSide(color: Color(0xffE2E8F0)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                            ),
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff0F172A),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const ProfileDialog(
                                      title: "Password Successfully Updated",
                                      description:
                                          "Your password has been successfully updated! You can now log in with your new password.",
                                    );
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: GlobalColors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                            ),
                            child: Text(
                              "Update",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Button section ends here.
                  ],
                ),
              ),
              // Form section starts here
            ],
          ),
        ),
      ),
    );
  }

  // Color changes for password strength
  Color getColor() {
    if (hasUppercase && hasNumber && hasMinLength) {
      return const Color(0xff6dc347);
    }
    if (hasUppercase || hasNumber || hasMinLength) {
      return const Color.fromARGB(255, 196, 255, 59);
    }
    return const Color(0xffdc2626);
  }
}
