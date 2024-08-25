import 'package:entregas/app/modules/home/presentation/controllers/institute/institute_controller.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StoreListView extends StatefulWidget {
  const StoreListView({super.key});

  @override
  State<StoreListView> createState() => _StoreListViewState();
}

class _StoreListViewState extends State<StoreListView> {
  final instituteController = Injector.get<InstituteController>();

  @override
  void initState() {
    super.initState();
    instituteController.init();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Observer(builder: (context) {
        final institutePageDto = instituteController.instituteListPage;
        if (institutePageDto == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            itemCount:
                institutePageDto.instituteDto.length,
            shrinkWrap: false,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final model =
                  institutePageDto.instituteDto[index];
              return Padding(
                padding: const EdgeInsets.only(left: Scale.xs),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: LightColors.tertiary,
                      width: 2,
                    ),
                    color: LightColors.tertiary,
                    image: DecorationImage(
                      image: NetworkImage(model.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            });
      }),
    );
  }
}
