import 'package:flutter/cupertino.dart';

push(BuildContext context, Widget page) {
  Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
}

pop(BuildContext context) {
  Navigator.pop(context);
}

pushReplace(BuildContext context, Widget page) {
  Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (context) => page));
}

pushRemoveAll(BuildContext context, Widget page) {
  Navigator.pushAndRemoveUntil(context,
      CupertinoPageRoute(builder: (context) => page), (route) => false);
}
