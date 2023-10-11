import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medhat_nabil/app/auth/widgets/contact_with_us.dart';
import 'package:medhat_nabil/app/home_drawer/view_model/home_drawer_view_model.dart';

import '../../../base_screen.dart';
import '../../../utils/colors.dart';
import '../../../utils/strings.dart';
import '../../../utils/texts.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeDrawerViewModel>(
      onModelReady: (viewModel) {},
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
                title: appBarTitle(tr('contact')),
              ),
              body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        contactWithUs(
                          context: context,
                          techNumber: tecContactNumber,
                          teacherNumber2: teacherContactNumber2,
                          teacherNumber1: teacherContactNumber,
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
