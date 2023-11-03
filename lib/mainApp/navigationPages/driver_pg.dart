import 'package:carpooling/models/user.dart';
import 'package:carpooling/utils/app_styles.dart';
import 'package:flutter/material.dart';



class DriverPage extends StatefulWidget {
  const DriverPage({Key? key}) : super(key: key);

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {

  // final String userName = 'Ahmed';
  var verifiedUserID = User.isIDVerified;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              '${User.firstname}, tu voyages quelque part?',
                style: const TextStyle( fontFamily: 'Poppins',fontSize: 24,fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,maxLines: 2,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: BoxDecoration(
                color: Styles.primaryColor,
                borderRadius: BorderRadius.circular(25)
            ),
            child: TextButton(
              onPressed: () {
                verifiedUserID == true ? Navigator.pushNamed(context, '/main/addCarpooling') : Navigator.pushNamed(context, '/main/verifyID/info');
              },
              child:  Text(
                '+ Publier un covoiturage',
                style: Styles.headLineStyle5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
