// auth_cubit.dart

// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

// Define the authentication Cubit
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  late String? firstName;
  late String? lastName;
  late String? emailAddress;
  late String? password;
  bool? statusBox = false;
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  signUpUserWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFieldState(
            errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFieldState(
            errorMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(SignUpFieldState(errorMessage: e.toString()));
    }
  }

  // Update Status Check Box:
  updateStatusCheckBox({required val}) {
    statusBox = val;
    emit(StatusBox());
  }
}
