import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reading_application_app/utils/util_function.dart';
import 'package:reading_application_app/utils/widgets/custom_elevatedbutton.dart';
import 'package:reading_application_app/utils/widgets/custom_heading.dart';
import 'package:reading_application_app/utils/widgets/custom_text_field.dart';
import 'package:reading_application_app/utils/widgets/custom_textbutton.dart';
import 'package:reading_application_app/views/home_screen/home_screen.dart';
import 'package:reading_application_app/views/login_screen/registration_form.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final FirebaseAuth auth = FirebaseAuth.instance;

  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomHeading(text: "Sign In"),
            const SizedBox(
              height: 48.0,
            ),
            CustomTextField(
              lable: "Email",
              controller: _email,
            ),
            const SizedBox(
              height: 24.0,
            ),
            CustomTextField(
              lable: "Password",
              isObsecure: true,
              controller: _password,
            ),
            const SizedBox(
              height: 24.0,
            ),
            CustomElevetedButton(
                text: "Sign in",
                onTap: () async {
                  // send data to firebase
                  if (validateFields()) {
                    try {
                      UserCredential userCredential =
                          await auth.signInWithEmailAndPassword(
                        email: _email.text,
                        password: _password.text,
                      );
                      if (userCredential.user != null) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.SUCCES,
                          animType: AnimType.TOPSLIDE,
                          title: 'Success',
                          desc: 'Successfully Logged',
                          btnOkOnPress: () {
                            _email.clear();
                            _password.clear();
                            UtilFunctions.navigateTo(
                                context, const HomeScreen());
                          },
                        ).show();
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Wrong Email',
                          desc: 'Please Enter Valid Email',
                          btnOkOnPress: () {},
                        ).show();
                      } else if (e.code == 'wrong-password') {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Wrong Password',
                          desc: 'Please Enter Valid Password',
                          btnOkOnPress: () {},
                        ).show();
                      }
                    }
                  } else {}
                }),
            const SizedBox(
              height: 24.0,
            ),
            CustomTextButton(
              text: "Create an Account?",
              onTap: () {
                _email.clear();
                _password.clear();
                UtilFunctions.navigateTo(context, RegistrationForm());
              },
            ),
          ],
        ),
      ),
    );
  }

  bool validateFields() {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      return false;
    } else if (!_email.text.contains("@")) {
      return false;
    } else {
      return true;
    }
  }
}
