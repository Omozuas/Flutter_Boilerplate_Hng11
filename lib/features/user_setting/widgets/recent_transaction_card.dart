
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';

class RecentTransactionsCard extends StatelessWidget {
  final double? transactionPrice;
  final DateTime? transactionDate;

  const RecentTransactionsCard(
      {super.key, this.transactionPrice, this.transactionDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 72,
          color: GlobalColors.containerBgColor,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Recent Transactions",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                height: 19.36 / 16,
                color: GlobalColors.black),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          height: 72,
          decoration: BoxDecoration(
              border: Border.all(color: GlobalColors.borderColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Date",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 19.36 / 16,
                    color: GlobalColors.black),
              ),
              const SizedBox(width: 12,),
              Text(
                transactionDate?.toIso8601String() ?? "Date",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 19.36 / 16,
                    color: GlobalColors.black),
              ),
            ],
          ),
        ),
        Container(
          height: 72,
          decoration: BoxDecoration(
              border: Border.all(color: GlobalColors.borderColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Status",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 19.36 / 16,
                    color: GlobalColors.black),
              ),
              const SizedBox(width: 12,),
              Text(
                "Paid",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 19.36 / 16,
                    color: GlobalColors.black),
              ),
            ],
          ),
        ),
        Container(
          height: 72,
          decoration: BoxDecoration(
              border: Border.all(color: GlobalColors.borderColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Invoice",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    height: 19.36 / 16,
                    color: GlobalColors.black),
              ),
              const SizedBox(width: 12,),
              Text(
                "Download",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 19.36 / 16,
                    color: GlobalColors.orange),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
