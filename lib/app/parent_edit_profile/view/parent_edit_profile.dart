import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medhat_nabil/comman_widgets/inputField.dart';
import 'package:medhat_nabil/comman_widgets/main_button.dart';
import 'package:medhat_nabil/enums/screen_state.dart';
import 'package:medhat_nabil/utils/extensions.dart';
import 'package:medhat_nabil/utils/spaces.dart';
import 'package:medhat_nabil/utils/texts.dart';

import '../../../base_screen.dart';
import '../../../utils/colors.dart';
import '../view_model/parent_edit_profile_view_model.dart';

class ParentEditProfileView extends StatelessWidget {
  const ParentEditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ParentEditProfileViewModel>(
      onModelReady: (viewModel) {
        viewModel.getUserData();
      },
      builder: (context, viewModel, child) {
        return Container(
          color: mainColor,
          child: SafeArea(
            bottom: false,
            right: false,
            left: false,
            top: true,
            child: Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: mainColor,
                centerTitle: true,
                title: appBarTitle(tr('edit_profile')),
              ),
              body: viewModel.state == ViewState.Busy
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: ListView(
                        children: [
                          heightSpace(30),
                          InputField(
                            hint: viewModel.firstNameController.text,
                            inputType: TextInputType.text,
                            controller: viewModel.firstNameController,
                            icon: Icons.person,
                            validator: (val) {},
                            enable: false,
                          ),
                          heightSpace(30),
                          InputField(
                            hint: viewModel.lastNameController.text,
                            inputType: TextInputType.text,
                            controller: viewModel.lastNameController,
                            icon: Icons.person,
                            validator: (val) {},
                            enable: false,
                          ),
                          heightSpace(30),
                          InputField(
                            hint: viewModel.mobileNumberController.text,
                            inputType: TextInputType.number,
                            controller: viewModel.mobileNumberController,
                            icon: Icons.phone,
                            validator: (val) {},
                          ),
                          heightSpace(30),
                          mainButton(tr('edit')).onTap(() {
                            viewModel.editProfile(context);
                          })
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
