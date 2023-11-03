import 'dart:convert';
import 'dart:developer';

import 'package:carpooling/models/demands.dart';
import 'package:carpooling/models/user.dart';
import 'package:carpooling/network_utils/api.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';



class ConfirmCarpooling extends StatefulWidget {
  const ConfirmCarpooling({Key? key}) : super(key: key);

  @override
  State<ConfirmCarpooling> createState() => _ConfirmCarpoolingState();
}

class _ConfirmCarpoolingState extends State<ConfirmCarpooling> {

  int passengerCount = 1;
  Map carpoolingData = {};
  TextEditingController msgController = TextEditingController(text: "Exemple : Bonjour, ça ne te dérangerait pas si j'emmène mon chien à bord ?");
  int availablePlaces = 0;
  List confirmedDemands = [];


  @override
  Widget build(BuildContext context) {
    carpoolingData = carpoolingData.isNotEmpty
        ? carpoolingData
        : ModalRoute.of(context)?.settings.arguments as Map;

    confirmedDemands = Demands().getConfirmedDemands(carpoolingData['id']);
    availablePlaces = carpoolingData['passengersNBR'] - confirmedDemands.length;
    return Scaffold(
      // ------------------------ The AppBar Section ------------------------ //
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () { Navigator.pop(context); },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFF3F9F9),
        elevation: 0,
      ),
      // ------------------------ ****************** ------------------------ //
      // ---------------------- ConfirmCarpooling body ---------------------- //
      body: Container(
        color: const Color(0xFFF3F9F9),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ################## Page title ################## //
              const Text(
                'Confimation de ton covoiturage',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'NunitoBold',
                    fontSize: 26.0,
                    fontWeight: FontWeight.w900
                ),
              ),
              // ########## NBR of person confirmation ########## //
              Container(
                padding: const EdgeInsets.all(15),
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ----------> Container title
                    const Text(
                      'Nombre des passagers',
                      style: TextStyle(
                        fontFamily: 'NunitoBold',
                        fontSize: 20.0,
                      ),
                    ),
                    // ----------> Passenger nbr counter
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '0$passengerCount',
                              style: const TextStyle(
                                fontFamily: 'NunitoRegular',
                                fontSize: 150,
                                color: Color(0xFF01AE90)
                              ),
                            ),
                            const Text(
                              'PASSAGER(S)',
                              style: TextStyle(
                                fontFamily: 'NunitoBold',
                                fontSize: 16,
                                color: Colors.black38
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: const Color(0xFFFEC956)
                                )
                              ),
                              child: IconButton(
                                onPressed: (){
                                  if(passengerCount < availablePlaces){
                                    setState(() {
                                      passengerCount++;
                                    });
                                  }
                                },
                                icon: const Icon(
                                  Icons.plus_one,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2,
                                      color: const Color(0xFFFEC956)
                                  )
                              ),
                              child: IconButton(
                                onPressed: (){
                                  if(passengerCount > 1){
                                    setState(() {
                                      passengerCount--;
                                    });
                                  }
                                },
                                icon: const Icon(
                                  Icons.exposure_minus_1,
                                  color: Colors.black38,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // ########## ###### Total price ####### ########## //
              Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                padding: const EdgeInsets.all(15),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Prix total : ',
                      style: TextStyle(
                        fontFamily: 'NunitoMedium',
                        fontSize: 18,
                        letterSpacing: 1.5,
                        color: Colors.black38
                      ),
                    ),
                    Text(
                      "${carpoolingData['price'] * passengerCount} DTN",
                      style: const TextStyle(
                        fontFamily: 'NunitoBold',
                        fontSize: 24,
                        color: Colors.black87
                      ),
                    )
                  ],
                ),
              ),
              // ###########  Send eMessage container ########### //
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Laisser un message au conducteur',
                      style: TextStyle(
                        fontFamily: 'NunitoBold',
                        fontSize: 24,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Optionnel !',
                      style: TextStyle(
                        fontFamily: 'NunitoMedium',
                        fontSize: 18,
                        color: Colors.black38
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200],
                      ),
                      child: TextFormField(
                        controller: msgController,
                        maxLines: 10,
                        minLines: 3,
                        decoration: const InputDecoration(border: InputBorder.none),
                        style: const TextStyle(
                          fontFamily: 'NunitoBold',
                          letterSpacing: 1.5,
                          color: Colors.black38
                        ),
                      ),
                    )
                  ],
                ),
              )
              // ########## ########################## ########## //
            ],
          ),
        ),
      ),
      // ------------------------ ****************** ------------------------ //
      // ---------------------- The BTM_NavBar Section ---------------------- //
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Color(0xFFF3F9F9),
          border: Border(
              bottom: BorderSide.none,
              left: BorderSide.none,
              right: BorderSide.none,
              top: BorderSide(
                  color: Colors.black26,
                  style: BorderStyle.solid,
                  width: 1
              )
          ),
        ),
        // ##### Row : the main row child of the btm menu
        child: TextButton(
          onPressed: () {
            log('Log from ConfirmationInterface : Saving data in progress ... \n');
            saveDemand();
          },
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
                color: const Color(0xFF01AE90),
                borderRadius: BorderRadius.circular(25)
            ),
            child: const Center(
              child: Text(
                "Confirmer",
                style: TextStyle(
                    fontFamily: 'NunitoBold',
                    fontSize: 20,
                    color: Colors.white
                ),
              ),
            ),
          ),
        ),
        // ##### ########################################
      ),
      // ------------------------ ****************** ------------------------ //
    );
  }



  void saveDemand() async {
    var data = {
      'carpooling_id': carpoolingData['id'],
      'driver_id': carpoolingData['userId'],
      'passenger_ondemand': User.id,
      'places_ondemand': passengerCount,
      'total_price': (carpoolingData['price'] * passengerCount),
      'passenger_msg': msgController.text.toString()
    };
    var res = await Network().saveData(data, '/travelDemand');
    var body = json.decode(res.body);
    if(body['success']){
      _displayInfoDialog();
    }
    log('Body from the confirmationInterface.dart : $body');
  }


  void _displayInfoDialog(){
    Dialogs.materialDialog(
        context: context,
        title: "Info",
        msg: "Votre demande est bien enregistrée.",
        actions: [
          TextButton(
            onPressed: (){
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xFF01AE90))
            ),
            child: const Text(
              'OK!',
              style: TextStyle(
                  fontFamily: 'NunitoBold',
                  color: Colors.black54
              ),
            ),
          )
        ]
    );
  }


}
