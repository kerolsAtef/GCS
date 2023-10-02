import 'package:flutter/material.dart';
import 'package:gcs_new/sharedItems/shared_items_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../utilies/Strings.dart';
import '../utilies/cash_data.dart';
import '../widgets/HomeListItem.dart';
import '../widgets/login_custom_app_bar.dart';
import 'package:get/get.dart';

class SearchResultView extends StatelessWidget {
  SearchResultView({super.key});

   SharedController con=Get.put(SharedController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(
          children: [
          Positioned(
              top: 0,
              left: 0,
              child: LoginCustomeAppBar(text: SearchOnOpeartionText)),
            Positioned(
                top: 10.h,
                left: 10.w,
                right: 10.w,
                child: CashData.searchedTenders==null || CashData.searchedTenders!.isEmpty? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h,),
                    Image.asset("assets/images/no_data.jpg",width: 50.w,height: 20.h,),
                    Text("لا توجد بيانات لعرضها", style: GoogleFonts.cairo(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepPurple
                    ),),
                  ],
                ):
                Container(
                    width: 80.w,
                    height: 90.h,
                    alignment: Alignment.center,
                    child: ListView.builder(
                      itemCount: CashData.searchedTenders!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 10,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 2.h),
                            width: 80.w,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ListItem(
                                  header: "رقم العملية",
                                  data: CashData.searchedTenders![index].etenderRefno,
                                ),
                                ListItem(
                                  header: "طبيعة المالية",
                                  data: CashData.searchedTenders![index].etenderTitle,
                                ),
                                ListItem(
                                  header: "الجهة",
                                  data: CashData.searchedTenders![index].blsRequestingBodyName,
                                ),
                                ListItem(
                                  header: "تاريخ فتح المظاريف",
                                  data: con.ToDate(CashData.searchedTenders![index].etenderTenderDateValue).toString(),
                                ),
                                ListItem(
                                  header: "تاريخ الترسية",
                                  data:  con.ToDate(CashData.searchedTenders![index].etenderAwardingDateValue).toString(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )))
          ]
    )));
  }
}
