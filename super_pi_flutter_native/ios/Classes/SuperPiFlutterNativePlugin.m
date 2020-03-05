#import "SuperPiFlutterNativePlugin.h"
#if __has_include(<super_pi_flutter_native/super_pi_flutter_native-Swift.h>)
#import <super_pi_flutter_native/super_pi_flutter_native-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "super_pi_flutter_native-Swift.h"
#endif

@implementation SuperPiFlutterNativePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSuperPiFlutterNativePlugin registerWithRegistrar:registrar];
}
@end
