import 'package:entregas/app/core/constants/social_constant.dart';
import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/uikit/atomic/molecules/text/footer_text.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterDefault extends StatelessWidget {
  const FooterDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(Scale.md, Scale.xs, Scale.md, Scale.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FooterText(text: "© ${DateTime.now().year} Entregas | ${TextConstant.developmentBy} "),
          InkWell(
              onTap: () => launchUrl(
                    Uri.parse(SocialConstant.linkedin),
                  ),
              child: const FooterText(
                text: "Homolazarus",
                color: LightColors.onBackground,
              ))
        ],
      ),
    );
  }
}
