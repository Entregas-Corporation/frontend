// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/core/controllers/upload/upload_controller.dart';
import 'package:entregas/app/core/dtos/institute/institute_save_dto.dart';
import 'package:entregas/app/modules/institute/presentation/controllers/institute/institute_controller.dart';
import 'package:entregas/app/modules/institute/presentation/widgets/institute/update_form_institute_widget.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';

import 'package:entregas/app/core/dtos/institute/institute_detail_dto.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';

class UpdateInstitutePage extends StatefulWidget {
  final InstituteDetailDto model;
  const UpdateInstitutePage({
    super.key,
    required this.model,
  });

  @override
  State<UpdateInstitutePage> createState() => _UpdateInstitutePageState();
}

class _UpdateInstitutePageState extends State<UpdateInstitutePage>
    with SingleTickerProviderStateMixin {
  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();
  final instituteController = Injector.get<InstituteController>();
  final uploadController = Injector.get<UploadController>();

  late TabController _tabController;

  final globalKeyFormEC = GlobalKey<FormState>();

  final nameEC = TextEditingController();
  final descriptionEC = TextEditingController();
  final whatsappEC = TextEditingController();
  final costPerShippingEC = TextEditingController();
  final cityEC = TextEditingController();
  final latituteEC = TextEditingController();
  final longitudeEC = TextEditingController();
  final numberEC = TextEditingController();
  final complementEC = TextEditingController();
  final residenceNumberEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    nameEC.text = widget.model.name;
    descriptionEC.text = widget.model.description;
    whatsappEC.text = widget.model.whatsapp;
    costPerShippingEC.text = widget.model.freight_cost_km.toString();
    cityEC.text = widget.model.city;
    latituteEC.text = widget.model.latitude;
    longitudeEC.text = widget.model.longitude;
    numberEC.text = widget.model.number.toString();
    complementEC.text = widget.model.complement.toString();
    residenceNumberEC.text = widget.model.number.toString();
  }

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      uploadController.setImage(XFile(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: kToolbarHeight,
        title: HeadlineText(text: TextConstant.updateInstitute),
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
      body: BodyDefault(
        body: SizedBox(
          height: MediaQuery.of(context).size.height - 120,
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                labelPadding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                dividerColor: LightColors.tertiary,
                tabs: [
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.all(Scale.xs),
                      child: Center(
                        child: LabelText(text: TextConstant.location),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.all(Scale.xs),
                      child: Center(
                        child: LabelText(text: TextConstant.institute),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    CardDefault(
                      borderRadius: Scale.xs,
                      child: OpenStreetMapSearchAndPick(
                        onPicked: (pickedData) {
                          cityEC.text = pickedData.city;
                          latituteEC.text =
                              pickedData.latLong.latitude.toString();
                          longitudeEC.text =
                              pickedData.latLong.longitude.toString();
                        },
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Form(
                            key: globalKeyFormEC,
                            child: UpdateFormInstituteWidget(
                              onTap: () => _pickImage(),
                              nameEC: nameEC,
                              decriptionEC: descriptionEC,
                              whatsappEC: whatsappEC,
                              costPerShippingEC: costPerShippingEC,
                              complementEC: complementEC,
                              residenceNumberEC: residenceNumberEC,
                            ),
                          ),
                          const SizedBox(
                            height: Scale.xs,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Observer(builder: (context) {
                              if (instituteController.isLoading) {
                                return const ProgressButton(
                                  child: SizedBox(
                                    height: Scale.sm,
                                    width: Scale.sm,
                                    child: CircularProgressIndicator(
                                      color: LightColors.background,
                                    ),
                                  ),
                                );
                              }
                              return ProgressButton(
                                text: TextConstant.save,
                                onPressed: () async {
                                  if ((globalKeyFormEC.currentState
                                          ?.validate() ??
                                      false)) {
                                    String whatsapp =
                                        Mask.removeAllMask(whatsappEC.text);

                                    InstituteSaveDto model = InstituteSaveDto(
                                      name: nameEC.text,
                                      description: descriptionEC.text,
                                      city: cityEC.text,
                                      longitude: longitudeEC.text,
                                      latitude: latituteEC.text,
                                      whatsapp: whatsapp,
                                      freight_cost_km:
                                          double.parse(costPerShippingEC.text),
                                      user: authController.idUser.toString(),
                                      number: int.parse(residenceNumberEC.text),
                                      complement: complementEC.text,
                                    );
                                    try {
                                      await instituteController.update(
                                          model,
                                          uploadController.imageFile,
                                          widget.model.id);
                                    } finally {
                                      if (instituteController.isLoading ==
                                          false) {
                                        uploadController.removeImage();
                                        Navigator.of(context)
                                            .pushReplacementNamed('/home');
                                      }
                                    }
                                  }
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
