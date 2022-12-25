import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lapp/screen/login.dart';

class WarningAlert {
  late int year;
  void showDialog(
      {required BuildContext context,
      String text = '',
      String? button2Text,
      String? button1Text,
      bool isNavigate = false,
      String? routeName,
      Function()? onPressed}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
              ),
              child: Text(
                button2Text ?? 'Болсон',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: onPressed ??
                  () {
                    Navigator.of(context).pop();
                  },
            ),
            isNavigate
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: Colors.transparent,
                    ),
                    child: const Text(
                      'Tийм',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    })
                : Container(),
          ],
        );
      },
    );
  }
}
