import 'dart:async';
import 'dart:convert';

import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:lectro/utils/api.dart';
import 'package:lectro/utils/constant.dart';

import '../../helper/user_device.dart';
import '../components/button/default_button.dart';

class FormChangeESSDevice extends StatefulWidget {
  const FormChangeESSDevice({Key? key}) : super(key: key);

  @override
  State<FormChangeESSDevice> createState() => _FormChangeESSDeviceState();
}

class _FormChangeESSDeviceState extends State<FormChangeESSDevice> {
  final _formKey = GlobalKey<FormState>();
  List data = [];
  String? device;

  Future<String> getDeviceData() async {
    final token = await secureStorage.read(key: clientToken);
    var response = await http.get(Uri.parse(mainUrl + profilUrl), headers: {
      'Authorization': 'Bearer $token',
    });

    var resBody = json.decode(response.body);
    var id = await secureStorage.read(key: clientDeviceId);
    String? devices = id.toString();
    // ignore: avoid_print
    print(resBody);

    setState(() {
      data = resBody['data']['access_devices'];

      device = devices;
    });

    return "Sucess";
  }

  @override
  void initState() {
    super.initState();
    getDeviceData();
  }

  late String _mySelection = device!;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 10,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Change your device here!',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 10,
          ),
          Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  buildSelect(device.toString()),
                  const SizedBox(height: 16),
                  BasicButton(
                    color: button,
                    text: "Save",
                    press: () async {
                      int? id = int.parse(_mySelection);
                      await secureStorage.write(
                          key: clientDeviceId, value: id.toString());

                      // ignore: avoid_print
                      print('this is my selection');
                      // ignore: avoid_print
                      print(_mySelection);
                      AwesomeDialog(
                          context: context,
                          animType: AnimType.LEFTSLIDE,
                          headerAnimationLoop: false,
                          dialogType: DialogType.SUCCES,
                          showCloseIcon: true,
                          title: 'Device has been changed',
                          desc: 'Yeay, data has been changed!',
                          btnOkOnPress: () {},
                          btnOkIcon: Icons.check_circle,
                          onDissmissCallback: (type) {
                            debugPrint('Dialog Dissmiss from callback $type');
                          }).show();
                    },
                  ),
                  //const SizedBox(height: 16),
                  // const Text.rich(
                  //   TextSpan(
                  //     style: TextStyle(color: Colors.black),
                  //     children: [
                  //       TextSpan(
                  //         text: "Last record data was on Device",
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSelect(String value) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: "ESS Device",
        labelStyle: TextStyle(
            color: Colors.green, fontSize: 14.w, fontWeight: FontWeight.bold),
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      style: const TextStyle(color: Colors.black87),
      items: data.map((item) {
        return DropdownMenuItem(
          // ignore: sort_child_properties_last
          child: Text(item['name']),
          value: item['id'].toString(),
        );
      }).toList(),
      onChanged: (newVal) {
        setState(() {
          _mySelection = newVal.toString();
        });
      },
    );
  }
}

class ChangeDevice extends StatefulWidget {
  const ChangeDevice({Key? key}) : super(key: key);

  @override
  State<ChangeDevice> createState() => _ChangeDeviceState();
}

class _ChangeDeviceState extends State<ChangeDevice> {
  List data = [];
  String? device;

  Future<String> getDeviceData() async {
    final token = await secureStorage.read(key: clientToken);
    var response = await http.get(Uri.parse(mainUrl + profilUrl), headers: {
      'Authorization': 'Bearer $token',
    });

    var resBody = json.decode(response.body);
    var id = await secureStorage.read(key: clientDeviceId);
    String? devices = id.toString();
    // ignore: avoid_print
    print(resBody);

    setState(() {
      data = resBody['data']['access_devices'];

      device = devices;
    });

    return "Sucess";
  }

  @override
  void initState() {
    super.initState();
    getDeviceData();
  }

  late String _mySelection = device!;
  @override
  Widget build(BuildContext context) {
    return buildSelect(device.toString());
  }

  Widget buildSelect(String value) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: "ESS Device",
        labelStyle: TextStyle(
            color: Colors.green, fontSize: 14.w, fontWeight: FontWeight.bold),
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      style: const TextStyle(color: Colors.black87),
      items: data.map((item) {
        return DropdownMenuItem(
          // ignore: sort_child_properties_last
          child: Text(item['name']),
          value: item['id'].toString(),
        );
      }).toList(),
      onChanged: (newVal) async {
        setState(() {
          _mySelection = newVal.toString();
        });

        int? id = int.parse(_mySelection);
        await secureStorage.write(key: clientDeviceId, value: id.toString());

        // ignore: avoid_print
        print('this is my selection');
        // ignore: avoid_print
        print(_mySelection);
      },
    );
  }
}
