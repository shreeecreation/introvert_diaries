import 'package:introvertdiaries/src/core/core.dart';
import 'package:permission_handler/permission_handler.dart';

@injectable
class PermissionHandler {
  Future<void> requestGalleryPermission() async {
    if (await Permission.photos.isGranted) return;

    final status = await Permission.photos.request();
    if (status.isDenied) {
      await Permission.photos.request();
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }

  Future<void> requestCameraPermission() async {
    if (await Permission.camera.isGranted) return;

    final status = await Permission.camera.request();
    if (status.isDenied) {
      await Permission.camera.request();
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }

  Future<void> requestNotificationPermission() async {
    if (await Permission.notification.isGranted) return;

    final status = await Permission.notification.request();
    if (status.isDenied) {
      await Permission.notification.request();
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }
}
