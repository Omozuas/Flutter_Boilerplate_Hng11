import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/custom_app_bar.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/dialogs/profile_dialog/profile_dialogs.dart';
import 'package:flutter_boilerplate_hng11/services/password_service.dart';
import 'package:flutter_boilerplate_hng11/services/service_locator.dart';
import 'package:flutter_boilerplate_hng11/services/user.service.dart';
import 'package:flutter_boilerplate_hng11/utils/custom_text_style.dart';
import 'package:flutter_boilerplate_hng11/utils/context_extensions.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:one_context/one_context.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../utils/validator.dart';


class UpdatePassword extends ConsumerStatefulWidget {
  const UpdatePassword({super.key});

  @override
  ConsumerState<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends ConsumerState<UpdatePassword> {
  bool currentPasswordVissible = false;
  bool newPasswordVissible = false;
  bool confPasswordVissible = false;

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
  String? errorMessage;
  final userServiceProvider = Provider<UserService>((ref) {
    return locator<UserService>();
  });

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

  void updatePassword() async {
    final currentPassword = currentPasswordController.text;
    final newPassword = newPasswordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (newPassword == confirmPasswordController.text) {
      try {
        final passwordService = ref.read(passwordServiceProvider);
        final userService = ref.read(userServiceProvider);
        final authToken = await userService.getToken();
        await passwordService
            .updatePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
          confirmPassword: confirmPassword,
          token: authToken.toString(),
        )
            .then(
          (value) {
            OneContext().showDialog(
              builder: (ctx) {
                return ProfileDialog(
                    title: context.passwordUpdated,
                    description: context.passwordUpdatedMessage,
                    onContinue: () {
                      Navigator.pop(ctx);
                      context.go(AppRoute.login);
                    });
              },
            );
          },
        );

        //Handle errors
      } on DioException catch (e) {
        // Handle DioException
        if (e.response?.statusCode == 404) {
          setState(() {
            errorMessage = context.passwordUpdated404Error;
          });
        } else {
          setState(() {
            errorMessage = context.passwordUpdatedError;
          });
        }
        OneContext().showDialog(
          builder: (context) {
            return ProfileDialog(
              title: context.error,
              description: errorMessage!,
            );
          },
        );
      } catch (e) {
        // Handle other exceptions
        setState(() {
          errorMessage = context.passwordUpdatedCatchError;
        });
        OneContext().showDialog(
          builder: (context) {
            return ProfileDialog(
              title: AppLocalizations.of(context)!.errorMessage,
              description: errorMessage!,
            );
          },
        );
      }
    } else {
      setState(() {
        passwordsMatch = false;
      });
    }
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
      appBar: CustomAppBar.simpleTitle(
        showDivider: false,
        titleText: context.passwordSetting,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.updatePasswordEnhanced,
                style: CustomTextStyle.regular(
                  color: const Color(0xff434343),
                  fontSize: 12.sp,
                ),
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
                              context.currentPassword,
                              style: CustomTextStyle.regular(
                                fontSize: 16.sp,
                                color: const Color(0xff434343),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: currentPasswordController,
                            obscureText: !currentPasswordVissible,
                            decoration: InputDecoration(
                              hintText: context.enterCurrentPassword,
                              hintStyle: CustomTextStyle.regular(
                                color: const Color(0xff939393),
                                fontSize: 14.sp,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  currentPasswordVissible
                                      ? Icons.visibility
                                      : Icons.visibility_off_outlined,
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      currentPasswordVissible =
                                          !currentPasswordVissible;
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
                            validator: Validators.passwordValidator,
                          ),
                        ],
                      ),
                    ),

                    CustomTextField(
                      label: AppLocalizations.of(context)!.newPassword,
                      controller: newPasswordController,
                      focusNode: newPasswordFocusNode,
                      obscureText: !newPasswordVissible,
                      borderRadius: 8.r,
                      validator: Validators.passwordValidator,
                      onchanged: (String? value) {
                        checkPasswordStrength(value!);
                        validatePasswords();
                      },
                      hintText: AppLocalizations.of(context)!.enterNewPassword,
                      focusedBorderColor: GlobalColors.borderColor,
                      suffixIcon: IconButton(
                        icon: Icon(
                          newPasswordVissible
                              ? Icons.visibility
                              : Icons.visibility_off_outlined,
                          color: GlobalColors.borderColor,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              newPasswordVissible = !newPasswordVissible;
                            },
                          );
                        },
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
                          AppLocalizations.of(context)!.passwordMustContain,
                          textAlign: TextAlign.start,
                          style: CustomTextStyle.medium(
                            fontSize: 13.sp,
                            color: const Color(0xff434343),
                          ),
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
                            Text(
                                AppLocalizations.of(context)!
                                    .atLeastOneUpercase,
                                style: CustomTextStyle.regular(
                                  fontSize: 14.sp,
                                )),
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
                            Text(AppLocalizations.of(context)!.atLeastOneNumber,
                                style: CustomTextStyle.regular(
                                  fontSize: 14.sp,
                                )),
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
                            Text(
                                AppLocalizations.of(context)!
                                    .atLeastEightCharacters,
                                style: CustomTextStyle.regular(
                                  fontSize: 14.sp,
                                )),
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
                              AppLocalizations.of(context)!.confirmNewPassword,
                              style: CustomTextStyle.regular(
                                fontSize: 16.sp,
                                color: const Color(0xff434343),
                              ),
                            ),
                          ),
                          TextFormField(
                            focusNode: confirmPasswordFocusNode,
                            controller: confirmPasswordController,
                            obscureText: !confPasswordVissible,
                            validator: Validators.passwordValidator,
                            onChanged: (value) => validatePasswords(),
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!
                                  .confirmNewPassword,
                              errorText: passwordsMatch
                                  ? null
                                  : AppLocalizations.of(context)!
                                      .passwordDoNotMatch,
                              hintStyle: CustomTextStyle.medium(
                                color: const Color(0xff939393),
                                fontSize: 14.sp,
                              ),
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
                              AppLocalizations.of(context)!.cancel,
                              style: CustomTextStyle.medium(
                                fontSize: 14.sp,
                                color: const Color(
                                  0xff0F172A,
                                ),
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
                              updatePassword();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: GlobalColors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.update,
                              style: CustomTextStyle.medium(
                                fontSize: 14.sp,
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
