//  import 'dart:io';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/services.dart';
// import 'package:injectable/injectable.dart';

// @lazySingleton
// class DeviceInfoHelper {
//   DeviceInfoHelper(this._deviceInfoPlugin);

//   final DeviceInfoPlugin _deviceInfoPlugin;

//   Future<String> getDeviceId() async {
//     late String deviceIdentity;
//     try {
//       if (Platform.isAndroid) {
//         final info = await _deviceInfoPlugin.androidInfo;
//         deviceIdentity = '${info.device}-${info.id}';
//       } else if (Platform.isIOS) {
//         final info = await _deviceInfoPlugin.iosInfo;
//         deviceIdentity = '${info.model}-${info.identifierForVendor}';
//       }
//     } on PlatformException {
//       deviceIdentity = 'unknown';
//     }
//     return deviceIdentity;
//   }
// }
