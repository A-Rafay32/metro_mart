import 'package:either_dart/either.dart';
import 'package:metro_mart/app/constants/apis_urls.dart';
import 'package:metro_mart/core/exceptions/exceptions.dart';
import 'package:metro_mart/core/services/http_service.dart';
import 'package:metro_mart/core/utils/types.dart';
import 'package:metro_mart/features/auth/models/user.dart';

class AuthRepository {
  
  FutureEither1<User> signIn(
      {required String email, required String password}) async {
    try {
      dynamic response = await HttpService().post(AuthApi.signIn,
          requestBody: {"email": email, "password": password});
      return Right(User.fromMap(response as Map<String, dynamic>));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither0 signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      await HttpService().post(AuthApi.signUp, requestBody: {});
      return Right(Success(message: "User signed in with $email"));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  FutureEither0 signOut() async {
    try {
      await HttpService().post(AuthApi.signOut, requestBody: {});
      return Right(Success(message: "User signed out"));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
