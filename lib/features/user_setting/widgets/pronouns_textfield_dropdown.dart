import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PronounsTextfieldDropdown extends StatefulWidget {
  const PronounsTextfieldDropdown({
    super.key,
    this.initialValue,
    this.onChanged,
  });
  final Pronouns? initialValue;
  final ValueChanged<Pronouns?>? onChanged;

  @override
  State<PronounsTextfieldDropdown> createState() =>
      _PronounsTextfieldDropdownState();
}

class _PronounsTextfieldDropdownState extends State<PronounsTextfieldDropdown> {
  Pronouns? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  void onChanged(Pronouns? item) {
    setState(() {
      _value = item;
    });
    widget.onChanged?.call(item);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppLocalizations.of(context)!.pronouns,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF0F172A),
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(
              color: GlobalColors.borderColor,
              width: 1.w,
            ),
          ),
          child: DropdownButton<Pronouns>(
            borderRadius: BorderRadius.circular(6.r),
            padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 12.sp),
            isDense: true,
            dropdownColor: Colors.white,
            icon: const Icon(Icons.keyboard_arrow_down),
            elevation: 2,
            isExpanded: true,
            value: _value,
            hint: Text(
              AppLocalizations.of(context)!.select,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF0F172A),
              ),
            ),
            underline: const SizedBox.shrink(),
            items: [
              DropdownMenuItem(
                value: Pronouns.hehim,
                child: Text(
                  Pronouns.hehim.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF525252),
                  ),
                ),
              ),
              DropdownMenuItem(
                value: Pronouns.sheher,
                child: Text(
                  Pronouns.sheher.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF525252),
                  ),
                ),
              ),
              DropdownMenuItem(
                value: Pronouns.others,
                child: Text(
                  Pronouns.others.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF525252),
                  ),
                ),
              ),
            ],
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

enum Pronouns {
  hehim('He/Him'),
  sheher('She/Her'),
  others('Others');

  const Pronouns(this.title);
  final String title;

  factory Pronouns.fromString(String data) {
    return Pronouns.values.firstWhere(
      (val) => val.title.toLowerCase() == data.toLowerCase(),
      orElse: () => Pronouns.others,
    );
  }
}
