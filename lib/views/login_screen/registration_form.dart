import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reading_application_app/utils/util_function.dart';
import 'package:reading_application_app/utils/widgets/custom_elevatedbutton.dart';
import 'package:reading_application_app/utils/widgets/custom_heading.dart';
import 'package:reading_application_app/utils/widgets/custom_text_field.dart';
import 'package:reading_application_app/utils/widgets/custom_textbutton.dart';
import 'package:reading_application_app/views/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationForm extends StatelessWidget {
  RegistrationForm({Key? key}) : super(key: key);

  final FirebaseAuth auth = FirebaseAuth.instance;

  final _fName = TextEditingController();
  final _lName = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _phonenumber = TextEditingController();
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomHeading(text: "Registration"),
                const SizedBox(height: 24),
                CustomTextField(lable: "First Name", controller: _fName),
                const SizedBox(height: 24),
                CustomTextField(lable: "Last Name", controller: _lName),
                const SizedBox(height: 24),
                CustomTextField(lable: "UserName", controller: _username),
                const SizedBox(height: 24),
                CustomTextField(lable: "Password", controller: _password),
                const SizedBox(height: 24),
                CustomTextField(
                    lable: "Phone Number", controller: _phonenumber),
                const SizedBox(height: 24),
                CustomTextField(lable: "Email", controller: _email),
                const SizedBox(height: 24),
                CustomElevetedButton(
                    text: "Register",
                    onTap: () async {
                      if (validateFields()) {
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                            email: _email.text,
                            password: _password.text,
                          );
                          print(userCredential.user!.email);
                          Navigator.pop(context);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                      } else {
                        print("validation is error : ");
                      }
                    }),
                const SizedBox(height: 24),
                CustomTextButton(
                  text: "Already Have an Account",
                  onTap: () {
                    _fName.clear();
                    _lName.clear();
                    _email.clear();
                    _phonenumber.clear();
                    _username.clear();
                    _password.clear();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateFields() {
    if (_email.text.isEmpty ||
        _password.text.isEmpty ||
        _fName.text.isEmpty ||
        _lName.text.isEmpty ||
        _phonenumber.text.isEmpty ||
        _username.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
