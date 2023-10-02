import 'package:flutter/material.dart';
import 'package:gcs_new/utilies/Strings.dart';
import 'package:gcs_new/utilies/cash_data.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../dash_board/dash_board.dart';
import '../widgets/HomeListItem.dart';
import '../widgets/custom_button_nav_bar.dart';
import '../widgets/home_custom_app_bar.dart';
import '../widgets/home_drawer.dart';
import 'home_controller.dart';

class HomeView extends StatefulWidget {
   HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  DashBoard con=Get.put(DashBoard());


  @override
  Widget build(BuildContext context) {
    HomeController con=Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: CustomeBottomNavBar(selectedIndex: 0,),
        drawer: HomeDrawer(),
        body: Stack(
          children: [
            Positioned(
              child: HomeCustomAppBar(
                text: LateOprationsText,
                fun: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
              top: 0,
              left: 0,
            ),
            Positioned(
                top: 10.h,
                left: 10.w,
                right: 10.w,
                child: CashData.tenders==null? Column(
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
                      itemCount: CashData.tenders!.length,
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
                                  data: CashData.tenders![index].etenderRefno,
                                ),
                                ListItem(
                                  header: "طبيعة المالية",
                                  data: CashData.tenders![index].etenderTitle,
                                ),
                                ListItem(
                                  header: "الجهة",
                                  data: CashData.tenders![index].blsRequestingBodyName,
                                ),
                                ListItem(
                                  header: "تاريخ فتح المظاريف",
                                  data: con.ToDate(CashData.tenders![index].etenderTenderDateValue).toString(),
                                ),
                                ListItem(
                                  header: "تاريخ الترسية",
                                  data:  con.ToDate(CashData.tenders![index].etenderAwardingDateValue).toString(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )))
          ],
        ),
      ),
    );
  }
}


