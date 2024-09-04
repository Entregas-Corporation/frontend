// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:entregas/app/core/dtos/productCategory/product_category_detail_dto.dart';
import 'package:entregas/app/modules/product/controllers/productCategory/product_category_controller.dart';
import 'package:entregas/app/modules/product/presentation/widgets/product_category_dropdown_widget.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:entregas/app/core/controllers/upload/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../../uikit/uikit.dart';
import '../../../../core/constants/text_constant.dart';

class CreateFormProductWidget extends StatefulWidget {
  final void Function() onTap;
  final TextEditingController nameEC;
  final TextEditingController decriptionEC;
  final TextEditingController priceEC;
  final TextEditingController quantityEC;

  const CreateFormProductWidget({
    super.key,
    required this.onTap,
    required this.nameEC,
    required this.decriptionEC,
    required this.priceEC,
    required this.quantityEC,
  });

  @override
  State<CreateFormProductWidget> createState() =>
      _CreateFormProductWidgetState();
}

class _CreateFormProductWidgetState extends State<CreateFormProductWidget> {
  final uploadController = Injector.get<UploadController>();

  final productCategoryController = Injector.get<ProductCategoryController>();

  @override
  void initState() {
    super.initState();
    productCategoryController.init().then((_) {
      list();
      setState(() {});
    });
  }

  List<String> productCategoryList = [];

  list() {
    if (productCategoryController.productListPage?.productCategoryDto != null) {
      for (ProductCategoryDetailModel element
          in productCategoryController.productListPage!.productCategoryDto) {
        productCategoryList.add(element.name);
      }
    }
  }

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
                    onTap: widget.onTap,
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
                    onTap: widget.onTap,
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
                  onTap: widget.onTap,
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
          controller: widget.nameEC,
          text: TextConstant.name,
          validator: Validatorless.multiple([
            Validatorless.required(
              TextConstant.requiredField,
            ),
            Validatorless.max(
              255,
              TextConstant.maxCaracters,
            ),
          ]),
        ),
        const SizedBox(
          height: Scale.xs,
        ),
        FormInput(
          controller: widget.decriptionEC,
          text: TextConstant.description,
          maxLines: 3,
          validator: Validatorless.multiple([
            Validatorless.required(
              TextConstant.requiredField,
            ),
          ]),
        ),
        const SizedBox(
          height: Scale.xs,
        ),
        Row(
          children: [
            Expanded(
              child: FormInput(
                controller: widget.quantityEC,
                text: TextConstant.quantity,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            const SizedBox(
              width: Scale.xs,
            ),
            Expanded(
              child: FormInput(
                inputFormatters: Mask.currencyInput,
                keyBoardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: widget.priceEC,
                text: TextConstant.price,
                prefix: LabelText(text: TextConstant.coin),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: Scale.xs,
        ),
        ProductCategoryDropdown(),
      ],
    );
  }
}
