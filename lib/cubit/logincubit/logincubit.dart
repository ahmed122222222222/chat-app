import 'package:chat/cubit/logincubit/loginstate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class lcubit extends Cubit<loginstate> {
  lcubit() : super(inital());
  Future<void> loginUser({required email, required password}) async {
    emit(loading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      emit(loginsucess());
    } catch (ex) {
      emit(faliure());
    }
  }
}
