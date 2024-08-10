// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:entregas/app/core/constants/local_storage_constant.dart';
import 'package:entregas/app/core/services/client/client_service.dart';
import 'package:entregas/app/core/services/local/local_store_service.dart';

class ClientServiceImpl implements ClientService {
  final Dio dio;
  final LocalStoreService localStoreService;

  ClientServiceImpl(
    this.localStoreService,
  ) : dio = Dio() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (options.extra['requiredAuth'] == true) {
            final accessToken =
                await localStoreService.get(LocalStorageConstant.authKey);
            if (accessToken != null) {
               options.headers['Authorization'] = 'Bearer $accessToken';
            }
          }
          return handler.next(options);
        },
      ),
    );
  }

  @override
  Future get(String url, {bool requiresAuth = true, String contentType = Headers.jsonContentType}) async {
    return await dio.get(url,
        options: Options(extra: {'requiredAuth': requiresAuth}, contentType: contentType));
  }

  @override
  Future post(String url, Object data,
      {String contentType = Headers.jsonContentType}) async {
    return await dio.post(url,
        data: data, options: Options(contentType: contentType));
  }

  @override
  Future put(String url, Object data,
      {String contentType = Headers.jsonContentType}) async {
    return await dio.put(url,
        data: data, options: Options(contentType: contentType));
  }
}
