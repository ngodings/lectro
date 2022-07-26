import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lectro/utils/color_utils.dart';

import '../../utils/constant.dart';
import '../components/button/small_button.dart';
import '../components/card/circle_card.dart';
import '../components/title/main_title.dart';

class ChangeColorDashboard extends StatefulWidget {
  const ChangeColorDashboard({Key? key}) : super(key: key);

  @override
  State<ChangeColorDashboard> createState() => _ChangeColorDashboardState();
}

class _ChangeColorDashboardState extends State<ChangeColorDashboard> {
  // Color for the picker shown in Card on the screen.
  late Color screenPickerColor;
  // Color for the picker in a dialog using onChanged.
  late Color dialogPickerColor;
  // Color for picker using the color select dialog.
  late Color dialogSelectColor;

  @override
  void initState() {
    super.initState();
    screenPickerColor = Colors.blue; // Material blue.
    dialogPickerColor = Colors.red; // Material red.
    dialogSelectColor = const Color(0xFFA239CA); // A purple color.
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Center(
              child: MainTitle(
                title: 'Click icon to change color',
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 30.w,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: colorPickerDialogPanel,
                  child: CircleMonitorUp(
                    circleColor: screenPickerColor,
                    numberColor: Colors.white,
                    img: 'assets/icons/solar-panel-no-text.png',
                    txt: 'click me!',
                  ),
                ),
                SizedBox(width: 50.w),
                InkWell(
                  onTap: () {},
                  child: const CircleMonitorUp(
                    circleColor: grid,
                    numberColor: Colors.white,
                    img: 'assets/icons/flash.png',
                    txt: 'click me!',
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 70.w,
                right: 70.w,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const CircleMonitorUp(
                      circleColor: home,
                      numberColor: Colors.white,
                      img: 'assets/icons/home.png',
                      txt: 'click me!',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const CircleMonitorUp(
                      circleColor: Colors.grey,
                      numberColor: Colors.white,
                      img: 'assets/icons/ess.png',
                      txt: 'click me!',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.w,
            ),
            Center(
              child: SmallButton(
                buttonText: 'Save',
                color: button,
                textColor: Colors.white,
                press: () async {},
              ),
            ),
            SizedBox(
              height: 15.w,
            ),
          ],
        ),
      ],
    );
  }

  Future<bool> colorPickerDialogPanel() async {
    return ColorPicker(
      actionButtons: const ColorPickerActionButtons(
        okButton: false,
        closeButton: true,
        dialogActionButtons: true,
        dialogActionIcons: true,
        dialogOkButtonType: ColorPickerActionButtonType.outlined,
        dialogCancelButtonType: ColorPickerActionButtonType.text,
      ),
      // Use the dialogPickerColor as start color.
      color: screenPickerColor,
      // Update the dialogPickerColor using the callback.
      onColorChanged: (Color color) => setState(() {
        screenPickerColor = color;

        // ignore: unused_local_variable
        Color colors = ColorUtils.stringToColor(
            screenPickerColor.toString()); // returns `Color(0xff337a8b)`

        // ignore: unused_local_variable
        String hexColor =
            ColorUtils.stringToHexColor(screenPickerColor.toString());
      }),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.caption,
      colorNameTextStyle: Theme.of(context).textTheme.caption,
      colorCodeTextStyle: Theme.of(context).textTheme.caption,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
    ).showPickerDialog(
      context,
      constraints:
          const BoxConstraints(minHeight: 460, minWidth: 300, maxWidth: 320),
    );
  }
}
