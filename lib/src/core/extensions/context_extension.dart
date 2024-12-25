import 'package:introvertdiaries/src/core/core.dart';
import 'package:flutter/services.dart';

extension BuildContextX on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;

  void showSnackbar({
    required String message,
    bool error = false,
  }) {
    HapticFeedback.lightImpact();
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: SnackbarWidget(
            message: message,
            error: error,
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: 10.rounded,
          ),
          backgroundColor: error ? AppColors.statusRed : AppColors.primaryColor,
          padding: EdgeInsets.zero,
          elevation: 0,
          duration: const Duration(seconds: 3),
          margin: EdgeInsets.all(20.r),
        ),
      );
  }

  static OverlayEntry? _currentOverlayEntry;

  void showNotificationBar({required String message, bool error = false}) {
    final overlay = Overlay.of(this);
    late OverlayEntry overlayEntry;

    if (_currentOverlayEntry != null) {
      _currentOverlayEntry!.remove();
    }

    void removeOverlay() {
      if (_currentOverlayEntry == overlayEntry) {
        _currentOverlayEntry?.remove();
        _currentOverlayEntry = null;
      }
    }

    overlayEntry = OverlayEntry(
      builder: (context) => SnackBar(
        content: SnackbarWidget(message: message, error: error),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: 10.rounded,
        ),
        backgroundColor: error ? AppColors.statusRed : AppColors.primaryColor,
        padding: EdgeInsets.zero,
        elevation: 0,
        duration: const Duration(seconds: 3),
        margin: EdgeInsets.all(20.r),
      ),
    );

    _currentOverlayEntry = overlayEntry;

    overlay.insert(overlayEntry);

    Future.delayed(3.seconds, removeOverlay);
  }

  void hideNotificationBar() {
    _currentOverlayEntry?.remove();
    _currentOverlayEntry = null;
  }
}
