import 'package:dot_know/common/widgets/appbar/app_bar.dart';
import 'package:dot_know/common/widgets/buttom/basic_app_button.dart';
import 'package:dot_know/core/configs/assets/app_vectors.dart';
import 'package:dot_know/data/models/auth/create_user_req.dart';
import 'package:dot_know/domain/usecases/auth/signup.dart';
import 'package:dot_know/presentation/auth/pages/signin.dart';
import 'package:dot_know/presentation/root/pages/root.dart';
import 'package:dot_know/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signInText(context),
      appBar: BasicAppBar(title: SvgPicture.asset(AppVectors.logo, height: 40, width: 40,)),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 50
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(context),
            SizedBox(height: 50,),
            _fullNameField(context),
            SizedBox(height: 20,),
            _emailField(context),
            SizedBox(height: 20,),
            _passwordField(context),
            SizedBox(height: 20,),
            BasicAppButton(
              onPressed: () async {
                var result = await sl<SignUpUseCase>().call(
                  params: CreateUserRequest(
                    fullName: _fullName.text.toString(),
                    email: _email.text.toString(),
                    password: _password.text.toString()
                  )
                );
                result.fold(
                  (l){
                    var snackBar = SnackBar(content: Text(l),);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  (r){
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (BuildContext context) => RootPage()),
                            (root) => false);
                  }
                );
              },
              title: AppLocalizations.of(context)!.createAccountText, height: 60,
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerText(BuildContext context){
    return Text(
      AppLocalizations.of(context)!.registerText,
      style:  TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25
      ),
    );
  }
  Widget _fullNameField(BuildContext context){
    return TextField(
      controller: _fullName,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.fullNameText,
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
  Widget _emailField(BuildContext context){
    return TextField(
      controller: _email,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.emailText,
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
  Widget _passwordField(BuildContext context){
    return TextField(
      controller: _password,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.passwordText,
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signInText(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 30
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.doYouHaveAccountText,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14
            ),
          ),
          SizedBox(width: 5,),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
            },
              child: Text(AppLocalizations.of(context)!.signInText,
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
