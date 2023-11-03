// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:carpooling/mainApp/road/attachedInterfaces/calander_interface.dart';
import 'package:carpooling/mainApp/road/attachedInterfaces/mycar_interface.dart';
import 'package:carpooling/mainApp/road/attachedInterfaces/otherdata_interface.dart';
import 'package:carpooling/mainApp/road/attachedInterfaces/psngrnbr_interface.dart';
import 'package:carpooling/mainApp/road/attachedInterfaces/regisnbr_interface.dart';
import 'package:carpooling/mainApp/road/attachedInterfaces/station1_interface.dart';
import 'package:carpooling/mainApp/road/attachedInterfaces/times_interface.dart';
import 'package:carpooling/mainApp/road/road_data.dart';
import 'package:carpooling/models/user.dart';
import 'package:carpooling/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import '../../network_utils/api.dart';
import 'attachedInterfaces/station2_interfce.dart';



class RoadMain extends StatefulWidget {
  const RoadMain({Key? key}) : super(key: key);

  @override
  State<RoadMain> createState() => _RoadMainState();
}

class _RoadMainState extends State<RoadMain> {
  List<Map<String, dynamic>> weights = [{'value': 'heavy', 'label': 'Lourd'}, {'value': 'light', 'label': 'Léger'}, {'value': 'nan', 'label': 'Civilizer'}];

  var index = 0;
  RoadDataCollector roadData = RoadDataCollector();
  List roadInrefacesList = [
    const StartStationSetter(),
    const ArrivalStationSetter(),
    const PassengersNBRSetter(),
    const TripTimesSetter(),
    const TripDateSetter(),
    const MyCarSetter(),
    const RegistrationNumberSetter(),
    const OtherData(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ------------------------ The AppBar Section ------------------------ //
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF3F9F9),
        elevation: 0,
        actions: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'X',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'NunitoMedium',
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                )
              )
            ],
          )
        ],
      ),
      // ------------------------ ****************** ------------------------ //
      // ---------------------- Main Container Section ---------------------- //
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: roadInrefacesList[index]
          ),
          Expanded(
            flex: 2,
            child: Container(
              // color: Colors.red,
              color: const Color(0xFFF3F9F9),
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Prev interface's button
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: TextButton(
                      onPressed: () {
                        if(index > 0) {
                          setState(() {
                            index--;
                          });
                        }
                        else{}
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: index == 0 ? Styles.primaryColor.withOpacity(0.3) : Styles.primaryColor,
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10)
                      ),
                      child: const Text(
                        'Précédent',
                        style: TextStyle(
                          fontFamily: 'NunitoBold',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  // Next Interface's button
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        if(index < 7) {
                          setState(() {
                            index++;
                          });
                        }
                        else{
                          log("Log From the raodMain : All necessaries data for Road : ${RoadDataCollector.getRoadData()}");
                          if(RoadDataCollector.validateData().isNotEmpty){
                            Dialogs.materialDialog(
                              context: context,
                              title: 'Covoiturage non sauvegarder',
                              msg: 'Vérifier tous les champs et réssayer',
                              color: Colors.white,
                              actions: [
                                IconsOutlineButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  text: 'Annuler',
                                  iconData: Icons.cancel_outlined,
                                  textStyle: const TextStyle(color: Colors.white),
                                  iconColor: Colors.redAccent,
                                  color: const Color(0xFF01AE90),
                                ),
                              ]
                            );
                          }
                          else{
                            log("\n\n=>Log From the roadMain : All data is ok!");
                            // log('From RoadMain : ${RoadDataCollector.myParsedCar.runtimeType}');
                            saveCarpooling();
                          }
                        }
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Styles.primaryColor,
                          padding: const EdgeInsets.fromLTRB(20, 10, 25, 10)
                      ),
                      child: Text(
                        index == 7 ? 'Enregistrer' : 'Suivant',
                        style: const TextStyle(
                            fontFamily: 'NunitoBold',
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          )
        ],
      )
      // ------------------------ ****************** ------------------------ //
    );
  }
  // ######################################################################## //
  void saveCarpooling() async {
    var data = {
      'startingStation': RoadDataCollector.startingStation,
      'arrivalStation': RoadDataCollector.arrivalStation,
      'leavingTime': RoadDataCollector.leavingTime,
      'arrivalTime': RoadDataCollector.arrivalTime,
      'leavingDate': RoadDataCollector.leavingDate,
      'passengersNBR': RoadDataCollector.passengersNBR,
      'baggageType': RoadDataCollector.baggageType,
      'isDirectRoad': RoadDataCollector.isDirectRoad,
      'price': RoadDataCollector.price,
      'carData': RoadDataCollector.myParsedCar,
      'userId': User.id
    };
    var res = await Network().saveData(data, '/carpooling/add');
    var body = json.decode(res.body);
    log('Body from the roadMain.dart : $body');
    if(body['success'] == true){
      Dialogs.bottomMaterialDialog(
        context: context,
        title: 'Information',
        msg: 'Votre Covoiturage est bien sauvegardé!',
        actions: [
          IconsOutlineButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'Terminer',
            iconData: Icons.gpp_good_outlined,
            textStyle: const TextStyle(color: Colors.white),
            iconColor: Colors.yellow,
            color: const Color(0xFF01AE90),
          ),
        ]
      );
    }
    else{
      Dialogs.bottomMaterialDialog(
          context: context,
          title: 'Erreur',
          msg: 'Votre Covoiturage est non sauvegardé!',
          actions: [
            IconsOutlineButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: 'Annuler',
              iconData: Icons.cancel_outlined,
              textStyle: const TextStyle(color: Colors.white),
              iconColor: Colors.redAccent,
              color: const Color(0xFF01AE90),
            ),
          ]
      );
    }
  }
}








