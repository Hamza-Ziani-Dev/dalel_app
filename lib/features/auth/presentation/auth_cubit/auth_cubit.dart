// auth_cubit.dart

// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
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
  GlobalKey<FormState> signInFormKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();

// Sign Up:
  signUpUserWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignUpSuccessState());
      await addUserProfile();
      await verifyEmailAccount();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFieldState(
            errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFieldState(
            errorMessage: 'The account already exists for that email.'));
      } else if (e.code == 'invalid-email') {
        emit(SignUpFieldState(errorMessage: 'invalid email.'));
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

// Sign In :
  signInUserWithEmailAndPassword() async {
    try {
      emit(SignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFieldState(errorMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFieldState(
            errorMessage: 'Wrong password provided for that user.'));
      } else {
        emit(SignInFieldState(errorMessage: 'Check Email or Password'));
      }
    } catch (e) {
      emit(SignInFieldState(errorMessage: e.toString()));
    }
  }

// Verify Email Activer Account:
  verifyEmailAccount() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  // rest password with email:
  resetPasswordWithEmail() async {
    try {
      emit(ForgotPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ForgotPasswordSuccessState());
    } catch (e) {
      emit(ForgotPasswordFieldState(
          errorMessage: "Error sending password reset email: $e"));
    }
  }

  // Add User Profile
  addUserProfile() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.add({
      "first_name": firstName,
      "last_name": lastName,
      "email": emailAddress
    });
  }
}
