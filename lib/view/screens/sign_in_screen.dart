import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/components/custom_button_widget.dart';
import 'package:shopping_app/view/components/custom_list_tile_account_widget.dart';
import 'package:shopping_app/view/components/custom_or_row_widget.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';
import 'package:shopping_app/view/components/custom_title_and_input_field_widget.dart';
import 'package:shopping_app/view/screens/sign_up_screen.dart';
import '../../utils/animate_page.dart';
import '../../view_model/auth_view_model.dart';

class SignInScreen extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                width: double.infinity,
                height: 100.0,
                child: Scaffold(
                  appBar: AppBar(
                    title: CustomTextWidget(
                      title: 'Sign In',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.grey.shade50,
                    elevation: 0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomListTileAccountWidget(
                        socialIcon: Icons.facebook,
                        socialTitle: 'Sign in with Facebook',
                        containerColor: Colors.blueAccent.shade400,
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomListTileAccountWidget(
                        socialIcon: FontAwesomeIcons.googlePlus,
                        socialTitle: 'Sign in with Google',
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
                        title: 'SIGN IN WITH EMAIL AND PASSWORD',
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
                        height: 30,
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
                        height: 30,
                      ),
                      CustomButtonWidget(
                        buttonTitle: 'SIGN IN',
                        onPressed: () {
                          _formKey.currentState?.save();
                          if (_formKey.currentState!.validate() &&
                              controller.email != null &&
                              controller.password != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Processing...'),
                                duration: Duration(milliseconds: 300),
                              ),
                            );
                            controller.signInWithEmailAndPassword(context);
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
                      CustomTextWidget(
                        title: 'NEW TO H&M?',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            AnimatePage.createRoute(
                              SignUpScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 55.0,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1),
                          ),
                          child: Center(
                            child: CustomTextWidget(
                              title: 'CREATE A NEW ACCOUNT',
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
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
