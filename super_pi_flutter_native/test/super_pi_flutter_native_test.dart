import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_pi_flutter_native/super_pi_flutter_native.dart';

void main() {
  const MethodChannel channel = MethodChannel('super_pi_flutter_native');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await SuperPiFlutterNative.platformVersion, '42');
  });
}
