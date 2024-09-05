import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/modules/institute/presentation/controllers/institute/institute_controller.dart';
import 'package:entregas/app/modules/institute/presentation/widgets/products/my_list_product_by_institutes_widget.dart';
import 'package:entregas/uikit/atomic/atomic.dart';
import 'package:entregas/uikit/tokens/masks/mask.dart';
import 'package:entregas/uikit/tokens/sizes/scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailInstitutePage extends StatefulWidget {
  const DetailInstitutePage({super.key});

  @override
  State<DetailInstitutePage> createState() => _DetailInstitutePageState();
}

class _DetailInstitutePageState extends State<DetailInstitutePage> {
  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();
  final instituteController = Injector.get<InstituteController>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    if (arguments != null) {
      instituteController.detail(arguments['instituteId']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: kToolbarHeight,
        title: Observer(
          builder: (context) {
            final model = instituteController.institute;

            if (instituteController.isLoading) {
              return const CircularProgressIndicator();
            }

            return HeadlineText(text: model!.name);
          },
        ),
        leading: IconButtonDefault(
          icon: const Icon(Icons.arrow_back),
          tooltipText: TextConstant.back,
          onPressed: () async {
            await routeController.routeUpdate('/home');
            await routeController.routeGet();
            Navigator.of(context)
                .pushReplacementNamed(routeController.route.toString());
          },
        ),
      ),
      body: Observer(
        builder: (context) {
          final model = instituteController.institute;

          if (instituteController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: BodyDefault(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    model!.image,
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: Scale.sm,
                  ),
                  LabelText(text: model.description),
                  const SizedBox(
                    height: Scale.xxs,
                  ),
                  LabelText(
                    text: model.complement.toString(),
                  ),
                  const SizedBox(
                    height: Scale.xxs,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => launchUrl(
                          Uri.parse(
                              'http://wa.me/55${model.whatsapp}?text=${TextConstant.storeWhatsapp(model.name)}'),
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/whatsapp.png',
                                  height: Scale.md,
                                  width: Scale.md,
                                ),
                                const SizedBox(
                                  height: Scale.xxs,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: Scale.xxs,
                            ),
                            LabelText(
                                text:
                                    "${Mask.formatPhoneNumber(model.whatsapp)} | "),
                          ],
                        ),
                      ),
                      Expanded(
                        child: LabelText(
                            text:
                                "${model.city} | ${model.number == null ? 'S/N' : 'Nº ${model.number}'}"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Scale.xxs,
                  ),
                  SingleChildScrollView(
                      child: MyListProductByInstitutesWidget(id: model.id, )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
