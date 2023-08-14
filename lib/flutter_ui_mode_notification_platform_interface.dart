import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_ui_mode_notification_method_channel.dart';

abstract class FlutterUiModeNotificationPlatform extends PlatformInterface {
  FlutterUiModeNotificationPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterUiModeNotificationPlatform _instance =
      MethodChannelFlutterUiModeNotification();

  static FlutterUiModeNotificationPlatform get instance => _instance;

  static set instance(FlutterUiModeNotificationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Stream<bool> uiMode() {
    throw UnimplementedError('uiMode() has not been implemented.');
  }
}
