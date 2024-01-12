import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../routes/routes.dart';
import '../../../../theme/app_color.dart';
import '../../../widgets/charity/charity_input_field.dart';
import '../../../widgets/charity/charity_scaffold.dart';
import '../../../widgets/charity/steps.dart';

class StepOneScreen extends StatelessWidget {
  const StepOneScreen();

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
          height: 24.h,
        ),
        Text(
          'Complétez vos informations personnelles pour procéder à ce projet',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(
          height: 24.h,
        ),
        Steps(0, 4),
        Spacer(),
        CharityInputField(
          'Votre profession',
        ),
        Spacer(),
        CharityInputField(
          'Nom de l\'institution.',
        ),
        Spacer(),
        CharityInputField(
          'Compte sur les réseaux sociaux',
        ),
        Spacer(),
        CharityInputField(
          'Addresse',
        ),
        Spacer(),
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
        onPressed: () => Navigator.of(context).pushNamed(
          RouteGenerator.stepTwo,
        ),
        child: Text('Next'),
      ),
    );
  }
}
