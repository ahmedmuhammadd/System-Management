import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/constants.dart';
import '../../../shared/widgets/snack_bar_widget.dart';
import '../../../shared/widgets/submit_button.dart';
import '../../../shared/widgets/text_form_field.dart';
import '../provider/provider.dart';
import '../widgets/picture_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  double height;
  double width;
  TextEditingController userNameController;
  TextEditingController birthdayController;
  TextEditingController passwordController;
  TextEditingController emailController;
  TextEditingController addressController;
  ScrollController scrollController;

  @override
  void initState() {
    userNameController = TextEditingController();
    birthdayController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    birthdayController.dispose();
    passwordController.dispose();
    emailController.dispose();
    addressController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 900),
          curve: Curves.fastOutSlowIn,
        );
      },
      child: SingleChildScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Edit Profile Screen',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 23,
                ),
              ),
              ProfilePictureWidget(
                width: width,
                height: height,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MainTextFormField(
                    validation: (value) {},
                    suffixIconColor: Constants.color,
                    screenWidth: width,
                    labelText: 'username',
                    controller: userNameController,
                    icon: Icons.person_outline,
                    focusedBorderColor: Constants.color,
                  ),
                  MainTextFormField(
                    validation: (value) {},
                    suffixIconColor: Constants.color,
                    screenWidth: width,
                    labelText: 'email',
                    controller: emailController,
                    icon: Icons.email_outlined,
                    focusedBorderColor: Constants.color,
                  ),
                  MainTextFormField(
                    validation: (value) {},
                    obscureText: true,
                    suffixIconColor: Constants.color,
                    screenWidth: width,
                    labelText: 'password',
                    controller: passwordController,
                    icon: Icons.lock_outline,
                    focusedBorderColor: Constants.color,
                  ),
                  MainTextFormField(
                    validation: (value) {},
                    suffixIconColor: Constants.color,
                    focusedBorderColor: Constants.color,
                    screenWidth: width,
                    labelText: 'address',
                    controller: addressController,
                    icon: Icons.location_on_outlined,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: MainSubmitButton(
                      buttonColor: Constants.color,
                      screenWidth: width,
                      screenHeight: height,
                      buttonText: 'EDIT',
                      onTap: () {
                        Provider.of<EditProfileProvider>(context, listen: false)
                            .uploadProfilePicToStorage(
                          userName: userNameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          address: addressController.text,
                          context: context,
                        )
                            .then((value) {
                          showSnackBar(
                            context: context,
                            msg: "Updated Successfully",
                          );
                        }).catchError((e) {
                          showSnackBar(
                            context: context,
                            msg: e.toString(),
                          );
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
