import 'package:dartz/dartz.dart';
import 'package:dot_know/data/models/auth/create_user_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserRequest createUserRequest);

  Future<void> signin();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserRequest createUserRequest) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserRequest.email,
          password: createUserRequest.password);

      return Right('Signup was Successful');

    } on FirebaseAuthException catch(e) {
      String message = "";
      if(e.code == 'week-password'){
        message = 'The password provided is to week';
      } else if (e.code == 'email-already-in-use'){
        message = 'An account already exists with that email.';
      }
      return Left(message);
    }
  }

}