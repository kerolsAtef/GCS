import 'package:flutter/material.dart';
import 'package:gcs_new/home_module/home_view.dart';
import 'package:gcs_new/search_on_operation/search_results_view.dart';
import 'package:gcs_new/search_on_operation/serach_controller.dart';
import 'package:gcs_new/widgets/custome_button.dart';
import 'package:gcs_new/widgets/login_custom_app_bar.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';
import 'package:sizer/sizer.dart';
import '../dash_board/dash_board.dart';
import '../utilies/Strings.dart';
import '../utilies/alert_dialogs.dart';
import '../utilies/cash_data.dart';
import '../widgets/DateTimeSearchCustomTextField.dart';
import '../widgets/SearchCustomHeader.dart';
import '../widgets/custom_button_nav_bar.dart';
import 'package:get/get.dart';

class SearchOnOperation extends StatelessWidget {
   SearchOnOperation({super.key});
   TextEditingController fromCon=TextEditingController();
   TextEditingController toCon=TextEditingController();
   int? enitiyIndex;
   int? kindIndex;
   DashBoard con1=Get.put(DashBoard());

   SearchPageController con= Get.put(SearchPageController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      bottomNavigationBar: CustomeBottomNavBar(selectedIndex: 1,),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            LoginCustomeAppBar(text: SearchOnOpeartionText),
            SizedBox(height: 5.h,),
            SearchCustomHeader(text: SearchUsingLocation,),
            SizedBox(height: 2.h,),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Container(
                height: 8.h,
                child: SearchableDropdown<int>(
                  hintText: const Text(SelectLocation),
                  margin:  EdgeInsets.symmetric(horizontal: 3.w),
                  items: List.generate(
                      CashData.entities!.length,
                          (i) => SearchableDropdownMenuItem(
                          value: i, label: '${CashData.entities![i].text}', child: Text('${CashData.entities![i].text}'))),
                  onChanged: (int? value) {
                        enitiyIndex=value;
                  },
                ),
              ),
            ),
            SizedBox(height: 3.h,),
            SearchCustomHeader(text: SearchUsingDate,),
            SizedBox(height: 2.h,),
            DateTimeSearchCustomTextField(fieldIcon: Icon(Icons.calendar_month),hint: From,editController: fromCon,),
            SizedBox(height: 1.h,),
            DateTimeSearchCustomTextField(fieldIcon: Icon(Icons.calendar_month),hint: To,editController: toCon,),
            SizedBox(height:3.h),
            SearchCustomHeader(text: SeachByOperationType,),
            SizedBox(height: 2.h,),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Container(
                height: 8.h,
                child: SearchableDropdown<int>(
                  hintText: const Text(SelectLocation),
                  margin:  EdgeInsets.symmetric(horizontal: 3.w),
                  items: List.generate(
                      CashData.kinds!.length,
                          (i) => SearchableDropdownMenuItem(
                          value: i, label: '${CashData.kinds![i].text}', child: Text('${CashData.kinds![i].text}'))),
                  onChanged: (int? value) {
                      kindIndex=value;
                  },
                ),
              ),
            ),
            SizedBox(height: 5.h,),
            Button(fun: ()async{
              showLoadingDialog(context);
              CashData.searchedTenders=await con.Filter(CashData.entities![enitiyIndex!].value,fromCon.text.toString(),toCon.text.toString(),CashData.kinds![kindIndex!].value);
              Navigator.of(context).pop();
              Get.off(()=>SearchResultView());
            }, text: search),
            SizedBox(height: 2.h,),
          ],
        ),
      ),
    ));
  }
}




