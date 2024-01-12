import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../models/urgent.dart';
import '../../../../theme/app_color.dart';
import '../../../widgets/category.dart';
import '../../../widgets/home/header.dart';
import '../../../widgets/home/urgent_card.dart';

final List<Urgent> urgents = [
  Urgent(
    title: 'Voiture mini models',
    target: '17.000.000',
    percent: '80',
    assetName: '../assets/images/car.jpg',
    categories: ['MOTO'],
    days: 40,
    organizer: 'automobile',
    remaining: '20.000.000',
    desc:
  'Caractéristiques – Motorisation – Transmission – Dimensions – '
  'Performances – Dimensions – Consommation – Equipements De Sécurité – '
  'Equipements Intérieurs – Equipements Extérieurs – Equipements Fonctionnels ',

    people: 99,
  ),
  Urgent(
    title: 'projets agricoles',
    target: '10.000.000',
    percent: '80',
    assetName: '../assets/images/undraw_pumpkin_re_bm46.png',
    categories: ['agrecolation',],
    days: 40,
    organizer: 'Filaha.com',
    remaining: '20.000.000',
    desc:
        'je suis Flen Ben Flen j ai une idee '
        'Vous pouvez m\'aider  ',
    people: 99,
  ),
  Urgent(
    title: 'startups technologiques',
    target: '100.000.000',
    percent: '50',
    assetName: '../assets/images/undraw_undraw_undraw_undraw_undraw_selectoption_y9cm_mx7w_-2-_vjsk_js62_gghb.png',
    categories: ['Children', 'Education'],
    days: 40,
    organizer: '...',
    remaining: '200.000.000',
    desc:
'        Explorez l\'excitant lancement dune startup, axée sur l innovation dans l industrie de la technologie. Notre équipe dynamique est déterminée à créer un impact positif sur la société tout en assurant une croissance stratégique dans le domaine de la cybersécurité. Rejoignez-nous dans cette aventure unique, où chaque idée compte et chaque action contribue à façonner le futur de la technologie.',
      people: 99,
  ),
  Urgent(
    title: 'Tourisme',
    target: '15.000.000',
    percent: '10',
    assetName: '../assets/images/undraw_Love_it_xkc2.png',
    categories: ['Children', 'Education'],
    days: 40,
    organizer: 'White Hat Organization',
    remaining: '150.000.000',
    desc:
        'Make learning possible for students of all ages, from pre-school to graduate school.'
        ' They also provide otger educational servuces and opportunities that help make schools '
        'more effective and more accessible to students of all backgrounds.',
    people: 99,
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController controller;
  int currentIndex = 0;
  final double oneCardWidth = 256.w;
  double position = 0;
  @override
  void initState() {
    controller = ScrollController();
    controller.addListener(() {
      position = controller.offset;
      if ((position / oneCardWidth).floor() < 0) {
        return;
      }
      if (controller.offset == 0) {
        setState(() {
          currentIndex = 0;
        });
        return;
      }
      setState(() {
        currentIndex = (position / oneCardWidth).floor() + 1;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            32.r,
          ),
          bottomRight: Radius.circular(
            32.r,
          ),
        ),
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Header(),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0.w,
            ),
            child: Container(
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(
                color: AppColor.kPrimaryColor,
                borderRadius: BorderRadius.circular(
                  12.r,
                ),
              ),
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/images/mask_diamond.svg',
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Changer le monde avec',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          'votre petite aide',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              Size(
                                0,
                                0,
                              ),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  8.r,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text('Donate'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Spacer(),
          Category(),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0.w,
            ),
            child: Row(
              children: [
                Text(
                  'Acceuil',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    urgents.length,
                    (index) => Row(
                      children: [
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                          width: 8.w,
                          height: 8.w,
                          decoration: BoxDecoration(
                            color: index == currentIndex
                                ? AppColor.kPrimaryColor
                                : AppColor.kPlaceholder1,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              left: 16.0.w,
            ),
            child: SingleChildScrollView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                top: 8.h,
                bottom: 8.h,
                right: 8.w,
              ),
              child: Row(
                children: List.generate(
                  urgents.length,
                  (index) => Row(
                    children: [
                      UrgentCard(urgents[index]),
                      SizedBox(
                        width: 16.w,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
