import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    Key? key,
    this.topPadding = 0,
    this.botPadding = 0,
    this.size = 50,
    this.height = 65,
    this.isLinear = false,
  }) : super(key: key);

  final bool isLinear;
  final double topPadding;
  final double botPadding;
  final double size;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: topPadding, bottom: botPadding),
          child: SizedBox(
            height: size,
            width: size,
            child: Center(
              child: isLinear
                  ? const LinearProgressIndicator()
                  : const CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
