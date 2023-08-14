// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_ui_mode_notification/flutter_ui_mode_notification.dart';
// import 'package:flutter_ui_mode_notification/flutter_ui_mode_notification_platform_interface.dart';
// import 'package:flutter_ui_mode_notification/flutter_ui_mode_notification_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockFlutterUiModeNotificationPlatform
//     with MockPlatformInterfaceMixin
//     implements FlutterUiModeNotificationPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final FlutterUiModeNotificationPlatform initialPlatform = FlutterUiModeNotificationPlatform.instance;

//   test('$MethodChannelFlutterUiModeNotification is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelFlutterUiModeNotification>());
//   });

//   test('getPlatformVersion', () async {
//     FlutterUiModeNotification flutterUiModeNotificationPlugin = FlutterUiModeNotification();
//     MockFlutterUiModeNotificationPlatform fakePlatform = MockFlutterUiModeNotificationPlatform();
//     FlutterUiModeNotificationPlatform.instance = fakePlatform;

//     expect(await flutterUiModeNotificationPlugin.getPlatformVersion(), '42');
//   });
// }
