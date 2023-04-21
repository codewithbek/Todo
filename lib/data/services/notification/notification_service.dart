import 'package:todo/export_files.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/data/latest.dart' as tz;
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static final LocalNotificationService localNotificationService =
      LocalNotificationService._();

  factory LocalNotificationService() {
    return localNotificationService;
  }

  LocalNotificationService._();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void init() {
    tz.initializeTimeZones();

    // Android
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    //IOS
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    //Set
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: initializationSettingsDarwin,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
  }

// Android
  /// This func works when notification has sent when device was on foreground and when will
  /// tapped on this notification this method will work
  void onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) async {}

  //IOS
  void onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {}

  //Android channel
  AndroidNotificationChannel androidNotificationChannel =
      const AndroidNotificationChannel(
    "Todo_channel",
    "Todo app",
    importance: Importance.high,
    description: "Notification will push when task time came",
  );

  DarwinNotificationDetails darwinNotificationDetails =
      const DarwinNotificationDetails();

  void scheduleNotification({
    required TodoModel todoModel,
    required String categoryName,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      todoModel.id,
      categoryName,
      todoModel.title,
      tz.TZDateTime.from(
        todoModel.dateTime,
        tz.local,
      ),
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidNotificationChannel.id,
          androidNotificationChannel.name,
          channelDescription: 'To remind about came todo',
          playSound: true,
          showProgress: true,
          styleInformation: const BigTextStyleInformation(''),
        ),
      ),
      payload: "",
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  void cancelAllNotifications() {
    flutterLocalNotificationsPlugin.cancelAll();
  }

  void cancelNotificationById(int id) {
    flutterLocalNotificationsPlugin.cancel(id);
  }
}
