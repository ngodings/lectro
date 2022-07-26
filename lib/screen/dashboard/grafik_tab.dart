import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({Key? key}) : super(key: key);

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int? theriGroupVakue = 0;

  final Map<int, Widget> logoWidgets = <int, Widget>{
    0: Text(
      'Weekly',
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          fontSize: 14.w,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    1: Text(
      'Monthly',
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          fontSize: 14.w,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  };

  static Widget graph() {
    return Padding(
      padding: EdgeInsets.only(top: 12.w, right: 5.w, left: 5.w),
      child: Text(
        'On progress developing',
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            fontSize: 14.w,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // child: const LineChartSample1(),
    );
  }

  static Widget graphs() {
    return Padding(
      padding: EdgeInsets.only(top: 12.w, right: 5.w, left: 5.w),
      child: Text(
        'On progress developing',
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            fontSize: 14.w,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // child: const WeeklyChart(),
    );
  }

  List<Widget> bodies = [
    graphs(),
    graph(),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 70.w, left: 70.w, top: 10.w),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: CupertinoSegmentedControl(
                      selectedColor: Colors.white,
                      unselectedColor: const Color(0xFF9690ae),
                      borderColor: const Color(0xFF9690ae),
                      groupValue: theriGroupVakue,
                      onValueChanged: (changeFromGroupValue) {
                        setState(() {
                          theriGroupVakue = changeFromGroupValue as int?;
                        });
                      },
                      children: logoWidgets,
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: 5.w, bottom: 14.w, left: 10.w, right: 10.w),
          child: bodies[theriGroupVakue!],
        )
      ],
    );
  }
}
