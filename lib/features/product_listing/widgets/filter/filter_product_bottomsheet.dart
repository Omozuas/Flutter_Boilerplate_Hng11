import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/product_listing/widgets/filter/filter_product_provider.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_boilerplate_hng11/utils/widgets/custom_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<RangeValues> rangeValues =
        ValueNotifier(const RangeValues(0, 50000));
    return Consumer(
      builder: (context, ref, child) {
        final notifier = ref.read(productProvider.notifier);

        return Container(
          color: GlobalColors.whiteColor,
          padding: const EdgeInsets.all(16.0),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Filter by Status',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                items: ['in stock', 'out of stock'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    notifier.filterProductsByStatus(newValue);
                  }
                },
              ),
              SizedBox(height: 20.h),
              Text('Filter by Price Range',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              RangeSlider(
                min: 0,
                max: 50000,
                activeColor: GlobalColors.orange,
                inactiveColor: GlobalColors.black200Color,
                // enabled: true,
                values: rangeValues.value,
                onChanged: (RangeValues values) {
                  rangeValues.value = values;
                  notifier.filterProductsByPriceRange(values.start, values.end);
                },
              ),
              ValueListenableBuilder<RangeValues>(
                valueListenable: rangeValues,
                builder: (context, values, child) {
                  return Text(
                    'Price Range: \$${values.start.toStringAsFixed(2)} - \$${values.end.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16),
                  );
                },
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  notifier.resetFilters();
                  Navigator.pop(context);
                },
                borderColor: GlobalColors.orange,
                text: 'Reset Filters',
                height: 40.h,
                containerColor: GlobalColors.deemWhiteColor,
                width: 100.w,
                textColor: GlobalColors.orange,
              ),
            ],
          ),
        );
      },
    );
  }
}
