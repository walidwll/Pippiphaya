import 'dart:developer';

import 'package:carpooling/mainApp/road/road_data.dart';
import 'package:flutter/material.dart';


class RegistrationNumberSetter extends StatefulWidget {
  const RegistrationNumberSetter({Key? key}) : super(key: key);

  @override
  State<RegistrationNumberSetter> createState() => _RegistrationNumberSetterState();
}

class _RegistrationNumberSetterState extends State<RegistrationNumberSetter> {

  var isWCar = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController registrationNBR_wnbr = TextEditingController(text: 'ن.ت 246072');
  TextEditingController registrationNBR_1nbr = TextEditingController(text: '236');
  TextEditingController registrationNBR_2nbr = TextEditingController(text: '4126');
  TextEditingController registrationNBR_cntr = TextEditingController(text:'تونس');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F9F9),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // -------------- Interface title -------------- //
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: const Text(
                  "Quelle est ta plaque d'immatriculation ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'NunitoBold',
                      fontSize: 26.0,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
              // ------------ Country name + flag ------------ //
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        'images/tunisia.png',
                        fit: BoxFit.cover,
                      )
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: const Text(
                        'Tunisie',
                        style: TextStyle(
                          fontFamily: 'NunitoBold',
                          fontSize: 18.0,
                          color: Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              // -------------- Type of reg nbr -------------- //
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isWCar,
                      onChanged: (value) {
                        setState(() {
                          isWCar = value!;
                          RoadDataCollector.myParsedCar["isW"] = value;
                        });
                        log('isWCar value = $isWCar');
                      },
                    ),
                    const Text(
                      "J'ai une voiture 'ن.ت'",
                      style: TextStyle(
                        fontFamily: 'NunitoRegular',
                        fontSize: 18.0,
                        color: Colors.black
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // ------------- Registration  NBR ------------- //
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  isWCar == true ?
                  [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50)
                            )
                        ),
                        child: TextFormField(
                          autofocus: false,
                          decoration: const InputDecoration(
                              border: InputBorder.none
                          ),
                          controller: registrationNBR_wnbr,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                              fontFamily: 'NunitoMedium',
                              fontSize: 20.0,
                              color: Colors.black54,
                              letterSpacing: 1.5
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              RoadDataCollector.myParsedCar["registrationNBR_1nbr"] = "";
                              RoadDataCollector.myParsedCar["registrationNBR_2nbr"] = "";
                              RoadDataCollector.myParsedCar['registrationNBR'] = value;
                            });
                          },
                        ),
                      )
                    ),
                  ]
                  :
                  [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50)
                          )
                        ),
                        child: TextFormField(
                          autofocus: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none
                          ),
                          controller: registrationNBR_1nbr,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontFamily: 'NunitoMedium',
                            fontSize: 20.0,
                            color: Colors.black54,
                            letterSpacing: 1.5
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              RoadDataCollector.myParsedCar["registrationNBR"] = "";
                              RoadDataCollector.myParsedCar["registrationNBR_1nbr"] = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        decoration: const BoxDecoration(
                            color: Colors.black12,
                        ),
                        child: TextFormField(
                          autofocus: false,
                          decoration: const InputDecoration(
                              border: InputBorder.none
                          ),
                          controller: registrationNBR_cntr,
                          readOnly: true,
                          style: const TextStyle(
                            fontFamily: 'NunitoBold',
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50)
                            )
                        ),
                        child: TextFormField(
                          autofocus: false,
                          decoration: const InputDecoration(
                              border: InputBorder.none
                          ),
                          controller: registrationNBR_2nbr,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                            fontFamily: 'NunitoMedium',
                            fontSize: 20.0,
                            color: Colors.black54,
                            letterSpacing: 1.5
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            setState(() {
                              RoadDataCollector.myParsedCar["registrationNBR_2nbr"] = value;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // ------------ Notice  description ------------ //
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.lock,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Text(
                        "Pour assurer votre sécurité et celle de vos passagers, votre plaque d'immatriculation n'est pas partagée qu'avec les passagers que vous approuvez.",
                        style: TextStyle(
                          fontFamily: 'NunitoBold',
                          fontSize: 14,
                          color: Colors.black54
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
