import 'package:introvertdiaries/src/core/core.dart';
import 'package:image_cropper/image_cropper.dart';

class CroppedFileHelper {
  const CroppedFileHelper._();

  static Future<String?> cropImage(String imagePath) async {
    final croppedFile = await ImageCropper().cropImage(
      compressQuality: 50,
      sourcePath: imagePath,
      uiSettings: [
        AndroidUiSettings(
          activeControlsWidgetColor: AppColors.primaryColor,
          toolbarColor: AppColors.primaryColor,
          toolbarWidgetColor: AppColors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          toolbarTitle: 'Edit Profile',
        ),
        IOSUiSettings(
          showCancelConfirmationDialog: true,
          doneButtonTitle: 'Done',
          cancelButtonTitle: 'Cancel',
          hidesNavigationBar: true,
          title: 'Edit Profile',
        ),
      ],
    );
    return croppedFile!.path;
  }
}
