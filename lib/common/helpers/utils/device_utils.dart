import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceUtils {
  Future<DeviceInformation> getDeviceInfo() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return DeviceInformation(
        deviceId: iosDeviceInfo.identifierForVendor ?? '',
        deviceName: iosDeviceInfo.utsname.machine,
      );
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return DeviceInformation(
        deviceId: androidInfo.id,
        deviceName: androidInfo.model,
      );
    }else{
      return DeviceInformation(
        deviceId: 'Unknown',
        deviceName: 'Unknown',
      );
    }
  }
}

class DeviceInformation {
  final String deviceId;
  final String deviceName;

  DeviceInformation({required this.deviceId, required this.deviceName});
}
