import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class DashController extends GetxController
{

  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;


  void ChangeAlertSet(bool value)
  {
    isAlertSet=value;
    update();
  }


  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
            (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            ChangeAlertSet(true);
          }
        },
      );

  @override
  void onInit() {
    getConnectivity();
    super.onInit();
  }
  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
  showDialogBox() => showCupertinoDialog<String>(
    context: Get.context!,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('No Connection'),
      content: const Text('Please check your internet connectivity'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context, 'Cancel');
            ChangeAlertSet(false);
            isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
            if (!isDeviceConnected && isAlertSet == false) {
              showDialogBox();
              ChangeAlertSet(true);
            }
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}