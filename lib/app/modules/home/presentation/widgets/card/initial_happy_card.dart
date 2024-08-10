import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/user/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InitialHappyCard extends StatefulWidget {
  const InitialHappyCard({super.key});

  @override
  State<InitialHappyCard> createState() => _InitialHappyCardState();
}

class _InitialHappyCardState extends State<InitialHappyCard> {
  final userController = Injector.get<UserController>();

  @override
  void initState() {
    super.initState();
    userController.detail();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardDefault(
            child: Padding(
              padding: const EdgeInsets.all(Scale.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Observer(
                    builder: (_) {
                      return HeadlineText(
                        text:
                            "${TextConstant.hello}, ${userController.user?.name}!",
                      );
                    },
                  ),
                  const DividerDefault(),
                  const SizedBox(
                    height: Scale.xxs,
                  ),
                  LabelText(
                    text: TextConstant.happyMessage,
                  ),
                  LabelText(
                    text: TextConstant.happyQuestion,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: Scale.xs,
          ),
          CardDefault(
            borderRadius: Scale.xl,
            child: Padding(
              padding: const EdgeInsets.all(
                Scale.xs,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 30,
                            child: SmallButton(
                              text: TextConstant.myLocations,
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(
                            width: Scale.xs,
                          ),
                          SizedBox(
                            height: 30,
                            child: SmallButton(
                              text: TextConstant.products,
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(
                            width: Scale.xs,
                          ),
                          SizedBox(
                            height: 30,
                            child: SmallButton(
                              text: TextConstant.services,
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(
                            width: Scale.xs,
                          ),
                          SizedBox(
                            height: 30,
                            child: SmallButton(
                              text: TextConstant.support,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: Scale.xxs, bottom: Scale.xxs),
                    child: Image.asset(
                      "assets/images/favicon.png",
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
