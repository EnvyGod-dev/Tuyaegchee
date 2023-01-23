import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baekseolmtx/screen/login.dart';

class WarningAlert {
  late int year;
  void showDialog({
    required BuildContext context,
    String text = '',
    String? button2Text,
    String? button1Text,
    bool isNavigate = false,
    Widget? screen,
    Function()? onPressed,
  }) {
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
                    screen != null
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => screen,
                            ),
                          )
                        : Navigator.of(context).pop();
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
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage()), (Route<dynamic> route) => false);
                    })
                : Container(),
          ],
        );
      },
    );
  }
}
