import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_firebase/controller/bloc_login/signState.dart';
import 'package:todolist_firebase/controller/bloc_login/signcubit.dart';
import 'package:todolist_firebase/shared_prefrence/sharedPreference.dart';
import 'package:todolist_firebase/view/pages/forgetpassword.dart';
import 'package:todolist_firebase/view/pages/signupscreen.dart';

import '../../constants.dart';
import '../widgets/Button.dart';
import '../widgets/textFormField.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    bool isLoading = false;
    return BlocConsumer<SignCubit, SignState>(
      listener: (context, state) {
        if (state is LoadingSignInState) {
          isLoading = true;
        } else if (state is SignInState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'welcome to TO DO !',
            ),
            backgroundColor: buColor,
          ));
          isLoading = false;
        } else if (state is SignErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
            backgroundColor: Colors.red,
          ));
          isLoading = false;
        }
      },
      builder: (context, state) {
        var controller = BlocProvider.of<SignCubit>(context);
        return SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          logo,
                          width: MediaQuery.of(context).orientation ==
                                  Orientation.landscape
                              ? MediaQuery.of(context).size.width / 4
                              : MediaQuery.of(context).size.width,
                        ),
                        Container(
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.landscape
                              ? MediaQuery.of(context).size.width / 3
                              : MediaQuery.of(context).size.width / 2,
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Expanded(
                                  child: MyTextField(
                                      message: 'email',
                                      controller: controller.emailController2,
                                      icon: Icons.email,
                                      text: 'Enter Your Email'),
                                ),
                                Expanded(
                                  child: MyTextField(
                                      message: 'password',
                                      controller: controller.passController2,
                                      icon: CupertinoIcons.lock_fill,
                                      text: 'Enter Your Password'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        MyButton(
                            label: 'SIGN IN',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                controller.signin(context);
                              }
                            }),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 12),
                          child: Container(
                            child: TextButton(
                              onPressed: () {
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const ForgetPassword()));
                              },
                              child: const Text('Forget Password?'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 12),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'I Don\'t have account',
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUpScreen()));
                                  },
                                  child: const Text('Sign Up'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
