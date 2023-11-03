import 'package:carpooling/models/carpooling.dart';
import 'package:carpooling/models/demands.dart';
import 'package:carpooling/models/user.dart';
import 'package:carpooling/profile/profil_info.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class ProfileSTS extends StatefulWidget {
  const ProfileSTS({Key? key}) : super(key: key);

  @override
  State<ProfileSTS> createState() => _ProfileSTSState();
}

class _ProfileSTSState extends State<ProfileSTS> {

  int totalReviews = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ------------------------ The AppBar Section ------------------------ //
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFF3F9F9),
        elevation: 0,
      ),
      // ------------------------ ****************** ------------------------ //
      // ------------------------ User profile stats ------------------------ //
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ----------> Profile sts title
          Container(
            color: const Color(0xFFF3F9F9),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child:  Text(
              'Profil statistiques',
              style: Styles.headLineStyle1,
            ),
          ),
          // ----------> Profile sts data
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: const Color(0xFFF3F9F9),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ##### The profile user info ##### //
                    ProfilInfo(firstname: User.firstname, lastname: User.lastname, firstSingup: "2019",picUrl: User.image),
                    // ##### The profile user AVIS ##### //
                    Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Etoiles',
                              style: TextStyle(
                                fontFamily: 'NunitoMedium',
                                fontSize: 18.0,
                              ),
                            ),
                            Row(
                              children: List.generate(5, (index) {
                                return const Icon(
                                  Icons.star,
                                  size: 25,
                                  color: Colors.black26,
                                );
                              }),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Avis reçus',
                              style: TextStyle(
                                fontFamily: 'NunitoMedium',
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '$totalReviews',
                              style: const TextStyle(
                                fontFamily: 'NunitoBold',
                                fontSize: 20,
                                fontWeight: FontWeight.w900
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Avis positifs',
                              style: TextStyle(
                                fontFamily: 'NunitoMedium',
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '$totalReviews',
                              style: const TextStyle(
                                  fontFamily: 'NunitoBold',
                                  fontSize: 20,
                                  color: Color(0xFF01AE90),
                                  fontWeight: FontWeight.w900
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Avis négatifs',
                              style: TextStyle(
                                fontFamily: 'NunitoMedium',
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '$totalReviews',
                              style: const TextStyle(
                                  fontFamily: 'NunitoBold',
                                  fontSize: 20,
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w900
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 1,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    // ##### The profile user OFFR ##### //
                    Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Offres publiées',
                              style: TextStyle(
                                fontFamily: 'NunitoMedium',
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '${Carpooling().myCarpoolings().length}',
                              style: const TextStyle(
                                  fontFamily: 'NunitoBold',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Offres terminées',
                              style: TextStyle(
                                fontFamily: 'NunitoMedium',
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '$totalReviews',
                              style: const TextStyle(
                                  fontFamily: 'NunitoBold',
                                  fontSize: 20,
                                  color: Color(0xFF01AE90),
                                  fontWeight: FontWeight.w900
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Offres annulées',
                              style: TextStyle(
                                fontFamily: 'NunitoMedium',
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '$totalReviews',
                              style: const TextStyle(
                                  fontFamily: 'NunitoBold',
                                  fontSize: 20,
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w900
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 1,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    // ##### The profile user RESV ##### //
                    Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Réservation envoyées',
                              style: TextStyle(
                                fontFamily: 'NunitoMedium',
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '${Demands.myDemands.length}',
                              style: const TextStyle(
                                  fontFamily: 'NunitoBold',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Réservations terminées',
                              style: TextStyle(
                                fontFamily: 'NunitoMedium',
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '$totalReviews',
                              style: const TextStyle(
                                  fontFamily: 'NunitoBold',
                                  fontSize: 20,
                                  color: Color(0xFF01AE90),
                                  fontWeight: FontWeight.w900
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Réservation annulées',
                              style: TextStyle(
                                fontFamily: 'NunitoMedium',
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              '$totalReviews',
                              style: const TextStyle(
                                  fontFamily: 'NunitoBold',
                                  fontSize: 20,
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w900
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      // ------------------------ ****************** ------------------------ //
    );
  }
}
