
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ViewUtil{
  void showToasts(String msg) {

    Fluttertoast.showToast(msg: msg,fontSize: 12,backgroundColor: Colors.black,textColor: Colors.white);

  }
}