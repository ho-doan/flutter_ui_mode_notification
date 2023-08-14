import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_ui_mode_notification/flutter_ui_mode_notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool dartMode = false;
  final _flutterUiModeNotificationPlugin = FlutterUiModeNotification();
  late StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    try {
      _subscription = _flutterUiModeNotificationPlugin.uiMode().listen((event) {
        if (mounted) {
          setState(() => dartMode = event);
        }
      });
    } on PlatformException catch (e) {
      log(e.toString());
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: dartMode: $dartMode\n'),
        ),
      ),
    );
  }
}
