import 'dart:convert';

import 'package:carpooling/models/user.dart';
import 'package:carpooling/network_utils/api.dart';
import 'package:carpooling/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../connection/login.dart';
import '../utils/app_layout.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ------------------------ The AppBar Section ------------------------ //
        appBar: AppBar(
          backgroundColor: Styles.bgColor,
          surfaceTintColor:Styles.bgColor ,
          shadowColor:Colors.transparent,
          leading: IconButton(onPressed: (){Navigator.pushNamed(context, '/main/home');}, icon: const Icon(Icons.arrow_back_sharp,color: Colors.black,)),
          bottom:  PreferredSize(
              preferredSize: const Size.fromHeight(25.0),
              child: Container(
                  width: AppLayout.getScreenWidth(),
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(color: Styles.bgColor),
                  padding:EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20),vertical: AppLayout.getWidth(0)) ,
                  child: Text("Profil",style: Styles.headLineStyle1.copyWith(fontSize: 28),))),
        ),
        // ------------------------ ****************** ------------------------ //
        // ---------------------- Profile user view body ---------------------- //
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(0),vertical: AppLayout.getWidth(20)),
          children: [
            // ---------> User sts link
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20),vertical: AppLayout.getWidth(10)),
                    color: Styles.bgColor2,
                    child: Row(
                      children:  [
                        CircleAvatar(
                          minRadius: 40.0,
                          maxRadius: 40.0,
                          backgroundImage: AssetImage(User.image),
                        ),
                        const Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${User.firstname} ${User.lastname}",style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.w600)),
                            Text("Member depuis 2019",style: Styles.headLineStyle4,)
                          ],
                        ),
                        Expanded(child: Container()),

                        IconButton(onPressed: (){Navigator.pushNamed(context, '/main/profile/sts');}, icon: const Icon(Icons.navigate_next))
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(5),vertical: AppLayout.getWidth(5)),
                  child: Wrap(
                    children: [
                      Row(children: [
                        IconButton(onPressed: (){}, icon: User.isIDVerified == true ? Icon(Icons.check_circle_outline, size: 20, color: Colors.green[400],) : const Icon(Icons.warning_amber, size: 20, color: Color(0xFFFEC956),)),
                        Text("0676082813",style: Styles.headLineStyle6,),
                        Expanded(child: Container()),
                        TextButton(onPressed: (){}, child: Text("Changer",style: Styles.headLineStyle3.copyWith(color: Colors.blueAccent),))
                      ],),
                      Row(children: [
                        IconButton(onPressed: (){}, icon: User.isIDVerified == true ? Icon(Icons.check_circle_outline, size: 20, color: Colors.green[400],) : const Icon(Icons.warning_amber, size: 20, color: Color(0xFFFEC956),)),
                        Text("walid.oualili@gmail.com",style: Styles.headLineStyle6,),
                        Expanded(child: Container()),
                      ],),
                      Row(children: [
                        IconButton(onPressed: (){}, icon: User.isIDVerified == true ? Icon(Icons.check_circle_outline, size: 20, color: Colors.green[400],) : const Icon(Icons.warning_amber, size: 20, color: Color(0xFFFEC956),)),
                        Text("Vérifier mon identité",style: Styles.headLineStyle6,),
                        Expanded(child: Container()),
                      ],)
                    ],
                  ),
                ),
                Divider(
                  indent: 30,
                  endIndent: 30,
                  thickness: 0.1,
                  height: 8.0,
                  color: Styles.textColor2,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15),vertical: AppLayout.getWidth(5)),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.vertical,
                    children: [
                      TextButton(onPressed: (){}, child: Text("Changer ma photo de profil",style: Styles.headLineStyle6,)),
                      TextButton(onPressed: (){}, child: Text("Mettre à jour mes informations",style: Styles.headLineStyle6,))
                    ],
                  ),
                ),
                Divider(
                  indent: 30,
                  endIndent: 30,
                  thickness: 0.1,
                  height: 8.0,
                  color: Styles.textColor2,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15),vertical: AppLayout.getWidth(5)),
                  child:Wrap(
                    direction: Axis.vertical,
                    children: [
                      TextButton(onPressed: (){}, child: Text("Avis sur les covoiturages",style: Styles.headLineStyle6,)),
                      TextButton(onPressed: (){Navigator.pushNamed(context, '/main/profile/alerts');}, child: Text("Consulter mes alertes",style: Styles.headLineStyle6,)),
                      TextButton(onPressed: (){}, child: Text("Mattre à jour mes voitures",style: Styles.headLineStyle6,)),
                    ],
                  ),
                ),

                Divider(
                  indent: 30,
                  endIndent: 30,
                  thickness: 0.1,
                  height: 8.0,
                  color: Styles.textColor2,
                ),
                InkWell(
                  overlayColor: MaterialStateColor.resolveWith((states) => Styles.bgColor2),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15),vertical: AppLayout.getWidth(5)),
                    child: Row(
                      children: [
                        Wrap(
                          direction: Axis.vertical,
                          children: [
                            Text("Paramètres",style: Styles.headLineStyle6,),
                            Text("Notifications,langue et plus",style: Styles.headLineStyle4.copyWith(fontWeight: FontWeight.normal),)
                          ],),
                        Expanded(child: Container()),
                        IconButton(onPressed: (){}, icon: Icon(Icons.chevron_right_rounded)),
                      ],
                    ),),
                ),
                const Gap(50),
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text("Version 1.0.0 - 2023",style: Styles.headLineStyle6,textAlign: TextAlign.center,),
                    Text("Données protégées confortement à la CNDP",style: Styles.headLineStyle4.copyWith(fontWeight: FontWeight.normal),)
                  ],),
              ],
            ),
          // -----------> User management part

          ],
        ),
        // ------------------------ ****************** ------------------------ //
    );
  }

  void logout() async {
    var res = await Network().logout('/logout');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      setState(() {
        User.isAuth = false;
      });
      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (context) => Login()
          )
      );
    }
  }
}
