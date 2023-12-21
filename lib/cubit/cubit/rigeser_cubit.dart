import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'rigeser_state.dart';

class RigeserCubit extends Cubit<RigeserState> {
  RigeserCubit() : super(RigeserInitial());
  Future<void> registerUser({required email, required password}) async {
    emit(loading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      emit(sucess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
       emit(failuer(errmass: 'weak password'));
      } else if (ex.code == 'email-already-in-use') {
      emit(failuer(errmass: 'email already exists'));
      }
    } catch (ex) {
      emit(failuer(errmass: "there was an erro"));
    }
  }
}
