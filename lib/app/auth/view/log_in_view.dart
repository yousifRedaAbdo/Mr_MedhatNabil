import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medhat_nabil/routs/routs_names.dart';
import 'package:medhat_nabil/utils/extensions.dart';
import 'package:medhat_nabil/utils/spaces.dart';
import 'package:medhat_nabil/utils/texts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../base_screen.dart';
import '../../../comman_widgets/inputField.dart';
import '../../../comman_widgets/main_button.dart';
import '../../../utils/colors.dart';
import '../../../utils/strings.dart';
import '../view_model/auth_view_model.dart';
import '../widgets/contact_with_us.dart';

class LogInView extends StatelessWidget {
  const LogInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthenticationViewModel>(
      onModelReady: (viewModel) {
        viewModel.checkSignUp();
      },
      builder: (context, viewModel, child) {
        var deviceSize = MediaQuery.of(context).size;

        return Container(
          color: mainColor,
          child: SafeArea(
            bottom: false,
            right: false,
            left: false,
            top: true,
            child: Form(
              key: viewModel.logInFormKey,
              child: Scaffold(
                backgroundColor: backgroundColor,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          heightSpace(50),
                          Container(
                            padding: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(70),
                            ),
                            child: CircleAvatar(
                              backgroundColor: backgroundColor,
                              radius: 70,
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/splash_screen.png',
                                  width: 135,
                                  height: 135,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          heightSpace(20),
                          mainColorTitle(tr('mr_name')),
                          heightSpace(20),
                          InputField(
                            inputType: TextInputType.emailAddress,
                            controller: viewModel.email,
                            validator: viewModel.emailValidator(),
                            icon: Icons.email,
                            hint: tr('email'),
                          ),
                          heightSpace(20),
                          InputField(
                            inputType: TextInputType.text,
                            controller: viewModel.password,
                            icon: Icons.lock,
                            validator: viewModel.passwordValidator(),
                            isPassword: true,
                            hint: tr('password'),
                          ),
                          heightSpace(15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              smallBoldTitle(
                                tr('forget_password'),
                              )
                            ],
                          ).onTap(() {
                            viewModel.navigation
                                .navigateTo(RouteName.resetPassword);
                          }),
                          heightSpace(35),
                          RoundedLoadingButton(
                            elevation: 0,
                            width: deviceSize.width,
                            color: mainColor,
                            successColor: successfulColor,
                            errorColor: errorColor,
                            height: 50,
                            controller: viewModel.btnController,
                            onPressed: () {
                              viewModel.login(context);
                            },
                            child: roundedButtonText(
                              tr('log_in'),
                            ),
                          ),
                          heightSpace(35),
                          viewModel.signUpState == true
                              ? mainButton(tr('register')).onTap(() {
                                  viewModel.navigation
                                      .navigateTo(RouteName.signUp);
                                })
                              : contactWithUs(
                                  context: context,
                                  techNumber: tecContactNumber,
                                  teacherNumber2: teacherContactNumber2,
                                  teacherNumber1: teacherContactNumber,
                                ),
                          viewModel.signUpState == true
                              ? heightSpace(80)
                              : heightSpace(50),
                          smallText('All rights reserved to N.I.T © 2022'),
                          heightSpace(10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      onFinish: (viewModel) {
        viewModel.email.dispose();
        viewModel.password.dispose();
      },
    );
  }
}
