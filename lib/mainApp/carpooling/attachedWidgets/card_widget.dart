// ignore_for_file: prefer_initializing_formals

// import 'dart:developer';

import 'dart:developer';

import 'package:carpooling/models/carpooling.dart';
import 'package:carpooling/models/demands.dart';
import 'package:carpooling/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_styles.dart';



class CarpoolingCard extends StatefulWidget {
  Map<String, dynamic> cardBinder;

  CarpoolingCard(this.cardBinder, {Key? key}) : super(key: key);


  @override
  State<CarpoolingCard> createState() => _CarpoolingCardState();
}

class _CarpoolingCardState extends State<CarpoolingCard> {

  Map<String, dynamic> driver = {};
  List confirmedDemands = [];
  var availablePlaces = 0;

  @override
  Widget build(BuildContext context) {
    driver = User().findUserByID(widget.cardBinder['userId']);
    confirmedDemands = Demands().getConfirmedDemands(widget.cardBinder['id']);
    availablePlaces = widget.cardBinder['passengersNBR'] - confirmedDemands.length;
    // log('Log from CarpoolingCard : driver : $driver');
    // The main container of a carpooling
    // representation: Each iteration
    // create one container
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/main/carpoolingDetails', arguments: widget.cardBinder);
      },
      child: Container(
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
                                '${widget.cardBinder['startingStation']}',
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
                                '${widget.cardBinder['arrivalStation']}',
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${widget.cardBinder['leavingTime']}',
                            style: const TextStyle(
                              fontFamily: 'NunitoBold',
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '${widget.cardBinder['arrivalTime']}',
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Styles.primaryColor.withAlpha(50),
                          shape: BoxShape.circle
                        ),
                        child:
                        driver['image'] == 'NaN'
                        ?IconButton(
                          onPressed: () {  },
                          icon:  Icon(
                            Icons.person,
                            color: Styles.secondColor,
                          ),
                        )
                        :ImageIcon(
                          AssetImage('${driver["image"]}'),
                          size: 20,
                        )
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            driver['firstName'],
                            style: const TextStyle(
                              fontFamily: 'NunitoBold',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: CupertinoColors.systemYellow,
                              ),
                              Text(
                                '4.3/5 - 3 avis',
                                style: TextStyle(
                                  fontFamily: 'NunitoBold',
                                  fontSize: 16,
                                  color: Colors.black38
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.chair,
                              color: Colors.black54,
                            ),
                            Text(
                              '$availablePlaces/${widget.cardBinder['passengersNBR']}',
                              style: const TextStyle(
                                fontFamily: 'NunitoBold',
                                color: Colors.black54
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Text(
                          '${widget.cardBinder['price']} TND',
                          style: const TextStyle(
                            fontFamily: 'NunitoBold',
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    // log('Log from CarpoolingCard : driver id = ${widget.cardBinder['userId']}');
    // log('Log from CarpoolingCard : driver = ${User().findUserByID(widget.cardBinder['userId'])}');
    // return Container();
  }
}
