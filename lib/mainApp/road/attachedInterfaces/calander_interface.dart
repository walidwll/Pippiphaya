import 'dart:developer';

import 'package:carpooling/mainApp/road/road_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class TripDateSetter extends StatefulWidget {
  const TripDateSetter({Key? key}) : super(key: key);

  @override
  State<TripDateSetter> createState() => _TripDateSetterState();
}

class _TripDateSetterState extends State<TripDateSetter> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F9F9),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: SfDateRangePicker(
        showNavigationArrow: true,
        minDate: DateTime.now(),
        selectionMode: DateRangePickerSelectionMode.single,
        onSelectionChanged: _onSelectedDateChanged,
      ),
    );
  }

  void _onSelectedDateChanged(DateRangePickerSelectionChangedArgs args){
    DateFormat dateFormat = DateFormat('dd MMMM yyyy : dd/MM/yyyy');
    var date = dateFormat.format(args.value);
    RoadDataCollector.leavingDate = date;
    log("Selected date : ${RoadDataCollector.leavingDate}");
  }

}
