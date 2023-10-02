import 'package:gcs_new/home_module/home_controller.dart';
import 'package:gcs_new/login/login_view.dart';
import 'package:gcs_new/sharedItems/shared_items_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../about_module/about_view.dart';
import '../personal_information/personal_info_view.dart';
import '../search_on_operation/search_view.dart';
import '../search_on_operation/serach_controller.dart';
import '../sharedItems/shared_item_view.dart';
import '../utilies/Colors.dart';
import '../utilies/Strings.dart';
import '../utilies/alert_dialogs.dart';
import 'home_drawer_item.dart';


class HomeDrawer extends StatelessWidget {
   HomeDrawer({
    super.key,
  });

   SearchPageController con=Get.put(SearchPageController());
   SharedController Sharedcon=Get.put(SharedController());

  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            color: mainColor,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerItem(text: SearchOnOpeartionText,fun: ()async {
                  showLoadingDialog(context);
                 await con.GetAllEntities();
                  await con.GetAllTendersKind();
                  Navigator.of(context).pop();
                  Get.to(()=>SearchOnOperation());
                },),
                DrawerItem(text: ShareMenu,fun: ()async{
                  showLoadingDialog(context);
                  await Sharedcon.GetAllSharedTenders();
                  Navigator.of(context).pop();
                  Get.to(()=>SharedItemsView());
                },),
                DrawerItem(text: PersonalInfo,fun: (){
                  Get.to(()=>PersonalInfoView());
                },),
                DrawerItem(text: AboutUs,fun: (){
                  Get.to(()=>AboutScreen());
                },),
                DrawerItem(text: LogOut,fun: (){
                  Get.offAll(()=>LoginView());
                },),
                SizedBox(height: 20.h,),
                Column(
                  children: [
                    Image.asset("assets/images/logo.png",width: 20.w,height: 7.h,),
                    Text(OrganizationName,style: GoogleFonts.cairo(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                    ),)
                  ],
                ),
              ],
            ),
          ),
        ),
      );}


  }
