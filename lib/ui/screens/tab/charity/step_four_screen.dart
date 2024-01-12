import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../routes/routes.dart';
import '../../../../theme/app_color.dart';
import '../../../widgets/charity/charity_input_field.dart';
import '../../../widgets/charity/charity_scaffold.dart';
import '../../../widgets/charity/steps.dart';

class StepFourScreen extends StatelessWidget {
  const StepFourScreen();

  @override
  Widget build(BuildContext context) {
    return CharityScaffold(
      children: [
        Text(
          'Créer une œuvre caritative',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          'Complétez vos informations personnelles pour participer à ce projet',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(
          height: 24.h,
        ),
        Steps(3, 4),
        SizedBox(
          height: 24.h,
        ),
        CharityInputField('Votre numéro de téléphone')
      ],
      button: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8.r,
              ),
            ),
          ),
          foregroundColor: MaterialStateProperty.all(
            AppColor.kPrimaryColor,
          ),
          minimumSize: MaterialStateProperty.all(
            Size(
              double.infinity,
              48.h,
            ),
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
          ),
        ),
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
          builder: (_) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewPadding.bottom,
              top: 32.h,
              left: 16.w,
              right: 16.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 64.h,
                ),
                SvgPicture.asset(
                  'assets/images/check.svg',
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Successful',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.kPrimaryColor,
                      ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Votre programme caritatif a été créé avec succès '
                  'Vous pouvez maintenant le vérifier et le gérer dans votre menu \'Activité',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 80.h,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      AppColor.kPrimaryColor,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          8.r,
                        ),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(
                      Size(
                        double.infinity,
                        56.h,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RouteGenerator.main, (route) => false);
                  },
                  child: Text(
                    'Home',
                  ),
                )
              ],
            ),
          ),
        ),
        child: Text('Publier'),
      ),
    );
  }
}
