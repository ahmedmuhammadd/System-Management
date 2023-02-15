import 'package:flutter/material.dart';
import 'package:system_mangment/modules/auth/register/services/register_services.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/widgets/submit_button.dart';
import '../../../../shared/widgets/text_form_field.dart';
import '../../login/page/login_page.dart';
import '../../widgets/header_container.dart';
import '../../widgets/page_name.dart';

class RegisterScreen extends StatefulWidget {
  static const id = 'RegisterScreen';
  const RegisterScreen({Key key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  double height = 0;
  double width = 0;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController userNameController;
  TextEditingController addressController;
  GlobalKey<FormState> formKey;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userNameController = TextEditingController();
    addressController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    addressController.dispose();
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
            // formKey.currentState.reset();
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
                    pageText: "REGISTER",
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
                      child: MainTextFormField(
                        validation: (value) {
                          if (value.isEmpty) {
                            return 'username is to short';
                          }
                        },
                        controller: userNameController,
                        focusedBorderColor: Constants.color,
                        screenWidth: width,
                        icon: Icons.perm_identity,
                        labelText: 'username',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SizedBox(
                      child: MainTextFormField(
                        validation: (value) {
                          if (value.isEmpty) {
                            return 'address is to short';
                          }
                        },
                        controller: addressController,
                        focusedBorderColor: Constants.color,
                        screenWidth: width,
                        icon: Icons.lock_outline,
                        labelText: 'address',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SizedBox(
                        child: MainSubmitButton(
                      onTap: () {
                        if (formKey.currentState.validate()) {
                          FocusScope.of(context).unfocus();
                          RegisterServices().registerSubmit(
                            email: emailController.text,
                            password: passwordController.text,
                            address: addressController.text,
                            userName: userNameController.text,
                            context: context,
                          );
                        } else {
                          FocusScope.of(context).unfocus();
                        }
                      },
                      screenHeight: height,
                      buttonColor: Constants.color,
                      buttonText: 'REGISTER',
                      screenWidth: width,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Have Account?',
                          style: TextStyle(fontSize: 12),
                        ),
                        TextButton(
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(color: Constants.color),
                          ),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              LoginScreen.id,
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
