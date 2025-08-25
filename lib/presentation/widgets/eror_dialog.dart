// const/error_dialog.dart
import 'package:flutter/material.dart';
import 'package:my_app/presentation/widgets/const_button.dart';


class ErrorDialog extends StatelessWidget {
  final String errors;
  final bool isDarkTheme;

  const ErrorDialog({
    super.key,
    required this.errors,
    this.isDarkTheme = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDarkTheme ? Colors.black: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white54),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'Error',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDarkTheme ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              errors,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: isDarkTheme ? Colors.white70 : Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
  
            Constbutton(onTap: (){
              Navigator.of(context).pop();
            }, text: "OK", )
          ],
        ),
      ),
    );
  }

  static void show(BuildContext context, String errors, {bool isDarkTheme = true, required Null Function() onOkPressed}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ErrorDialog(
        errors: errors,
        isDarkTheme: isDarkTheme,
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final String errors;
  final bool isDarkTheme;
  final VoidCallback? onOkPressed;

  const SuccessDialog({
    super.key,
    required this.errors,
    this.isDarkTheme = true,
    this.onOkPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDarkTheme ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'Success',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDarkTheme ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              errors,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: isDarkTheme ? Colors.white70 : Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onOkPressed?.call();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void show(
    BuildContext context, 
    String errors, {
    bool isDarkTheme = true,
    VoidCallback? onOkPressed,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => SuccessDialog(
        errors: errors,
        isDarkTheme: isDarkTheme,
        onOkPressed: onOkPressed,
      ),
    );
  }
}