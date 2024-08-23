import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/auth/widgets/chevron_back_button.dart';
import 'package:flutter_boilerplate_hng11/features/auth/providers/auth.provider.dart';
import 'package:flutter_boilerplate_hng11/utils/routing/app_router.dart';
import 'package:flutter_boilerplate_hng11/utils/validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/global_colors.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/custom_text_field.dart';
import 'package:flutter_boilerplate_hng11/l10n/app_localizations.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  static final TextEditingController _emailController = TextEditingController();
  static final _emailKey = GlobalKey<FormState>();

  void _handleSend(WidgetRef ref, BuildContext context) {
    ref
        .read(authProvider.notifier)
        .forgotPassword(_emailController.text, context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(authProvider);
    return Scaffold(
      appBar: AppBar(
        leading: const ChevronBackButton(),
      ),
      body: Form(
        key: _emailKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.forgotPasswordTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 8.sp),
              Text(
                AppLocalizations.of(context)!.forgotPasswordSubtitle,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 28.sp),
              CustomTextField(
                label: AppLocalizations.of(context)!.emailLabel,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                hintText: AppLocalizations.of(context)!.enterEmailHint,
                validator: (v) => Validators.emailValidator(v),
              ),
              SizedBox(height: 32.sp),
              CustomButton(
                loading: loading.passwordButtonLoading,
                onTap: () async {
                  if (_emailKey.currentState?.validate() ?? false) {
                    _handleSend(ref, context);
                  }
                },
                borderColor: GlobalColors.borderColor,
                text: AppLocalizations.of(context)!.sendButtonText,
                height: 48.h,
                containerColor: GlobalColors.orange,
                width: 342.w,
                textColor: Colors.white,
              ),
              SizedBox(height: 16.sp),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: AppLocalizations.of(context)!.rememberPasswordText,
                    style: TextStyle(color: GlobalColors.darkOne),
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.loginButtonText,
                        style: TextStyle(
                          color: GlobalColors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.push(AppRoute.login);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
