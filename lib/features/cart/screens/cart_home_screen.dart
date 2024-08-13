import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/cart/widgets/price_text_widget.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/features/cart/utils/widget_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/cart_add-remove_button.dart';

class CartHomeScreen extends StatelessWidget {
  const CartHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Cart", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),),
        actions: [
          PopupMenuButton<String>(
            child: Container(
              padding: 10.sp.padA,
              child: const Icon(Icons.more_vert),
            ),
            onSelected: (value) {

            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: Text("My Cart"),
                ),
              ];
            },
          )
        ],
      ),
      body: Column(
        children: [
          Divider(color: const Color(0xFFDEDEDE), height: 1.h,),
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 131.sp,
                  width: width(context),
                  child: Row(
                    children: [
                      Container(
                        height: 131.sp,
                        width: 173.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: const Color(0xFFDEDEDE),
                          image: const DecorationImage(
                            image: CachedNetworkImageProvider(
                              "https://via.placeholder.com/192x131"
                            ),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      17.w.sbW,
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Product 1',
                                        style: TextStyle(
                                          color: const Color(0xFF0A0A0A),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      5.h.sbH,
                                      Text(
                                        'P001',
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 12.sp,
                                          color: const Color(0xFF6E7079),
                                        )
                                      )
                                    ],
                                  ),
                                ),
                                10.sp.sbW,
                                InkWell(
                                  onTap: (){},
                                  child: Container(
                                    padding: 8.w.padA,
                                    child: Icon(
                                      Icons.close, size: 24.sp,
                                      color: GlobalColors.darkOne,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            25.h.sbH,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: PriceWidget(
                                    value: 19,
                                    isBold: true,
                                    size: 18.sp,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    NewIconButton(onPressed: (){}, isAdd: false,),
                                    11.w.sbW,
                                    Padding(
                                      padding: 2.5.padB,
                                      child: Text(
                                        "1",
                                        style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                    11.w.sbW,
                                    NewIconButton(onPressed: (){}, isAdd: true,),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
