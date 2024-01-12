import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../bloc/profile/profile_bloc.dart';
import '../../../theme/app_color.dart';
import 'details.dart';
import 'profile_card.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        ProfileCard(),
        Spacer(),
        Details(
          title: 'Email address',
          desc: 'arijchetoui@gmail.com',
        ),
        Spacer(),
        Details(
          title: 'Account ID',
          desc: '18-92768AC009',
        ),
        Spacer(),
        Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            
            )),
            GestureDetector(
              onTap: () =>
                  BlocProvider.of<ProfileBloc>(context).add(SetPayment()),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8.w,
                  horizontal: 8.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    4.r,
                  ),
                  color: AppColor.kPlaceholder2,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14.sp,
                  color: AppColor.kTextColor1,
                ),
              ),
            )
          ],
        ),
        Spacer(),
        Row(
          children: [
            Expanded(
              child: Details(
                title: '  N um de Carte',
                desc: '5591**********',
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8.w,
                  horizontal: 8.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    4.r,
                  ),
                  color: AppColor.kPlaceholder2,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14.sp,
                  color: AppColor.kTextColor1,
                ),
              ),
            )
          ],
        ),
        Spacer(),
        Details(
          title: 'code Banquaire',
          desc: '****',
        ),
        Spacer(),
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
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/logout.svg',
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                'Logout',
              ),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }
}
