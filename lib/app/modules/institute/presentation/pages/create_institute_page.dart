import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/core/controllers/upload/upload_controller.dart';
import 'package:entregas/app/core/dtos/institute/institute_save_dto.dart';
import 'package:entregas/app/modules/institute/presentation/controllers/institute/institute_controller.dart';
import 'package:entregas/app/modules/institute/presentation/widgets/institute/create_form_institute_widget.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class CreateInstitutePage extends StatefulWidget {
  const CreateInstitutePage({super.key});

  @override
  State<CreateInstitutePage> createState() => _CreateInstitutePageState();
}

class _CreateInstitutePageState extends State<CreateInstitutePage>
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
        title: HeadlineText(text: TextConstant.newInstitute),
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
                            child: CreateFormInstituteWidget(
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
                                          false) &&
                                      uploadController.imageFile != null) {
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
                                      await instituteController.register(
                                          model, uploadController.imageFile!);
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
