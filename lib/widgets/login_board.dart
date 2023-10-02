import 'package:gcs_new/login/login_controller.dart';
import 'package:gcs_new/utilies/Colors.dart';
import 'package:gcs_new/home_module/home_view.dart';
import 'package:gcs_new/utilies/cash_data.dart';
import 'package:gcs_new/widgets/remember_me_and_forget_pass_row.dart';
import 'package:gcs_new/widgets/text_field.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../home_module/home_controller.dart';
import '../login/person_model.dart';
import '../networkApi/login_and_auth.dart';
import '../utilies/Strings.dart';
import '../utilies/alert_dialogs.dart';
import 'custome_button.dart';

class LoginBoard extends StatelessWidget {
   LoginBoard({super.key});

  final controller=Get.put(LoginController());
  final homeCon=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    TextEditingController mailController=new TextEditingController();
    TextEditingController passController=new TextEditingController();

    return  Card(
        color: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
          width: 80.w,
          height: 60.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 6.h,),
              Text(loginText,style: GoogleFonts.cairo(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: mainColor,
              ),),
              SizedBox(height: 2.h,),
              TextFieldCustomization(icon: Icon(Icons.email_outlined),controller: mailController,hint: EmailString,isObscure: false),
              SizedBox(height: 2.h,),
              TextFieldCustomization(icon: Icon(Icons.key),controller: passController,hint: passString,isObscure: true),
              SizedBox(height: 2.h,),
              RememberMeAndForgetPassword(),
              SizedBox(height: 5.h,),
              Button(text: loginText,fun: ()async{
                if(controller.ValidateMailAndPass(mailController.text.toString(),passController.text.toString()))
                  {
                    showLoadingDialog(context);
                    dynamic response =await UserApiCaller.login(mailController.text.toString(),passController.text.toString());
                   if(response["Id"]!=null)
                      {
                        Person p=Person.fromJson(response);
                        CashData.person=p;
                        CashData.email=mailController.text.toString();
                        CashData.pass=passController.text.toString();
                        await homeCon.GetAllTenders();
                        Navigator.of(context).pop();

                        Get.offAll(()=>HomeView());
                      }
                   else
                     {
                       Get.snackbar("خطأ", "تأكد من صحة الرقم السري و البريد الألكتروني");
                       Navigator.of(context).pop();
                     }

                  }
                else
                  {
                    Get.snackbar("خطأ", "تأكد من صحة البريد الألكتروني , يجب أن يحتوي الرقم السري علي 6 حروف أو أكثر ",);
                    Navigator.of(context).pop();
                  }
              },)
            ],
          ),
          ),

    );
  }
}


