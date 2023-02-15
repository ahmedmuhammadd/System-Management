import 'package:flutter/material.dart';
import 'package:system_mangment/modules/auth/register/page/register.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/widgets/submit_button.dart';
import '../../../../shared/widgets/text_form_field.dart';
import '../../widgets/header_container.dart';
import '../../widgets/page_name.dart';
import '../services/login_services.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'LoginScreen';
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double height = 0;
  double width = 0;
  TextEditingController emailController;
  TextEditingController passwordController;
  GlobalKey<FormState> formKey;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            formKey.currentState.reset();
          },
          child: AnimatedDefaultTextStyle(
            style: TextStyle(
              fontSize: width / 18,
              color: Colors.black,
            ),
            duration: const Duration(microseconds: 1),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  PageHeaderWidget(height: height, width: width),
                  PageNameWidget(
                    width: width,
                    height: height,
                    pageText: "LOGIN",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SizedBox(
                      child: MainTextFormField(
                        validation: (value) {
                          if (value.isEmpty) {
                            return 'email is to short';
                          }
                        },
                        controller: emailController,
                        focusedBorderColor: Constants.color,
                        screenWidth: width,
                        icon: Icons.perm_identity,
                        labelText: 'email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SizedBox(
                      child: MainTextFormField(
                        validation: (value) {
                          if (value.isEmpty) {
                            return 'password is to short';
                          }
                        },
                        controller: passwordController,
                        focusedBorderColor: Constants.color,
                        screenWidth: width,
                        icon: Icons.lock_outline,
                        obscureText: true,
                        labelText: 'password',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SizedBox(
                        child: MainSubmitButton(
                      onTap: () {
                        if (formKey.currentState.validate()) {
                          LoginServices().loginSubmit(
                            context: context,
                            password: passwordController.text,
                            email: emailController.text,
                          );
                          FocusScope.of(context).unfocus();
                        }
                        FocusScope.of(context).unfocus();
                      },
                      screenHeight: height,
                      buttonColor: Constants.color,
                      buttonText: 'LOGIN',
                      screenWidth: width,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Don\'t Have Account ?',
                          style: TextStyle(fontSize: 12),
                        ),
                        TextButton(
                          child: const Text(
                            'REGISTER',
                            style: TextStyle(color: Constants.color),
                          ),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              RegisterScreen.id,
                              (route) => false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
