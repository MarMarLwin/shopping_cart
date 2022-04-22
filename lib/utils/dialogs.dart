import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_stories/widgets/small_text.dart';

import 'colors.dart';
import 'dimensions.dart';

showLoading(BuildContext context) {
  var width = MediaQuery.of(context).size.width / 7 * 2;
  var dialog = SimpleDialog(
    insetPadding: EdgeInsets.symmetric(horizontal: width),
    children: [
      Center(
        child: Column(children: [
          SizedBox(height: Dimension.dimen30),
          const CircularProgressIndicator(),
          SizedBox(height: Dimension.dimen30),
        ]),
      )
    ],
    elevation: 24,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
  );

  showDialog(
    context: context,
    builder: (_) => dialog,
    barrierDismissible: false,
  );
}

showActionDialog(
    BuildContext context, String? title, String content, VoidCallback callback,
    {String positiveLabel = 'YES',
    String negativeLabel = 'CANCEL',
    Color positiveColor = Colors.green,
    callback2,
    bool dismissable = true}) {
  var dialog = AlertDialog(
    title: title == null
        ? null
        : Text(title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
    content: Text(content, style: const TextStyle(fontSize: 15)),
    elevation: 24,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            if (callback2 != null) {
              callback2();
            }
          },
          child: Text(negativeLabel,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.grey))),
      TextButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            callback();
          },
          child: Text(positiveLabel,
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: positiveColor)))
    ],
  );

  showDialog(
    context: context,
    builder: (_) => dialog,
    barrierDismissible: dismissable,
  );
}

showInfoDialog(BuildContext context, String? title, String content,
    {String positiveLabel = 'CLOSE', callback}) {
  var dialog = AlertDialog(
    title: title == null
        ? null
        : Text(title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
    content: Text(content, style: const TextStyle(fontSize: 15)),
    elevation: 24,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
    actions: [
      TextButton(
          onPressed: () {
            if (positiveLabel.toLowerCase().contains('copy')) {
              Clipboard.setData(ClipboardData(text: content));
            }

            Navigator.of(context, rootNavigator: true).pop();

            if (callback != null) {
              callback();
            }
          },
          child: Text(positiveLabel,
              style: const TextStyle(fontWeight: FontWeight.w600)))
    ],
  );

  showDialog(
    context: context,
    builder: (_) => dialog,
    barrierDismissible: true,
  );
}

showSuccessDialog(
    BuildContext context, String? title, String content, VoidCallback callback,
    {String positiveLabel = 'CLOSE'}) {
  var dialog = AlertDialog(
    title: title == null
        ? null
        : Row(
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 30,
              ),
              const SizedBox(width: 10),
              Text(title,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w600))
            ],
          ),
    content: Text(content, style: const TextStyle(fontSize: 15)),
    elevation: 24,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
    actions: [
      TextButton(
          onPressed: () {
            if (positiveLabel.toLowerCase().contains('copy')) {
              Clipboard.setData(ClipboardData(text: content));
            }

            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Text(positiveLabel,
              style: const TextStyle(fontWeight: FontWeight.w600)))
    ],
  );

  showDialog(
    context: context,
    builder: (_) => dialog,
    barrierDismissible: false,
  ).then((value) {
    callback();
  });
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: SmallText(text: message,color: primaryColor),
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.white,
    ),
  );
}
