import 'package:flutter/material.dart';
import 'package:gcs_new/home_module/home_view.dart';
import 'package:gcs_new/notifications/notification_controller.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../notifications/notifications_view.dart';
import '../search_on_operation/search_view.dart';
import '../search_on_operation/serach_controller.dart';
import '../utilies/alert_dialogs.dart';
class CustomeBottomNavBar extends StatelessWidget {
   CustomeBottomNavBar({
     required this.selectedIndex,
    super.key,
  });

   SearchPageController con=Get.put(SearchPageController());
   NotificationController NotifCon=Get.put(NotificationController());
   int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 1.w,
            activeColor: Colors.black,
            iconSize: 5.w,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black54,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'الرئيسية',
              ),
              GButton(
                icon: Icons.search,
                text: 'بحث',
              ),
              GButton(
                icon: Icons.notifications,
                text: 'أشعارات',
              ),
            ],
            selectedIndex: selectedIndex,
            onTabChange: (index) async{
              switch(index)
                  {
                case 0:
                  Get.off(()=>HomeView());
                  break;
                case 1:
                  showLoadingDialog(context);
                  await con.GetAllEntities();
                  await con.GetAllTendersKind();
                  Navigator.of(context).pop();
                  Get.to(()=>SearchOnOperation());
                  break;
                case 2:
                  showLoadingDialog(context);
                  await NotifCon.GetAllNotifications();
                  Navigator.of(context).pop();
                  Get.to(()=>NotificationView());
                  break;
              }
            },
          ),
        ));
  }
}