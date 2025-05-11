import 'package:dartz/dartz.dart';
import 'package:dot_know/data/models/auth/create_user_req.dart' show CreateUserRequest;
import 'package:dot_know/data/sources/auth/auth_firebase_service.dart';
import 'package:dot_know/domain/repository/auth/auth.dart';
import 'package:dot_know/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository{


  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserRequest createUserRequest) async {
    return await sl<AuthFirebaseService>().signup(createUserRequest);
  }

}