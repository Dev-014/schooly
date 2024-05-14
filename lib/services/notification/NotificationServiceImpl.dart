import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:practice/services/notification/INotificationService.dart';
import 'package:practice/services/notification/models/NotificationModel.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart';



import 'NotificationConstants.dart';

class NotificationServiceImpl implements INotificationService {
  static NotificationServiceImpl? _instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  final StreamController<NotificationModel>
      _selectedNotificationStreamController;
  final Completer<bool> _initialCompleter;

  NotificationServiceImpl._(
    this._flutterLocalNotificationsPlugin, {
    Completer<bool>? initialCompleter,
    StreamController<NotificationModel>? selectedNotificationStreamController,
  })  : this._initialCompleter = initialCompleter ?? Completer(),
        this._selectedNotificationStreamController =
            selectedNotificationStreamController ?? StreamController();

  factory NotificationServiceImpl.getInstance(
      [FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin]) {
    _instance ??= NotificationServiceImpl._(
        flutterLocalNotificationsPlugin ?? FlutterLocalNotificationsPlugin());
    _instance?._init();
    return _instance!;
  }

  @override
  Stream<NotificationModel> get selectedNotificationStream =>
      _selectedNotificationStreamController.stream;

  Future<void> _init() async {
    if (!_initialCompleter.isCompleted) {
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@drawable/app_icon');
      DarwinInitializationSettings initializationSettingsIOS =
     const  DarwinInitializationSettings(
        requestBadgePermission: false,
        requestSoundPermission: false,
        requestAlertPermission: false,
      );
       InitializationSettings initializationSettings =
          InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );
      await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,

      );
      _initialCompleter.complete(true);
    }
  }

  void _onSelectNotification(String? payload) {
    if (payload != null) {
      NotificationModel notificationModel =
          NotificationModel.fromJson(jsonDecode(payload));
      _selectedNotificationStreamController.add(notificationModel);
    }
  }

  @override
  Future<void> showNotification(NotificationModel notificationModel) async {
    await _initialCompleter.future;
    await _flutterLocalNotificationsPlugin.show(
      notificationModel.id ?? 1,
      notificationModel.title,
      notificationModel.body,
      NotificationDetails(
        android: await _getAndroidDetails(notificationModel),
        iOS: await _getIOSDetails(notificationModel),
      ),
      payload: jsonEncode(notificationModel),
    );
  }

  Future<AndroidNotificationDetails?> _getAndroidDetails(
    NotificationModel notificationModel,
  ) async {
    if (!Platform.isAndroid) {
      return null;
    }
    ByteArrayAndroidBitmap? androidBitmap;
    StyleInformation? styleInformation;
    if (notificationModel.notificationExtra?.hasImage ?? false) {
      Uri uri = Uri.parse(notificationModel.notificationExtra!.imageUrl!);
      Response response = await get(uri);
      androidBitmap = ByteArrayAndroidBitmap(response.bodyBytes);
      styleInformation = BigPictureStyleInformation(
        androidBitmap,
        largeIcon: androidBitmap,
        hideExpandedLargeIcon: true,
      );
    }
    return AndroidNotificationDetails(
      NotificationConstants.androidChannelId,
      NotificationConstants.androidChannelName,
      priority: Priority.high,
      importance: Importance.max,
      largeIcon: androidBitmap,
      styleInformation: styleInformation,
    );
  }

  Future<DarwinNotificationDetails?> _getIOSDetails(
    NotificationModel notificationModel,
  ) async {
    if (!Platform.isIOS) {
      return null;
    }
    return const DarwinNotificationDetails(

    );
  }

  void close() {
    _selectedNotificationStreamController.close();
  }
}
