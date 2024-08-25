import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate_hng11/utils/global_size.dart';

import '../global_colors.dart';

class CustomDivider {
  Widget shortDivider(BuildContext context) {
    return Container(
      color: GlobalColors.lightGrey200,
      height: 1,
      width: GlobalScreenSize.getScreenWidth(context) * 0.1,
    );
  }
}
