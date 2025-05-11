import 'package:dot_know/common/helpers/is_dark_mode.dart';
import 'package:dot_know/common/widgets/appbar/app_bar.dart';
import 'package:dot_know/common/widgets/buttom/basic_app_button.dart';
import 'package:dot_know/core/configs/assets/app_images.dart';
import 'package:dot_know/core/configs/assets/app_vectors.dart';
import 'package:dot_know/core/configs/theme/app_color.dart';
import 'package:dot_know/presentation/auth/pages/signin.dart';
import 'package:dot_know/presentation/auth/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpOrSignInPage extends StatelessWidget {
  const SignUpOrSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBackground)
          ),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppVectors.logo),
                    SizedBox(
                      height: 56,
                    ),
                    Text(
                      AppLocalizations.of(context)!.introText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    Text(
                      AppLocalizations.of(context)!.authPageSubTitleText,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: AppColors.grey
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: BasicAppButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
                            },
                            title: AppLocalizations.of(context)!.registerText,
                            height: 80,
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 80,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
                                },
                                child:
                                  Text(
                                    AppLocalizations.of(context)!.signInText,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: context.isDarkMode ? Colors.white : Colors.black
                                    ),
                                  )
                            ),
                          )
                        )
                      ],
                    )
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
