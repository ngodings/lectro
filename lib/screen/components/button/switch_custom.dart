import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme_data.dart';

class SwitchCustomButton extends StatefulWidget {
  final Function()? action;
  final double? scale, x, y;
  final bool value;
  const SwitchCustomButton(
      {Key? key, this.action, this.scale, this.x, this.y, required this.value})
      : super(key: key);

  @override
  State<SwitchCustomButton> createState() => _SwitchCustomButtonState();
}

class _SwitchCustomButtonState extends State<SwitchCustomButton> {
  late bool value;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      origin: Offset(widget.x!, widget.y!),
      scale: widget.scale,
      child: CupertinoSwitch(
        thumbColor: CustomColor.tertiary,
        activeColor: Colors.white,
        trackColor: Colors.grey,
        value: widget.value,
        onChanged: (value) => setState(() {
          this.value = value;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Warning!'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: const [
                      Text('Are you sure want to turn on/off ?'),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: widget.action,
                    child: const Text('Yes'),
                  ),
                  TextButton(
                    child: const Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }),
      ),
    );
  }
}
