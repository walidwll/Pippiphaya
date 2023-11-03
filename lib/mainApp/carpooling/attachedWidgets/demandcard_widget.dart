import 'package:carpooling/models/demands.dart';
import 'package:carpooling/models/user.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import '../../../utils/app_styles.dart';

class DemandCard extends StatefulWidget {
  static var typeOfAction = 'NoAction';
  Map<String, dynamic> demandCardBinder = {};
  DemandCard(this.demandCardBinder, {Key? key}) : super(key: key);

  @override
  State<DemandCard> createState() => _DemandCardState();
}

class _DemandCardState extends State<DemandCard> {
  Map<String, dynamic> userOnDemand = {};
  @override
  Widget build(BuildContext context) {
    userOnDemand = User().findUserByID(widget.demandCardBinder['passenger_ondemand']);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(
          color: Colors.black12,
          width: 1
        ),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  userOnDemand['image'] == 'NaN'?
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Styles.primaryColor.withAlpha(40)
                    ),
                    child: IconButton(
                      onPressed: (){},
                      icon:  Icon(
                        Icons.person,
                        color: Styles.secondColor,
                      ),
                    ),
                  )
                  :
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Styles.primaryColor.withAlpha(40)
                    ),
                    child: ImageIcon(
                      AssetImage(userOnDemand['image'])
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${userOnDemand["firstName"]}',
                    style: const TextStyle(
                      fontFamily: 'NunitoMedium',
                      fontSize: 18.0,
                      color: Colors.black
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.chair,
                    size: 20,
                    color: Colors.black38,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${widget.demandCardBinder["places_ondemand"]}',
                    style: const TextStyle(
                        fontFamily: 'NunitoMedium',
                        fontSize: 18.0,
                        color: Colors.black38
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 1,
            color: Colors.black12,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.demandCardBinder['passenger_msg'] == ''?
              IconButton(
                onPressed: (){
                  displayPassengerMsg();
                },
                icon: const Icon(
                  Icons.email,
                  size: 25,
                  color: Color(0xFFFEC956),
                ),
              )
              :
              IconButton(
                onPressed: (){
                  displayPassengerMsg();
                },
                icon: const Icon(
                  Icons.mark_email_unread_rounded,
                  size: 25,
                  color: Color(0xFFFEC956),
                ),
              ),
              DemandCard.typeOfAction == 'NoAction'?
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: (){
                      displayConfirmationActionAlert(false);
                    },
                    child: const Text(
                      'Rejeter',
                      style: TextStyle(
                        fontFamily: 'NunitoRegular',
                        fontSize: 18.0,
                        color: Colors.redAccent
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      displayConfirmationActionAlert(true);
                    },
                    child:  Text(
                      'Accepter',
                      style: TextStyle(
                          fontFamily: 'NunitoRegular',
                          fontSize: 18.0,
                          color: Styles.primaryColor
                      ),
                    ),
                  )
                ],
              )
              :
              Text(
                "...",
                style: TextStyle(
                  fontFamily: 'NunitoBold',
                  fontSize: 18.0,
                  color: DemandCard.typeOfAction == 'acceptAction'?Styles.primaryColor:Colors.redAccent
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void displayPassengerMsg(){
    Dialogs.materialDialog(
      context: context,
      title: "${userOnDemand['firstName'].toString().toUpperCase()} : message",
      titleStyle: const TextStyle(
        fontFamily: 'NunitoBold',
        fontSize: 18.0,
      ),
      msg: widget.demandCardBinder['passenger_msg'] == '' ? "Aucun message attaché par ${userOnDemand['firstName'].toString().toUpperCase()}":widget.demandCardBinder['passenger_msg'],
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
          text: 'lu!',
          iconData: Icons.mark_email_read,
          textStyle: const TextStyle(
              fontFamily: 'NunitoBold',
              fontSize: 18.0,
              color: Colors.black87
          ),
          iconColor: const Color(0xFFFEC956),
          color: Styles.primaryColor,
        ),
      ]
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
        msg: acceptAction==true?"Vous êtes sur le point d'accépter la demande de ${userOnDemand['firstName']}":"Vous êtes sur le point de rejeter la demande de ${userOnDemand['firstName']}",
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
              await Demands().updateDemand(widget.demandCardBinder['id'], acceptAction);
              setState(() {
                confirmationText = 'Confirmer';
                if(acceptAction == true){
                  DemandCard.typeOfAction = 'acceptAction';
                }
                else{
                  DemandCard.typeOfAction = 'rejectAction';
                }
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
