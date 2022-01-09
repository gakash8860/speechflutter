import 'dart:convert';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:speechflutter/utils.dart';
import 'package:speechflutter/widget/substring_highlighted.dart';

import 'Models/pin.dart';
import 'api/speech_api.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String she = " on";
  String he = " off";
  String text = 'Press the button and start speaking';
  bool isListening = false;
  bool change = true;
  PinStatus? status;
  PinName? name;

  bool val2 = true;

  List nameDataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStatus();
    getName();
  }



  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("MyApp.title"),
          centerTitle: true,
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.content_copy),
                onPressed: () async {
                  await FlutterClipboard.copy(text);

                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('✓   Copied to Clipboard')),
                  );
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(30).copyWith(bottom: 150),
          child: Column(
            children: [
              SubstringHighlight(
                text: text,
                terms: Command.all,
                textStyle: TextStyle(
                  fontSize: 32.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                textStyleHighlight: TextStyle(
                  fontSize: 32.0,
                  color: Colors.red,
                  fontWeight: FontWeight.w400,
                ),
              ),

              Container(
                // color: Colors.yellow,
                height: MediaQuery.of(context).size.height * 1.32,
                // color: Colors.amber,
                child: GridView.count(
                    crossAxisSpacing: 8,
                    childAspectRatio: 2 / 1.8,
                    mainAxisSpacing: 4,
                    physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    crossAxisCount: 2,
                    children:
                    List.generate(9, (index) {


                      return Container(
                        // color: Colors.green,
                        height: 2030,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                    alignment: const FractionalOffset(1.0, 0.0),
                                    // alignment: Alignment.bottomRight,
                                    height: 120,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 1, vertical: 10),
                                    margin: index % 2 == 0
                                        ? const EdgeInsets.fromLTRB(
                                        15, 7.5, 7.5, 7.5)
                                        : const EdgeInsets.fromLTRB(
                                        7.5, 7.5, 15, 7.5),
                                    // margin: EdgeInsets.fromLTRB(15, 7.5, 7.5, 7.5),
                                    decoration: BoxDecoration(
                                        boxShadow: const <BoxShadow>[
                                          BoxShadow(
                                              blurRadius: 10,
                                              offset: Offset(8, 10),
                                              color: Colors.black)
                                        ],
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 1,
                                            style: BorderStyle.solid,
                                            color: const Color(0xffa3a3a3)),
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Column(
                                      // crossAxisAlignment:
                                      // CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextButton(
                                                child: Text(
                                                  // '$index',
                                                  '${nameDataList[index].toString()} ',
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                onPressed: () async {

                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 4.5,
                                                // vertical: 10
                                              ),
                                              child: Switch(
                                                value:
                                                responseGetData[index]==1?true:false,

                                                //boolean value
                                                onChanged: (val) async {

                                                  }
                                                ,
                                              ),
                                            ),
                                          ],
                                        ),
                                        // GestureDetector(
                                        //     onTap: () {
                                        //
                                        //     },
                                        //     child:
                                        //     Icon(Icons.add))
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
              ),



            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: isListening,
          endRadius: 75,
          glowColor: Theme.of(context).primaryColor,
          child: FloatingActionButton(
            child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
            onPressed: toggleRecording,
          ),
        ),
      );
String ob = "";
int index = 0;

Future checkListen(isListening)async{
  setState(() => this.isListening = isListening);
  if (!isListening) {
    Future.delayed(Duration(seconds: 1), () {
      Utils.scanText(text);
    });
  }
}

  Future toggleRecording() async{
    SpeechApi.toggleRecording(
      onResult: (text) => setState(() => this.text = text),
      onListening: (isListening) async {
        setState(() => this.isListening = isListening);

        if (!isListening) {
          Future.delayed(Duration(seconds: 1), () {
            Utils.scanText(text);
          });
        }

          for(int i=0;i<nameDataList.length;i++){
            print("1111object1245 ${nameDataList[i]}");
            if(text.contains(nameDataList[i]) && text.contains("on")){
               ob = nameDataList[i];
              index = i;
              print("object1245 $ob");
              setState(() {
                change = true;
              });
               if(text.contains("on")){
                 if(responseGetData[index] == 0){
                   print("00po $index");
                   setState(() {
                     responseGetData[index] = 1;
                   });
                    dataUpdateForPin19();
                    // getStatus();
                 }
               }
               if(text.contains("off")){
                 if(responseGetData[index] == 1){
                   print("00po $index");
                   setState(() {
                     responseGetData[index] = 0;
                   });
                    dataUpdateForPin19();
                    // getStatus();
                 }
               }

               break;
            }
            if(text.contains("off") && text.contains(nameDataList[i])){
              print("pppppppp");
              setState(() {
                change = false;
                ob = nameDataList[i];

              });
              index = i;
              print("object1245 $ob");
              setState(() {
                change = true;
              });
              if(text.contains("on")){
                if(responseGetData[index] == 0){
                  print("00po $index");
                  setState(() {
                    responseGetData[index] = 1;
                  });
                   dataUpdateForPin19();
                   // getStatus();
                }
              }
              if(text.contains("off")){
                if(responseGetData[index] == 1){
                  print("00po $index");
                  setState(() {
                    responseGetData[index] = 0;
                  });
                   dataUpdateForPin19();
                   // getStatus();
                }
              }

              break;
            }


          }

          if(text.contains("Off All Devices") || text.contains("off all devices")){
            int i=0;
            while(i<responseGetData.length){
              print('goooo');
              if(responseGetData[i] == 1 && responseGetData[i] == 0){
                setState(() {
                  responseGetData[i] = 0;
                });
              }
              i++;
            }
          }
          // for(int i=0;i<nameDataList.length;i++){
          //   if(ob == nameDataList[i]){
          //       index = i;
          //       print("POPO $ob");
          //       if(text.contains("on")){
          //         if(responseGetData[index] == 0){
          //           print("00po $index");
          //           setState(() {
          //             responseGetData[index] = 1;
          //           });
          //           await dataUpdateForPin19();
          //           await getStatus();
          //         }
          //       }
          //       if(text.contains("off")){
          //         if(responseGetData[index] == 1){
          //           print("00po $index");
          //           setState(() {
          //             responseGetData[index] = 0;
          //           });
          //           await dataUpdateForPin19();
          //           await getStatus();
          //         }
          //       }
          //
          //       break;
          //   }
          //
          // }




      },
    );
    // check();
  }


  List<PinStatus> a =[];
  List responseGetData = [];
  Future getStatus()async{
    final url = "http://genorion1.herokuapp.com/getpostdevicePinStatus/?d_id=DIDM12932021AAAAAA";
    String token = "16661fcd5d214e43471bc304899f41c2ec2b811c";
    final response =  await http.get(Uri.parse(url),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Token $token',
    });
    if(response.statusCode == 200){
      print(response.body);
      status = PinStatus.fromJson(jsonDecode(response.body));
      setState(() {
        responseGetData = [
          status!.pin1Status,
          status!.pin2Status,
          status!.pin3Status,
          status!.pin4Status,
          status!.pin5Status,
          status!.pin6Status,
          status!.pin7Status,
          status!.pin8Status,
          status!.pin9Status,
        ];
      });
    }
  }

  dataUpdateForPin19() async {
    final url = "http://genorion1.herokuapp.com/getpostdevicePinStatus/?d_id=DIDM12932021AAAAAA";
    String token = "16661fcd5d214e43471bc304899f41c2ec2b811c";
    var data = {
      'put': 'yes',
      "d_id": "DIDM12932021AAAAAA",
      'pin1Status': responseGetData[0],
      'pin2Status': responseGetData[1],
      'pin3Status': responseGetData[2],
      'pin4Status': responseGetData[3],
      'pin5Status': responseGetData[4],
      'pin6Status': responseGetData[5],
      'pin7Status': responseGetData[6],
      'pin8Status': responseGetData[7],
      'pin9Status': responseGetData[8],
      // 'pin10Status': responseGetData[9],
      // 'pin11Status': responseGetData[10],
      // 'pin12Status': responseGetData[11],

    };
    final response =
    await http.post(Uri.parse(url), body: jsonEncode(data), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Token $token',
    });
    if (response.statusCode >0) {
      print("Data Updated  ${response.body}");
      print("Data Updated  ${response.statusCode}");

     await getStatus();
      //jsonDecode only for get method
      //return place_type.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
      throw Exception('Failed to Update data');
    }
  }
  Future getName()async{
    final url = "http://genorion1.herokuapp.com/editpinnames/?d_id=DIDM12932021AAAAAA";
    String token = "16661fcd5d214e43471bc304899f41c2ec2b811c";
    final response =  await http.get(Uri.parse(url),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Token $token',
    });
    if(response.statusCode == 200){
      print(response.body);

      name = PinName.fromJson(jsonDecode(response.body));
      setState(() {
        nameDataList =[
        name!.pin1Name,
        name!.pin2Name,
        name!.pin3Name,
        name!.pin4Name,
        name!.pin5Name,
        name!.pin6Name,
        name!.pin7Name,
        name!.pin8Name,
        name!.pin9Name,

        ];
      });
      print(nameDataList);
    }
  }
}
