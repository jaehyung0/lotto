import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LottoController extends GetxController {
  var lottoItems = <dynamic>[0,0,0,0,0,0].obs;

  String? selectedNum;

  final formKey = GlobalKey<FormState>();
  List<dynamic> list = [];

  @override
  void onInit() {
    super.onInit();
  }

  void getNumber() {
    lottoItems.clear();
    while(lottoItems.length!=6){
      int num = Random().nextInt(45)+1;
      if(!lottoItems.contains(num)){
        lottoItems.add(num);
        print(lottoItems);
      }
      lottoItems.sort();
    }
  }

  void boxClear(){
    lottoItems.clear();
    lottoItems = <int>[0,0,0,0,0,0].obs;
  }

  String validator(String value){
    print('gg');
    if(value.contains('.')){
      return '0,0,0,0,0,0';
    }else{
      return value;
    }
  }

  void trySubmit() {
    final isValid = formKey.currentState!.validate();
    Get.focusScope!.unfocus();

    if (isValid) {
      formKey.currentState!.save();
      if(selectedNum == ''){
        list = [0,0,0,0,0,0];
      }else{
        lottoItems.clear();
        list = selectedNum!.split(',');
        for(int i=0; i<list.length; i++){
          lottoItems.add(int.parse(list[i]));
        }
        while(lottoItems.length!=6){
          int num = Random().nextInt(45)+1;
          if(!lottoItems.contains(num)){
            lottoItems.add(num);
          }
        }
        lottoItems.sort();
      }

    }
  }
}