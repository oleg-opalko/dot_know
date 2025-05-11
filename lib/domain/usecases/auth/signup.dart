import 'package:dartz/dartz.dart';
import 'package:dot_know/core/usecase/usecase.dart';
import 'package:dot_know/data/models/auth/create_user_req.dart';
import 'package:dot_know/domain/repository/auth/auth.dart';
import 'package:dot_know/service_locator.dart';

class SignUpUseCase implements UserCase<Either,CreateUserRequest> {

  @override
  Future<Either> call({CreateUserRequest ? params}) {
    return sl<AuthRepository>().signup(params!);
  }
}