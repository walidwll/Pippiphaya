import 'package:flutter/material.dart';

import '../models/user.dart';
import '../utils/app_styles.dart';

class ProfilInfo extends StatelessWidget {
  final String firstname;
  final String lastname;
  final String firstSingup;
  final String picUrl;

  const ProfilInfo({required this.firstname,required this.lastname,required this.firstSingup,required this.picUrl});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(child: picUrl == 'NaN'?Icon(Icons.person, size: 70, color: Styles.secondColor,):CircleAvatar(minRadius: 50.0, maxRadius: 50.0, backgroundImage: AssetImage(picUrl),)),
        Text("$firstname $lastname",style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.bold)),
        Text("Member depuis $firstSingup",style: Styles.headLineStyle4.copyWith(fontSize:16),)
      ],

    );
  }
}
