import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/components/custom_app_bar_widget.dart';
import 'package:shopping_app/view/components/custom_button_widget.dart';
import 'package:shopping_app/view/components/custom_list_tile_account_widget.dart';
import 'package:shopping_app/view/components/custom_or_row_widget.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';
import 'package:shopping_app/view/components/custom_title_and_input_field_widget.dart';

import '../../view_model/auth_view_model.dart';

class SignUpScreen extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBarWidget(
              title: 'Register',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: CustomTextWidget(
                          title: 'View your orders and update your details',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomListTileAccountWidget(
                        socialIcon: Icons.facebook,
                        socialTitle: 'Sign up with Facebook',
                        containerColor: Colors.blueAccent.shade400,
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomListTileAccountWidget(
                        socialIcon: FontAwesomeIcons.googlePlus,
                        socialTitle: 'Sign up with Google',
                        socialTitleColor: Colors.black,
                        socialIconColor: Colors.black.withOpacity(0.8),
                        border: Border.all(width: 1),
                        onTap: () {
                          controller.signInWithGoogle(context);
                        },
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      CustomOrRowWidget(),
                      const SizedBox(
                        height: 35,
                      ),
                      CustomTextWidget(
                        title: 'SIGN UP WITH EMAIL ADDRESS',
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTitleAndInputFieldWidget(
                        title: 'Email',
                        onChanged: (newValue) {
                          controller.email = newValue;
                        },
                        validator: (email) {
                          if (email!.isEmpty) {
                            return '*required';
                          } else if (EmailValidator.validate(email) == false) {
                            return '*invalid email';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTitleAndInputFieldWidget(
                        title: 'First name',
                        onChanged: (newValue) {
                          controller.firstName = newValue;
                        },
                        validator: (firstName) {
                          if (firstName!.isEmpty) {
                            return '*required';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTitleAndInputFieldWidget(
                        title: 'Last name',
                        onChanged: (newValue) {
                          controller.lastName = newValue;
                        },
                        validator: (lastName) {
                          if (lastName!.isEmpty) {
                            return '*required';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<AuthViewModel>(
                        builder: (controller) => CustomTitleAndInputFieldWidget(
                          title: 'Password',
                          onChanged: (newValue) {
                            controller.password = newValue;
                          },
                          validator: (password) {
                            if (password!.isEmpty) {
                              return '*required';
                            }
                          },
                          obscureText: controller.obscureText,
                          suffixText:
                              controller.obscureText == true ? 'SHOW' : 'HIDE',
                          onTap: () {
                            controller.togglePasswordVisibility();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButtonWidget(
                        buttonTitle: 'CREATE ACCOUNT',
                        onPressed: () {
                          _formKey.currentState?.save();
                          if (_formKey.currentState!.validate() &&
                              controller.email != null &&
                              controller.firstName != null &&
                              controller.lastName != null &&
                              controller.password != null) {
                            controller
                                .createAccountWithEmailAndPassword(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('processing ....'),
                                duration: Duration(milliseconds: 300),
                              ),
                            );
                          } else {
                            print('not validate');
                          }
                        },
                        buttonColor: Colors.grey.shade300,
                        textColor: Colors.white,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Opacity(
                        opacity: 0.5,
                        child: Text.rich(
                          TextSpan(
                            text: 'By registering, you agree to our ',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            children: [
                              TextSpan(
                                text: 'Terms & Conditions ',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                              TextSpan(
                                text: 'and ',
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CustomTextWidget(
                            title: 'Back to sign in',
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
