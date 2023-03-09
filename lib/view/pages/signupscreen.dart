import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:todolist_firebase/controller/bloc_login/signState.dart';
import 'package:todolist_firebase/controller/bloc_login/signcubit.dart';
import 'package:todolist_firebase/view/pages/signinscreen.dart';
import 'package:todolist_firebase/view/widgets/Button.dart';
import 'package:todolist_firebase/view/widgets/textFormField.dart';

import '../../constants.dart';
import '../../shared_prefrence/sharedPreference.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    bool isLoading = false;
    return BlocConsumer<SignCubit, SignState>(
      listener: (context, state) {
        if (state is LoadingSignUpState) {
          isLoading = true;
        } else if (state is SignUpState) {
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
                        SizedBox(
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
                                      controller: controller.emailController,
                                      icon: Icons.email,
                                      text: 'Enter Your Email'),
                                ),
                                Expanded(
                                  child: MyTextField(
                                      message: 'password',
                                      controller: controller.passwordController,
                                      icon: CupertinoIcons.lock_fill,
                                      text: 'Enter Your Password'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        MyButton(
                            label: 'SIGN UP',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                controller.signUp(context);
                              }
                              //sava data
                            }),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'I Already have account',
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignInScreen()));
                                },
                                child: const Text('Sign In'),
                              )
                            ],
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
