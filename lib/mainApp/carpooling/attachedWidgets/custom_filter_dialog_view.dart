import 'package:carpooling/mainApp/carpooling/attachedWidgets/custom_calendar_view.dart';
import 'package:carpooling/mainApp/carpooling/filter.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import '../../../utils/app_styles.dart';

class CustomFilterDialogView extends StatefulWidget {
  const CustomFilterDialogView({Key? key}) : super(key: key);

  @override
  State<CustomFilterDialogView> createState() => _CustomFilterDialogViewState();
}

class _CustomFilterDialogViewState extends State<CustomFilterDialogView> {

  String dateToFilterBy = CarpoolingsFilter.dateFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Colors.black12,
                        width: 1
                    )
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Classer par',
                  style: TextStyle(
                      fontFamily: 'NunitoBold',
                      fontSize: 20
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: CarpoolingsFilter.priceFilter,
                      onChanged: (value) {
                        setState(() {
                          CarpoolingsFilter.priceFilter = value!;
                        });
                      },
                    ),
                    const Text(
                      'Prix le plus bas',
                      style: TextStyle(
                          fontFamily: 'NunitoBold',
                          fontSize: 18,
                          color: Colors.black38
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Colors.black12,
                        width: 1
                    )
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Date',
                  style: TextStyle(
                      fontFamily: 'NunitoBold',
                      fontSize: 20
                  ),
                ),
                Text(
                  dateToFilterBy,
                  style: const TextStyle(
                      fontFamily: 'NunitoBold',
                      fontSize: 18,
                      color: Colors.black38
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: (){
                          _displayDateFilterDialog();
                        },
                        child:  Text(
                          'Changer la date',
                          style: TextStyle(
                              fontFamily: 'NunitoBold',
                              fontSize: 18,
                              color: Styles.primaryColor
                          ),
                        )
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _displayDateFilterDialog(){
    Dialogs.materialDialog(
        context: context,
        customView: const CustomCalendarView(),
        actions: [
          IconsOutlineButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                dateToFilterBy = CarpoolingsFilter.dateFilter;
              });
            },
            text: 'Changer',
            iconData: Icons.paste_sharp,
            textStyle: const TextStyle(
                fontFamily: 'NunitoBold',
                color: Colors.black87
            ),
            iconColor: const Color(0xFFFEC956),
            color: Styles.primaryColor,
          ),
        ]
    );
  }

}
