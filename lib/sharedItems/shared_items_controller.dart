

import '../home_module/tender_model.dart';
import '../networkApi/tender.dart';
import '../utilies/cash_data.dart';

class SharedController
{
  dynamic GetAllSharedTenders()async
  {
    dynamic response =await TenderApiCaller.GetAllPart(CashData.email,CashData.pass);
    Tenders t=Tenders.fromJson(response);
    CashData.sharedTenders=t.tenders;
  }

  DateTime ToDate(String dateText)
  {

    int timestamp = int.parse(dateText.substring(7, dateText.length - 2));

    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);

    return date;
  }
}