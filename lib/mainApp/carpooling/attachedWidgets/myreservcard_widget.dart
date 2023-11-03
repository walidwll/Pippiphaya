import 'dart:developer';

import 'package:carpooling/models/carpooling.dart';
import 'package:carpooling/models/demands.dart';
import 'package:carpooling/models/user.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import '../../../utils/app_styles.dart';

class MyReservationCard extends StatefulWidget {
  static var cancelDemandBTNText = 'Annuler';
  Map<String, dynamic> myReservationCardBinder = {};
  MyReservationCard(this.myReservationCardBinder, {Key? key}) : super(key: key);

  @override
  State<MyReservationCard> createState() => _MyReservationCardState();
}

class _MyReservationCardState extends State<MyReservationCard> {
  late Map<String, dynamic> appropriateCarpooling;
  late Map<String, dynamic> driver;
  @override
  Widget build(BuildContext context) {
    appropriateCarpooling = Carpooling().findCarpoolingByID(widget.myReservationCardBinder['carpooling_id']);
    driver = User().findUserByID(appropriateCarpooling['userId']);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      height: 300,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.black12,
              width: 1
          ),
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          // ------------------------------
          // Sup part of the container main
          // ------------------------------
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: driver['image']=='NaN'?
                  IconButton(
                    onPressed: () {},
                    icon:  Icon(
                      Icons.person,
                      size: 25,
                      color: Styles.primaryColor,
                    )
                  )
                  :IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      AssetImage(driver['image'])
                    ),
                  )
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '${driver["firstName"]}',
                    style: const TextStyle(
                      fontFamily: 'NunitoRegular',
                      fontSize: 18.0,
                      color: Colors.black38
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    appropriateCarpooling['leavingDate'],
                    style: const TextStyle(
                      fontFamily: 'NunitoRegular',
                      fontSize: 14.0,
                      color: Colors.black38
                    ),
                  ),
                )
              ],
            )
          ),
          // ------------------------------
          // Mid part of the container main
          // ------------------------------
          Expanded(
            flex:3,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black12
                  )
                )
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              '${appropriateCarpooling['startingStation']}',
                              style: const TextStyle(
                                fontFamily: 'NunitoBold',
                                fontSize: 22,
                              ),
                            ),
                            const Text(
                              'Autre',
                              style: TextStyle(
                                fontFamily: 'NunitoBold',
                                fontSize: 16,
                                letterSpacing: 1.5,
                                color: Colors.black38
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              '${appropriateCarpooling['arrivalStation']}',
                              style: const TextStyle(
                                fontFamily: 'NunitoBold',
                                fontSize: 22,
                              ),
                            ),
                            const Text(
                              'Autre',
                              style: TextStyle(
                                fontFamily: 'NunitoBold',
                                fontSize: 16,
                                letterSpacing: 1.5,
                                color: Colors.black38
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            color: Styles.secondColor,
                            border: Border.all(
                              color: Styles.primaryColor,
                              width: 3
                            ),
                            borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                        // *******************************
                        for(var j=0; j<3; j++)
                          Container(
                            width: 2,
                            height: 5,
                            color: Styles.primaryColor,
                            margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                          ),
                        // *******************************
                        Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.black26,
                                  width: 3
                              ),
                              borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                        // *******************************
                        for(var j=0; j<3; j++)
                          Container(
                            width: 2,
                            height: 5,
                            color: Styles.primaryColor,
                            margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                          ),
                        // *******************************
                        Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            color: Styles.secondColor,
                            border: Border.all(
                              color: Styles.primaryColor,
                              width: 3
                            ),
                            borderRadius: BorderRadius.circular(15)
                          ),
                        )
                      ],
                    )
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${appropriateCarpooling['leavingTime']}',
                          style: const TextStyle(
                            fontFamily: 'NunitoBold',
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '${appropriateCarpooling['arrivalTime']}',
                          style: const TextStyle(
                            fontFamily: 'NunitoBold',
                            fontSize: 20,
                          ),
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
          // ------------------------------
          // Inf part of the container main
          // ------------------------------
          Expanded(
            flex:2,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1,
                    color: Colors.black12
                  )
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.myReservationCardBinder['total_price']} DNT",
                    style: const TextStyle(
                        fontFamily: 'NunitoBold',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w900
                    ),
                  ),
                  widget.myReservationCardBinder['isAccepted'] == null ?
                  Row(
                    children: const [
                      Icon(
                        Icons.timelapse_outlined,
                        size: 20,
                        color: Colors.orangeAccent,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'En attente',
                        style: TextStyle(
                          fontFamily: 'NunitoMedium',
                          fontSize: 16.0,
                          color: Colors.orangeAccent
                        )
                      )
                    ],
                  )
                  :
                  Row(
                    children: [
                      Icon(
                        widget.myReservationCardBinder['isAccepted'] == true ? Icons.security_update_good_sharp : Icons.cancel_outlined,
                        size: 20,
                        color: widget.myReservationCardBinder['isAccepted'] == true ? Styles.primaryColor : Colors.orangeAccent,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.myReservationCardBinder['isAccepted'] == true ? 'Accepté' : 'Annulé',
                        style: TextStyle(
                          fontFamily: 'NunitoMedium',
                          fontSize: 16.0,
                          color: widget.myReservationCardBinder['isAccepted'] == true ? Styles.primaryColor : Colors.orangeAccent,
                        ),
                      )
                    ],
                  ),
                  widget.myReservationCardBinder['isAccepted'] == null ?
                  TextButton(
                    onPressed: (){
                      if(MyReservationCard.cancelDemandBTNText != '...'){
                        displayConfirmationActionAlert(false);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.redAccent,
                              width: 1
                          )
                      ),
                      child: Text(
                        MyReservationCard.cancelDemandBTNText,
                        style: const TextStyle(
                          fontFamily: 'NunitoBold',
                          fontSize: 18.0,
                          color: Colors.redAccent
                        ),
                      ),
                    ),
                  )
                  :
                  const Icon(
                    Icons.not_interested,
                    size: 25,
                    color: Colors.redAccent,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  void displayConfirmationActionAlert(bool acceptAction) async {
    var confirmationText = 'Confirmer';
    Dialogs.materialDialog(
        context: context,
        title: "Confirmation",
        titleStyle: const TextStyle(
          fontFamily: 'NunitoBold',
          fontSize: 18.0,
        ),
        msg: "Vous êtes sur le point d'annuler cette demande",
        msgStyle: const TextStyle(
            fontFamily: 'NunitoRegular',
            fontSize: 20.0,
            color: Colors.black38,
            letterSpacing: 1.5
        ),
        actions: [
          IconsOutlineButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: 'Annuler',
            iconData: Icons.cancel,
            textStyle: const TextStyle(
                fontFamily: 'NunitoBold',
                fontSize: 18.0,
                color: Colors.black38
            ),
            iconColor: Colors.redAccent,
          ),
          IconsOutlineButton(
            onPressed: () async {
              setState(() {
                confirmationText = 'En cours...';
              });
              await Demands().updateDemand(widget.myReservationCardBinder['id'], acceptAction);
              setState(() {
                confirmationText = 'Confirmer';
                MyReservationCard.cancelDemandBTNText = '...';
              });
              Navigator.of(context).pop();
            },
            text: confirmationText,
            iconData: Icons.gpp_good_outlined,
            textStyle: const TextStyle(
                fontFamily: 'NunitoBold',
                fontSize: 18.0,
                color: Colors.white
            ),
            iconColor: Colors.white,
            color: Styles.primaryColor,
          ),
        ]
    );
  }

}
