import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Pour ce qui est de la notification, j'ai essayé de faire en sorte de recevoir une notification non pas à l'envoi de la tâche
// Mais de le recevoir une heure avant le startTime de la tâche, j'ai essayé d'importer DZDaytime à mon projet
// Pour cibler l'heure du projet en local par rapport à l'appareil de l'utilisateur, avec une méthode schedule() qui prévois l'envoie 
// 1 heure avant grâce à la concaténation de variable avec le widget Duration(1 hour)
// Malgrès le fait que je n'avais pas d'erreur IDE, mon environement de test ne m'envoyer pas la notification
// Je suis donc passé à autre chose, par faute de temps, étant encore débutant à Flutter.
// Pour information , j'ai travaillé essentielement sur environement de test IOS (iphone 15) , 
// Mais j'ai notion de comment importer les autres Settings comme MacOs, etc...

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =FlutterLocalNotificationsPlugin();


  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid = 

    const AndroidInitializationSettings('flutter_logo');

    var initializationSettingsIOS = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
    onDidReceiveLocalNotification: (int id , String? title,String? body,String? payload) async {
      
    });
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,);
      await notificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse:(NotificationResponse notificationResponse) async{}
    );
  }
  notificationDetails(){
    return const NotificationDetails(
      android: AndroidNotificationDetails('channelId', 'channelName', importance: Importance.max),
      iOS: DarwinNotificationDetails()

    );
  }

  Future showNotification({int id = 0,  startTime, String? title, String? body, String? payload}) async{
    return notificationsPlugin.show(
      id, title, body, await notificationDetails()
    );
  }
}