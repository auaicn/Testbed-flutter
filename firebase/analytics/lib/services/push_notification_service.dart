import 'dart:io';

import 'package:compound/constants/route_names.dart';
import 'package:compound/locator.dart';
import 'package:compound/services/navigation_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final NavigationService _navigationService = locator<NavigationService>();

  Future initialise() async {
    if (Platform.isIOS) {
      // request permissions if we're on android
    }

    NotificationSettings settings = await _fcm.requestPermission();

    print('[Overall] User granted permission: ${settings.authorizationStatus}');

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }

    FirebaseMessaging.onMessage.listen((message) {
      print('onMessage: ${message.data}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('onLaunch: ${message.data}');
      _serialiseAndNavigate(message.data);
    });

    FirebaseMessaging.onBackgroundMessage((message) {
      print('onResume: ${message.data}');
      _serialiseAndNavigate(message.data);
      return;
    });
  }

  void _serialiseAndNavigate(Map<String, dynamic> message) {
    var notificationData = message['data'];
    var view = notificationData['view'];

    if (view != null) {
      // Navigate to the create post view
      if (view == 'create_post') {
        _navigationService.navigateTo(CreatePostViewRoute);
      }
    }
  }
}
