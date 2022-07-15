import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import '../main_screens/order_summary.dart';

class GlobalWidgets {

  // Widget textFormField({required controller, maxLength = 100, maxLines = 5}) {
  //   return TextFormField(
  //     controller: controller,
  //     maxLength: maxLength,
  //     maxLines: maxLines,
  //     validator: (value) {
  //       if (value == null || value.isEmpty) {
  //         return 'Please type something';
  //       }
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       filled: true,
  //       fillColor: Colors.brown.shade50,
  //       enabledBorder: const UnderlineInputBorder(
  //           borderSide: BorderSide(color: Colors.white)),
  //     ),
  //   );
  // }

  static void showErrorDialog({  required BuildContext context}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.all(3),
              content: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: OrderSummary()),
              actions: [
                TextButton(
                  child: const Text('Confirm Order'),
                  onPressed: () {

                  },
                ),
                TextButton(
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.canPop(context) ? Navigator.pop(context) : null;
                  },
                ),
              ],
            ),
          );
        }
    );
  }

 static Future showToast({msg, color}) async {
    await Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
// gravity: ToastGravity.CENTER,
// timeInSecForIosWeb: 1,
        backgroundColor: color,
// textColor: Colors.white,
        fontSize: 18.0
    );
  }

}