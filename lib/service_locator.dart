import 'package:dot_know/data/repository/auth/auth_repository_impl.dart';
import 'package:dot_know/data/sources/auth/auth_firebase_service.dart';
import 'package:dot_know/domain/repository/auth/auth.dart';
import 'package:dot_know/domain/usecases/auth/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies()  async {

  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );

  sl.registerSingleton<AuthRepository>(
      AuthRepositoryImpl()
  );

  sl.registerSingleton<SignUpUseCase>(
      SignUpUseCase()
  );
}