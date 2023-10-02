

import 'package:gcs_new/notifications/notification_model.dart';

import '../networkApi/tender.dart';
import '../utilies/cash_data.dart';

class NotificationController
{
  dynamic GetAllNotifications()async
  {
    final data =await TenderApiCaller.GetNotifications(CashData.email);
    for (var elemnet in data!)
    {
      CashData.notificationsList!.add(Notification.fromJson(elemnet));

    }

    print(" lenght of notifications is ${CashData.notificationsList!.length}");
  }

}