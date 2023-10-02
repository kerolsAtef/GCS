

import 'package:gcs_new/search_on_operation/tender_kind_model.dart';

import '../home_module/tender_model.dart';
import '../networkApi/tender.dart';
import '../utilies/cash_data.dart';
import 'entity_model.dart';

class SearchPageController
{
  dynamic GetAllTendersKind()async
  {
    final data =await TenderApiCaller.GetAllTenderKinds(CashData.email,CashData.pass);
    for (var elemnet in data!)
      {
        CashData.kinds!.add(TenderKind.fromJson(elemnet));

      }

    print(" lenght of kinds is ${CashData.kinds!.length}");
  }

  dynamic GetAllEntities()async
  {
    final data =await TenderApiCaller.GetAllEntities(CashData.email,CashData.pass);
    for (var element in data!)
    {
      CashData.entities!.add(Entity.fromJson(element));
    }
    print(" lenght of entities is ${CashData.entities!.length}");
  }

  dynamic Filter(selectedEntityId,startDate,endDate,selectedTenderKind)async
  {
    final data =await TenderApiCaller.filter(CashData.email,CashData.pass,selectedEntityId,startDate,endDate,selectedTenderKind);
    Tenders t=Tenders.fromJson(data);
    CashData.searchedTenders=t.tenders;
  }


}