

import 'package:gcs_new/login/person_model.dart';
import 'package:gcs_new/search_on_operation/entity_model.dart';
import 'package:gcs_new/search_on_operation/tender_kind_model.dart';

import '../home_module/tender_model.dart';
import '../notifications/notification_model.dart';

class CashData
{
  static Person? person=null;
  static String? email=null;
  static String? pass=null;
  static List<Tender>? tenders=[];
  static List<Tender>? sharedTenders=[];
  static List<Tender>? searchedTenders=[];
  static List<TenderKind>? kinds=[];
  static List<Entity>? entities=[];
  static int ? itemCount=null;
  static List<Notification>notificationsList=[];
}