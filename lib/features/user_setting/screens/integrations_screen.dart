import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/integration_container.dart';
import 'package:flutter_boilerplate_hng11/features/user_setting/widgets/integration_tile.dart';
import 'package:flutter_boilerplate_hng11/utils/global_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntegrationScreen extends StatefulWidget {
  const IntegrationScreen({super.key});

  @override
  _IntegrationScreenState createState() => _IntegrationScreenState();
}

class _IntegrationScreenState extends State<IntegrationScreen> {
  String _selectedSegment = 'All'; // Default segment

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const ImageIcon(
                    AssetImage('assets/images/search.png'),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      CupertinoIcons.chevron_back,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Integration',
                    style: TextStyle(
                      fontSize: 16.sp,
                      height: 1.5.sp,
                      fontWeight: FontWeight.w500,
                      color: GlobalColors.integrationTextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                'Supercharge your workflow and handle repetitive tasks with apps you use every day',
                style: TextStyle(
                  fontSize: 12.sp,
                  height: 1.2.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff0F172A),
                ),
              ),
              SizedBox(height: 20.h),
              CupertinoSegmentedControl<String>(
                groupValue: _selectedSegment,
                children: const {
                  'All': Text('All'),
                  'Active': Text('Active'),
                  'Inactive': Text('Inactive'),
                },
                onValueChanged: (value) {
                  setState(() {
                    _selectedSegment = value;
                  });
                },
              ),
              SizedBox(height: 20.h),
              const IntegrationListView(),
            ],
          ),
        ),
      ),
    );
  }
}
