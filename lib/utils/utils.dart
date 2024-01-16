import 'package:flutter/material.dart';

export 'constants.dart';

class Utils {
  static void changeNodeFocus(BuildContext context,
      {FocusNode? current, FocusNode? next}) {
    current!.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static void hideKeyBoard() => FocusManager.instance.primaryFocus?.unfocus();

  static void Function(PointerDownEvent)? hideKeyBoardOnTapOutside() =>
      (PointerDownEvent pointerDownEvent) => hideKeyBoard();

  static void displaySnackBar(BuildContext context,
      {required String contentText}) {
    var snackBar = SnackBar(
      content: Text(contentText),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class HideKeyBoard extends StatelessWidget {
  const HideKeyBoard({super.key, @required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Utils.hideKeyBoard,
      child: child,
    );
  }
}
