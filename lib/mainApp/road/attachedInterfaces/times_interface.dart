import 'dart:developer';

import 'package:carpooling/mainApp/road/road_data.dart';
import 'package:carpooling/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';
import 'package:intro_slider/intro_slider.dart';


class TripTimesSetter extends StatefulWidget {
  const TripTimesSetter({Key? key}) : super(key: key);

  @override
  State<TripTimesSetter> createState() => _TripTimesSetterState();
}

class _TripTimesSetterState extends State<TripTimesSetter> {

  DateFormat dateFormat = DateFormat("hh:mm a");

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      listCustomTabs: [timerClock('TEMP DE DEPART'), timerClock("TEMP D'ARRIVE")],
      backgroundColorAllTabs: const Color(0xFFF3F9F9),
      isAutoScroll: false,
      isShowSkipBtn: false,
      isShowNextBtn: false,
      isShowDoneBtn: false,
      isLoopAutoScroll: false,
      isPauseAutoPlayOnTouch: false,
      isShowPrevBtn: false,
      // Behavior
      scrollPhysics: const BouncingScrollPhysics()
    );
  }


  Widget timerClock(String msg){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: const Color(0xFFFEC956),
                  width: 2
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: const Icon(
                  Icons.access_time,
                  color: Colors.black54,
                  size: 40,
                ),
              ),
              TimePickerSpinner(
                is24HourMode: false,
                normalTextStyle: const TextStyle(
                    fontSize: 24,
                    color: Colors.black12
                ),
                highlightedTextStyle:  TextStyle(
                    fontSize: 36,
                    color: Styles.primaryColor
                ),
                spacing: 20,
                itemHeight: 50,
                itemWidth: 50,
                isForce2Digits: true,
                onTimeChange: (time) {
                  if(msg == 'TEMP DE DEPART'){
                    RoadDataCollector.leavingTime = dateFormat.format(time);
                  }
                  else{
                    RoadDataCollector.arrivalTime = dateFormat.format(time);
                  }
                  // log('Leaving time is : ${dateFormat.format(time)}');
                },
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Text(
            msg,
            style: const TextStyle(
              fontFamily: 'NunitoMedium',
              color: Colors.black54,
              fontSize: 18
            )
          ),
        )
      ],
    );
  }

}


