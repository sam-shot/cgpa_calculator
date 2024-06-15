import 'package:flutter/cupertino.dart';

extension Navigation on BuildContext {
  push<T extends Object>(Widget page) {
    return Navigator.push(
      this,
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  pop() {
    return Navigator.pop(this);
  }

  replace<T extends Object>(Widget page) {
    return Navigator.pushReplacement(
      this,
      CupertinoPageRoute(builder: (context) => page),
    );
  }
}
