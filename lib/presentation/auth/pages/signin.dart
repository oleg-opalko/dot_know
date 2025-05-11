import 'package:dot_know/common/widgets/appbar/app_bar.dart';
import 'package:dot_know/common/widgets/buttom/basic_app_button.dart';
import 'package:dot_know/core/configs/assets/app_vectors.dart';
import 'package:dot_know/presentation/auth/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signUpText(context),
      appBar: BasicAppBar(title: SvgPicture.asset(AppVectors.logo, height: 40, width: 40,)),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 50
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signInText(context),
            SizedBox(height: 50,),
            _emailField(context),
            SizedBox(height: 20,),
            _passwordField(context),
            SizedBox(height: 20,),
            BasicAppButton(
              onPressed: () {},
              title: AppLocalizations.of(context)!.signInText, height: 60,
            ),
          ],
        ),
      ),
    );
  }

  Widget _signInText(BuildContext context){
    return Text(
      AppLocalizations.of(context)!.signInText,
      style:  TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25
      ),
    );
  }
  Widget _emailField(BuildContext context){
    return TextField(
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.emailText,
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
  Widget _passwordField(BuildContext context){
    return TextField(
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.passwordText,
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signUpText(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 30
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.notAMemberText,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14
            ),
          ),
          SizedBox(width: 5,),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
              },
              child: Text(AppLocalizations.of(context)!.registerNowText,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.lightBlue))
          ),
        ],
      ),
    );
  }
}
