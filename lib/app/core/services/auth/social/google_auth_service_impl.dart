// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:entregas/app/core/constants/api_constant.dart';
import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/exceptions/rest_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:entregas/app/core/constants/google_constant.dart';
import 'package:entregas/app/core/dtos/user_save_dto.dart';
import 'package:entregas/app/core/services/client/client_service.dart';

import 'social_auth_service.dart';

class GoogleAuthServiceImpl implements SocialAuthService {
  final ClientService clientService;
  GoogleAuthServiceImpl({
    required this.clientService,
  });
  final googleSignIn = GoogleSignIn(clientId: GoogleConstant.clientId);

  @override
  Future<UserSaveDto> login() async {
    try {
      final GoogleSignInAccount? googleCredentials =
          await googleSignIn.signIn();
      final UserSaveDto model = UserSaveDto(
          name: googleCredentials!.displayName!,
          email: googleCredentials.email,
          image: googleCredentials.photoUrl);
      return await clientService.post(ApiConstant.userLogin, model.toJson());
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        await logout();
        throw RestException(TextConstant.accountValidationError, e.hashCode, e.response);
      } else if (e.response?.statusCode == 403) {
        await logout();
        throw RestException(e.message.toString(), e.hashCode, e.response);
      }
      await logout();
      throw RestException(TextConstant.serverError, e.hashCode, e.response);
    }
  }

  @override
  Future logout() async {
    await googleSignIn.signOut();
    await googleSignIn.disconnect();
  }

  @override
  Future<UserSaveDto> register() {
    // TODO: implement register
    throw UnimplementedError();
  }
}
