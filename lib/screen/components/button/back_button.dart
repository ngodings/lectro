import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../services/navigation.dart';

class BackButton extends StatelessWidget {
  const BackButton({Key? key, this.color}) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colors = color ?? Theme.of(context).colorScheme.primary;
    return Container(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: () {
          GetIt.I<NavigationServiceMain>().pop();
        },
        child: Icon(
          Icons.arrow_back,
          size: 21.w,
          color: colors,
        ),
      ),
    );
  }
}
