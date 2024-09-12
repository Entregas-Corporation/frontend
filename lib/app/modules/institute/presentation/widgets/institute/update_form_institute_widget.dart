// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:entregas/app/core/controllers/upload/upload_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UpdateFormInstituteWidget extends StatelessWidget {
final void Function() onTap;
  final TextEditingController nameEC;
  final TextEditingController decriptionEC;
  final TextEditingController whatsappEC;
  final TextEditingController costPerShippingEC;
  final TextEditingController residenceNumberEC;
  final TextEditingController complementEC;

  UpdateFormInstituteWidget({
    super.key,
    required this.onTap,
    required this.nameEC,
    required this.decriptionEC,
    required this.whatsappEC,
    required this.costPerShippingEC,
    required this.residenceNumberEC,
    required this.complementEC,
  });

  final uploadController = Injector.get<UploadController>();
  
   @override
   Widget build(BuildContext context) {
       return Column(
      children: [
        const SizedBox(
          height: Scale.sm,
        ),
        Observer(
          builder: (context) {
            if (uploadController.imageFile != null) {
              if (kIsWeb) {
                return Container(
                  color: LightColors.tertiary,
                  height: 120,
                  width: double.infinity,
                  child: CardDefault(
                    onTap: onTap,
                    borderRadius: Scale.xs,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          uploadController.imageFile!.path,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Column(
                                    children: [
                                      Icon(Icons.file_upload_outlined),
                                      SizedBox(
                                        height: Scale.xs,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: Scale.xxs,
                                  ),
                                  LabelText(text: TextConstant.uploadImage),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Container(
                  color: LightColors.tertiary,
                  height: 120,
                  width: double.infinity,
                  child: CardDefault(
                    onTap: onTap,
                    borderRadius: Scale.xs,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.file(
                          uploadController.imageFile as File,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Column(
                                    children: [
                                      Icon(Icons.file_upload_outlined),
                                      SizedBox(
                                        height: Scale.xs,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: Scale.xxs,
                                  ),
                                  LabelText(text: TextConstant.uploadImage),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            } else {
              return Container(
                color: LightColors.tertiary,
                height: 120,
                width: double.infinity,
                child: CardDefault(
                  onTap: onTap,
                  borderRadius: Scale.xs,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Column(
                            children: [
                              Icon(Icons.file_upload_outlined),
                              SizedBox(
                                height: Scale.xs,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: Scale.xxs,
                          ),
                          LabelText(text: TextConstant.uploadImage),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
        const SizedBox(
          height: Scale.xs,
        ),
        FormInput(
          controller: nameEC,
          text: TextConstant.name,
        ),
        const SizedBox(
          height: Scale.xs,
        ),
        FormInput(
          controller: decriptionEC,
          text: TextConstant.description,
          maxLines: 3,
        ),
        const SizedBox(
          height: Scale.xs,
        ),
        FormInput(
          controller: complementEC,
          text: TextConstant.complement,
          maxLines: 2,
        ),
        const SizedBox(
          height: Scale.xs,
        ),
        FormInput(
          controller: residenceNumberEC,
          text: TextConstant.residenceNumber,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        const SizedBox(
          height: Scale.xs,
        ),
        FormInput(
          controller: whatsappEC,
          text: TextConstant.whatsapp,
          inputFormatters: Mask.phoneInput,
        ),
        const SizedBox(
          height: Scale.xs,
        ),
        FormInput(
          inputFormatters: Mask.currencyInput,
          keyBoardType: const TextInputType.numberWithOptions(decimal: true),
          controller: costPerShippingEC,
          text: TextConstant.costPerShipping,
          prefix: LabelText(text: TextConstant.coin),
          suffix: LabelText(text: TextConstant.perKm),
        ),
      ],
    );
  }
}
