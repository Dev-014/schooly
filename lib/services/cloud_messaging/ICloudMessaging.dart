import 'package:practice/services/notification/models/NotificationModel.dart';

abstract class ICloudMessaging {
  Future<NotificationModel?> get initialMessage;

  Stream<NotificationModel> get clickedNotification;

  Future<String?> getFirebaseToken();

  void setUpListener();

  Future<void> requestPermissions();
}
