import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownSelect extends StatefulWidget {
  const DropDownSelect({Key? key}) : super(key: key);

  @override
  State<DropDownSelect> createState() => _DropDownSelectState();
}

class _DropDownSelectState extends State<DropDownSelect> {
  final List<String> items = [
    'Device Pos Satpam',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return CustomDropdownButton2(
      buttonHeight: 25.w,
      hint: 'Change Device',
      dropdownItems: items,
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
    );
  }
}
