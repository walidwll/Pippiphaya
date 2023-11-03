import 'package:carpooling/models/carpooling.dart';
import 'package:carpooling/models/demands.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import '../../../utils/app_styles.dart';



class MyCarpoolingCard extends StatefulWidget {
  Map<String, dynamic> myCarpoolingCardBinder;

  static String cancelOffreBTNText = 'Annuler';
  MyCarpoolingCard(this.myCarpoolingCardBinder, {Key? key}) : super(key: key);

  @override
  State<MyCarpoolingCard> createState() => _MyCarpoolingCardState();
}

class _MyCarpoolingCardState extends State<MyCarpoolingCard> {
  List appropriateDemands = [];
  @override
  Widget build(BuildContext context) {
    appropriateDemands = Demands().getInProgressDemands(widget.myCarpoolingCardBinder['id']);
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
            flex:5,
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color: Colors.black12
                      )
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Le ${widget.myCarpoolingCardBinder["leavingDate"]}',
                    style: const TextStyle(
                      fontFamily: 'NunitoMedium',
                      fontSize: 14
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    '${widget.myCarpoolingCardBinder['startingStation']}',
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
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    '${widget.myCarpoolingCardBinder['arrivalStation']}',
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
                                  color: const Color(0xFFFEC956),
                                  border: Border.all(
                                    color: Styles.primaryColor,
                                    width: 3
                                  ),
                                  borderRadius: BorderRadius.circular(15)
                                ),
                              ),
                              // *******************************
                              for(var j=0; j<5; j++)
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
                              for(var j=0; j<5; j++)
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
                                  color: const Color(0xFFFEC956),
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
                            children: [
                              Text(
                                '${widget.myCarpoolingCardBinder['leavingTime']}',
                                style: const TextStyle(
                                  fontFamily: 'NunitoBold',
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                '${widget.myCarpoolingCardBinder['arrivalTime']}',
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.circle
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: (){
                          if(appropriateDemands.isEmpty){}
                          else {
                            var dataToPass = [widget.myCarpoolingCardBinder, appropriateDemands];
                            Navigator.pushNamed(context, '/main/carpoolingDemands', arguments: dataToPass);
                          }
                        },
                        child: Text(
                          '${appropriateDemands.length}',
                          style:  TextStyle(
                            fontFamily: 'NunitoBold',
                            fontSize: 16,
                            color: Styles.secondColor,
                            fontWeight: FontWeight.w900
                          ),
                        ),
                      ),
                    ),
                  ),
                  widget.myCarpoolingCardBinder['status'] == 'inprogress'?
                  const Icon(
                    Icons.av_timer,
                    size: 25,
                    color: Colors.orangeAccent,
                  )
                  :widget.myCarpoolingCardBinder['status'] == 'cancelled'?
                  const Icon(
                    Icons.cancel,
                    size: 25,
                    color: Colors.redAccent,
                  ):
                   Icon(
                    Icons.gpp_good,
                    size: 25,
                    color: Styles.secondColor,
                  ),
                  TextButton(
                    onPressed: (){
                      if(widget.myCarpoolingCardBinder['status']!='inprogress'){
                        updateCarpoolingStatus(widget.myCarpoolingCardBinder['id'], 'cancelled');
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      decoration: BoxDecoration(
                          color: widget.myCarpoolingCardBinder['status']!='inprogress'?Colors.black26.withAlpha(30):Colors.white,
                          border: Border.all(
                          color: Colors.redAccent,
                          width: 1
                        )
                      ),
                      child: Text(
                        MyCarpoolingCard.cancelOffreBTNText,
                        style: TextStyle(
                          fontFamily: 'NunitoBold',
                          fontSize: 18.0,
                          color: widget.myCarpoolingCardBinder['status']=='inprogress'?Colors.redAccent:Colors.redAccent.withAlpha(30)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }



  void updateCarpoolingStatus(carpoolingID, String status) async {
    var confirmationText = 'Confirmer';
    Dialogs.materialDialog(
        context: context,
        title: "Confirmation",
        titleStyle: const TextStyle(
          fontFamily: 'NunitoBold',
          fontSize: 18.0,
        ),
        msg: "Vous êtes sur le point d'annuler cet offre !",
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
              await Carpooling().updateCarpoolingStatus(carpoolingID, status);
              setState(() {
                confirmationText = 'Confirmer';
                MyCarpoolingCard.cancelOffreBTNText = '...';
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
