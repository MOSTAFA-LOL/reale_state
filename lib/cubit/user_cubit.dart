import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate/cubit/user_state.dart';
import 'package:realestate/newapi/api_service.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  final ApiService _apiService = ApiService();

  final signInFormKey = GlobalKey<FormState>();
  final signInEmail = TextEditingController();
  final signInPassword = TextEditingController();

  final signUpFormKey = GlobalKey<FormState>();
  final signUpEmail = TextEditingController();
  final signUpPassword = TextEditingController();

  Future<void> signIn() async {
    if (!signInFormKey.currentState!.validate()) {
      return;
    }

    emit(SignInLoading());
    try {
      final response = await _apiService.signIn(
        signInEmail.text,
        signInPassword.text,
      );
      emit(SignInSuccess(response.data['token']));
    } catch (e) {
      emit(SignInFailure(
          e.toString())); // e.g., "Failed host lookup: 'your-api-base-url.com'"
    }
  }

  Future<void> signUp() async {
    if (!signUpFormKey.currentState!.validate()) {
      return;
    }

    emit(SignUpLoading());
    try {
      final response = await _apiService.signUp(
        signUpEmail.text,
        signUpPassword.text,
      );
      emit(SignUpSuccess(response.data['token']));
    } catch (e) {
      emit(SignUpFailure(
          e.toString())); // e.g., "Failed host lookup: 'your-api-base-url.com'"
    }
  }
}
