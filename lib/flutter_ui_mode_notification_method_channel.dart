import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_ui_mode_notification_platform_interface.dart';

/// An implementation of [FlutterUiModeNotificationPlatform] that uses method channels.
class MethodChannelFlutterUiModeNotification
    extends FlutterUiModeNotificationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final eventChannel = const EventChannel('flutter_ui_mode_notification');

  @override
  Stream<bool> uiMode() =>
      eventChannel.receiveBroadcastStream('getPlatformVersion').cast<bool>();
}
