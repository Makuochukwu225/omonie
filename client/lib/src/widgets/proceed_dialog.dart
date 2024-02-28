import 'package:flutter/cupertino.dart';

class ProceedDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onCancel;
  final VoidCallback? onProceed;
  const ProceedDialog(
      {super.key,
      required this.title,
      required this.subtitle,
      this.onCancel,
      this.onProceed});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(subtitle),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: onCancel ??
              () {
                Navigator.of(context).pop(); // Close the dialog
              },
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          onPressed: onProceed ??
              () {
                // Perform some action
                Navigator.of(context).pop(); // Close the dialog
              },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
