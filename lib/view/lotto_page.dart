import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lotto/controller/lotto_controller.dart';

class LottoPage extends StatelessWidget {
  LottoPage({Key? key}) : super(key: key);

  final lottoController = Get.put(LottoController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로또')
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: GetX<LottoController>(
              builder: (lottoController) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: Text('${lottoController.lottoItems[0]}',style:TextStyle(fontSize: 100),textAlign: TextAlign.center),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: Text('${lottoController.lottoItems[1]}',style:TextStyle(fontSize: 100),textAlign: TextAlign.center),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: Text('${lottoController.lottoItems[2]}',style:TextStyle(fontSize: 100),textAlign: TextAlign.center),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: Text('${lottoController.lottoItems[3]}',style:TextStyle(fontSize: 100),textAlign: TextAlign.center),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: Text('${lottoController.lottoItems[4]}',style:TextStyle(fontSize: 100),textAlign: TextAlign.center),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1)
                            ),
                            child: Text('${lottoController.lottoItems[5]}',style:TextStyle(fontSize: 100),textAlign: TextAlign.center),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: (){
                              lottoController.getNumber();
                            },
                            child: Icon(Icons.question_mark_rounded),
                        ),
                        SizedBox(width: 10,),
                        ElevatedButton(
                          onPressed: (){
                            lottoController.boxClear();
                          },
                          child: Icon(Icons.refresh),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Form(
                      key: lottoController.formKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('직접입력:'),
                          SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              key: ValueKey(1),
                              keyboardType: TextInputType.number,
                              validator: (value){
                                return lottoController.validator(value!);
                              },
                              onSaved: (value){
                                lottoController.selectedNum = value;
                              },
                            ),
                          ),
                          SizedBox(width:20),
                          ElevatedButton(
                              onPressed: (){
                                lottoController.trySubmit();
                              },
                              child: Text('선택')
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                        '숫자와 ,만 사용해주세요.(1~45 입력하면 더 좋고)',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                );
              }
            ),
          ),
        ),
      )
    );
  }
}
