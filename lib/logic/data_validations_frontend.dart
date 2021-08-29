import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskaty/providers/data_validation_provider.dart';

class Data_Validations_Front {

  static bool checkEmpty(bool name,bool email, bool pass, BuildContext cntxt){
    if (name ||
        email ||
        pass)
    {
      if (name)
      {
        Provider.of<Data_Validation_Provider>(
            cntxt,
            listen: false)
            .onNameEmpty();
    }
    else
    {
    Provider.of<Data_Validation_Provider>(
    cntxt,
    listen: false)
        .onNameNoEmpty();
    }
    if (email)
    {
    Provider.of<Data_Validation_Provider>(
    cntxt,
    listen: false)
        .onEmailEmpty();
    }
    else
    {
    Provider.of<Data_Validation_Provider>(
    cntxt,
    listen: false)
        .onEmailNotEmpty();
    }
    if (pass)
    {
    Provider.of<Data_Validation_Provider>(
    cntxt,
    listen: false)
        .onPasswordEmpty();
    }
    else
    {
    Provider.of<Data_Validation_Provider>(
    cntxt,
    listen: false)
        .onPasswordNotEmpty();
    }
    return false;
    }else{
    Provider.of<Data_Validation_Provider>(
    cntxt,
    listen: false)
        .onNameNoEmpty();
    Provider.of<Data_Validation_Provider>(
    cntxt,
    listen: false)
        .onEmailNotEmpty();
    Provider.of<Data_Validation_Provider>(
    cntxt,
    listen: false)
        .onPasswordNotEmpty();
    return true;
    }
  }

  //////////////////////////////////////

  static bool checkValidity(String name,String email, String pass, BuildContext cntxt){
    if(!email.contains("@")){
      Provider.of<Data_Validation_Provider>(
          cntxt,
          listen: false).onEmailNotValid();

      return false;
    }else{
      Provider.of<Data_Validation_Provider>(
          cntxt,
          listen: false).onEmailValid();
      return true;
    }

  }

}