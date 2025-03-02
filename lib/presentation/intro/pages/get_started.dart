import 'package:dot_know/common/widgets/buttom/basic_app_button.dart';
import 'package:dot_know/core/configs/assets/app_images.dart';
import 'package:dot_know/core/configs/assets/app_vectors.dart';
import 'package:dot_know/core/configs/theme/app_color.dart';
import 'package:dot_know/presentation/chose_mode/pages/choose_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: 46,
                horizontal: 40
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      AppImages.introBackground,
                    )
                )
            ),
          ),

          Container(
            color: Colors.black.withOpacity(0.15),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 40
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(
                        AppVectors.logo
                    ),
                  ),
                ),

                const Spacer(),
                Text(
                  AppLocalizations.of(context)!.introText,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18
                  ),
                ),
                const SizedBox(height: 21,),
                Text(
                  AppLocalizations.of(context)!.introSubText,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                      fontSize: 13
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
                BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => const ChooseModePage()
                          )
                      );
                    },
                    title: AppLocalizations.of(context)!.getStartedTextBtn, height: 80,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
