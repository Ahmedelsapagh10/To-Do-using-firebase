import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:todolist_firebase/view/pages/signupscreen.dart';

import '../../constants.dart';
import '../widgets/Button.dart';
import '../widgets/textFormField.dart';
import 'homeScreen.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController forgetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.lock_rotation_open,
                  color: buColor,
                  shadows: [
                    BoxShadow(
                      offset: const Offset(5, 3),
                      blurRadius: 10,
                      color: Colors.grey.shade300,
                    )
                  ],
                  size: 150,
                ),
                Container(
                  child: MyTextField(
                      message: 'email/phone',
                      controller: forgetController,
                      icon: CupertinoIcons.lock_fill,
                      text: 'Enter Phone / Email'),
                ),
                MyButton(
                    label: 'Forget Password',
                    onTap: () {
                      //   setState(() {});
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage(
                                    email: forgetController.text,
                                  )));

                      ///@implment
                      //Create account
                      //Nav to HomeScreen
                    }),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
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
    );
    ;
  }
}
