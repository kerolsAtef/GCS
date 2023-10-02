import 'package:gcs_new/home_module/tender_model.dart';
import 'package:gcs_new/utilies/cash_data.dart';
import 'package:get/get.dart';
import '../networkApi/tender.dart';

class HomeController extends GetxController
{
  var isDrawerOpen = false;

  void toggleDrawer() {
    isDrawerOpen = !isDrawerOpen;
    update();
  }

  dynamic GetAllTenders()async
  {
    dynamic response =await TenderApiCaller.GetAll(CashData.email,CashData.pass);
    Tenders t=Tenders.fromJson(response);
    CashData.tenders=t.tenders;
    CashData.itemCount=t.totalCount;
  }

  DateTime ToDate(String dateText)
  {

    int timestamp = int.parse(dateText.substring(7, dateText.length - 2));

    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);

    return date;
  }
}