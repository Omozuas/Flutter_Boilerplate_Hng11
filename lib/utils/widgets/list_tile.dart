import 'package:flutter/widgets.dart';

import '../Styles/text_styles.dart';
import '../global_size.dart';

class CustomTiles {
  Widget textTile(BuildContext context, String title, String description, ) {
    return SizedBox(
      width: GlobalScreenSize.getScreenWidth(context),
      child: Row(
        children: [
          Text(
            title,
            style: CustomTextStyles.bannerbodyTextBlack400,
          ),
          const Spacer(),
          Text(
            '\$$description',
            style: CustomTextStyles.bannerbodyTextBlack500,
          )
        ],
      ),
    );
  }
 Widget textTile2(BuildContext context, String title, String description, ) {
    return SizedBox(
      width: GlobalScreenSize.getScreenWidth(context),
      child: Row(
        children: [
          Text(
            title,
            style: CustomTextStyles.bannerbodyTextBlack200,
          ),
          const Spacer(),
          Text(
            '\$$description',
            style: CustomTextStyles.bannerbodyTextBlack,
          )
        ],
      ),
    );
  }
}
