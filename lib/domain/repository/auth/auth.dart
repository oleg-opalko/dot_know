import 'package:dartz/dartz.dart';
import 'package:dot_know/data/models/auth/create_user_req.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserRequest createUserRequest);

  Future<void> signin();

}