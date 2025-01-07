import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class DeviceUtils {
  static Future<String> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    String identifier = "-";
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        {
          final androidInfo = await deviceInfo.androidInfo;
          identifier = androidInfo.id;
        }
      case TargetPlatform.fuchsia:
        {}
      case TargetPlatform.iOS:
        {
          final androidInfo = await deviceInfo.iosInfo;
          identifier = androidInfo.identifierForVendor ?? "-";
        }
      case TargetPlatform.linux:
        {
          final androidInfo = await deviceInfo.linuxInfo;
          identifier = androidInfo.machineId ?? "-";
        }
      case TargetPlatform.macOS:
        {}
      case TargetPlatform.windows:
        {}
    }
    return identifier;
  }
}
