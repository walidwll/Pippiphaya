import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import '../../utils/app_layout.dart';
import '../../utils/app_styles.dart';

class TrajetView extends StatelessWidget {
  final String from_location;
  final String to_location;
  const TrajetView({required this.from_location,required this.to_location}) ;

  @override
  Widget build(BuildContext context) {
    final size =AppLayout.getSize(context);
    return SizedBox(
      width: size.width,
      child: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal:15,vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[300],
                        ),
                        child: const Icon(Icons.pin_drop),
                      ),
                      const Gap(15),
                      Text("$from_location > $to_location",style: Styles.headLineStyle6)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
