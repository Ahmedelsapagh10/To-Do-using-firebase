import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_firebase/controller/bloc_login/signState.dart';
import 'package:todolist_firebase/view/pages/signinscreen.dart';

import '../../shared_prefrence/sharedPreference.dart';
import '../../view/pages/homeScreen.dart';

class SignCubit extends Cubit<SignState> {
  SignCubit() : super(InitStateSign());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController2 = TextEditingController();
  TextEditingController passController2 = TextEditingController();

  signUp(BuildContext context) async {
    emit(LoadingSignUpState());
    try {
      final User = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(email: emailController.text)));
      user = emailController.text;
      setEmail();

      emit(SignUpState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignErrorState('weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignErrorState('email-already-in-use'));
      }
      // emit(SignErrorState(e.toString()));
    } catch (e) {
      emit(SignErrorState(e.toString()));
    }
  }

  signin(BuildContext context) async {
    emit(LoadingSignInState());
    try {
      final User = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController2.text, password: passController2.text);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(email: emailController2.text)));
      user = emailController2.text;
      setEmail();

      emit(SignInState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignErrorState('user-not-found'));
      } else if (e.code == 'wrong-password') {
        emit(SignErrorState('wrong-password'));
      }
    } catch (e) {
      emit(SignErrorState(e.toString()));
    }
  }

  // signOut(BuildContext context) async {
  //   await FirebaseAuth.instance.signOut();
  //   // ignore: use_build_context_synchronously
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => const SignInScreen()));
  //   emit(SignOutState());
  // }
}
