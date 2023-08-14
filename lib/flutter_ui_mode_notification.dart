import 'flutter_ui_mode_notification_platform_interface.dart';

class FlutterUiModeNotification {
  Stream<bool> uiMode() => FlutterUiModeNotificationPlatform.instance.uiMode();
}
