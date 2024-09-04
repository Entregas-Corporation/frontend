import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/core/controllers/upload/upload_controller.dart';
import 'package:entregas/app/core/dtos/product/product_save_dto.dart';
import 'package:entregas/app/modules/product/controllers/product/product_controller.dart';
import 'package:entregas/app/modules/product/controllers/productCategory/product_category_controller.dart';
import 'package:entregas/app/modules/product/presentation/widgets/create_form_product_widget.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();
  final uploadController = Injector.get<UploadController>();
  final productCategoryController = Injector.get<ProductCategoryController>();
  final productController = Injector.get<ProductController>();

  final globalKeyFormEC = GlobalKey<FormState>();

  final nameEC = TextEditingController();
  final descriptionEC = TextEditingController();
  final priceEC = TextEditingController();
  final quantityEC = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  String instituteIdArgs = "";

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      uploadController.setImage(XFile(pickedFile.path));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    if (arguments != null && arguments.containsKey('instituteId')) {
      instituteIdArgs = arguments['instituteId'];
    } else {
      instituteIdArgs = '';
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
        body: Column(
          children: [
            Form(
              key: globalKeyFormEC,
              child: CreateFormProductWidget(
                onTap: () => _pickImage(),
                nameEC: nameEC,
                decriptionEC: descriptionEC,
                priceEC: priceEC,
                quantityEC: quantityEC,
              ),
            ),
            const SizedBox(
              height: Scale.xs,
            ),
            SizedBox(
              width: double.infinity,
              child: Observer(builder: (context) {
                if (productController.isLoading) {
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
                    if ((globalKeyFormEC.currentState?.validate() ?? false) &&
                        uploadController.imageFile != null) {
          
                      ProductSaveDto model = ProductSaveDto(
                        name: nameEC.text,
                        description: descriptionEC.text,
                        price: double.parse(priceEC.text),
                        quantity: int.parse(quantityEC.text),
                        institute: instituteIdArgs,
                        category: productCategoryController.productCatgoryItem
                            .toString(),
                        
                      );
                      try {
                        await productController.register(
                            model, uploadController.imageFile!);
                      } finally {
                        if (productController.isLoading == false) {
                          await routeController.routeUpdate('/home');
                          Navigator.of(context).pushReplacementNamed(
                              routeController.route.toString());
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
    );
  }
}
