// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/constants/local_storage_constant.dart';
import 'package:mobx/mobx.dart';

import 'package:entregas/app/core/services/local/local_store_service.dart';

part 'route_controller.g.dart';

class RouteController = RouteControllerBase with _$RouteController;

abstract class RouteControllerBase with Store {
  final LocalStoreService localStoreService;
  RouteControllerBase({
    required this.localStoreService,
  });

  @observable
  String? route;

  @action
  routeGet() async {
    await localStoreService.get(LocalStorageConstant.routeKey).then(
      (value) {
        if (value != null) route = value;
      },
    );
  }

  @action
  routeUpdate(String value) async {
    await localStoreService.put(LocalStorageConstant.routeKey, value);
  }

  @action
  routeClean() async {
    await localStoreService.delete(LocalStorageConstant.routeKey);
  }
}
