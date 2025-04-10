import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realestate/cubit/user_cubit.dart';
import 'package:realestate/cubit/user_state.dart';
import 'package:realestate/provider/imagepick.dart';
import 'package:realestate/screans/tap_screan.dart';

class AuthScrean extends StatefulWidget {
  const AuthScrean({super.key});

  @override
  State<AuthScrean> createState() => _AuthScreanState();
}

class _AuthScreanState extends State<AuthScrean> {
  var _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is SignInSuccess || state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("تم بنجاح")),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const TapScrean()),
            );
          } else if (state is SignInFailure || state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state is SignInFailure
                    ? state.errMessage
                    : (state as SignUpFailure).errMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(108, 125, 164, 236),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  width: 120,
                  child: Image.asset('assets/images/R.png'),
                ),
                Card(
                  margin: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: _isLogin
                            ? context.read<UserCubit>().signInFormKey
                            : context.read<UserCubit>().signUpFormKey,
                        child: Column(
                          children: [
                            if (!_isLogin) const Imagepick(),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'البريد الالكتروني',
                              ),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              controller: _isLogin
                                  ? context.read<UserCubit>().signInEmail
                                  : context.read<UserCubit>().signUpEmail,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty ||
                                    !value.contains("@")) {
                                  return "من فضلك الحساب غير صحيح";
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'الرقم السري',
                              ),
                              controller: _isLogin
                                  ? context.read<UserCubit>().signInPassword
                                  : context.read<UserCubit>().signUpPassword,
                              validator: (value) {
                                if (value == null || value.trim().length < 6) {
                                  return 'كلمة المرور يجب أن تكون 6 حروف على الأقل';
                                }
                                return null;
                              },
                              obscureText: true,
                            ),
                            const SizedBox(height: 12),
                            if (state is SignInLoading ||
                                state is SignUpLoading)
                              const CircularProgressIndicator()
                            else
                              ElevatedButton(
                                onPressed: () {
                                  
                                  if (_isLogin) {
                                    context.read<UserCubit>().signIn();
                                  } else {
                                    context.read<UserCubit>().signUp();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                                child: Text(
                                  _isLogin ? 'تسجيل الدخول' : 'إنشاء حساب',
                                ),
                              ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(
                                _isLogin ? 'إنشاء حساب' : 'لدي حساب بالفعل',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
