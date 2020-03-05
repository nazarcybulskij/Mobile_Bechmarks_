import 'dart:async';

import 'package:flutter/services.dart';

class SuperPiFlutterNative {
  static const MethodChannel _channel =
      const MethodChannel('super_pi_flutter_native');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
