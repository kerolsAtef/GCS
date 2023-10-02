import 'package:get/get.dart';

class LoginController extends GetxController
{
  bool _CheckBoxV=false;

  bool get CheckBoxV => _CheckBoxV;
  void ChangeCheckBoxValue(bool value)
  {
    _CheckBoxV=value;
    update();
  }

  bool ValidateMailAndPass(mail,pass)
  {
    final pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
    final regExp = RegExp(pattern);
    bool isMail=regExp.hasMatch(mail);
    if(!mail.isEmpty   &&
        !pass.isEmpty  &&
        pass.length>=6 &&
        isMail)
      return true;
    else
      return false;
  }

}