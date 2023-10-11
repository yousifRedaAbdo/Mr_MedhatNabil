import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medhat_nabil/app/contact_us/view_model/contact_us_view_model.dart';
import 'package:medhat_nabil/base_screen.dart';
import 'package:medhat_nabil/utils/colors.dart';
import 'package:medhat_nabil/utils/spaces.dart';
import 'package:medhat_nabil/utils/strings.dart';
import 'package:medhat_nabil/utils/texts.dart';

import '../../auth/widgets/contact_with_us.dart';

class ContactUsView extends StatelessWidget {
  String activityId;
  String courseId;
  String availMessages;

  ContactUsView({
    Key? key,
    required this.activityId,
    required this.courseId,
    required this.availMessages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(activityId);
    print('check availMessages : ');
    print(availMessages);
    print(availMessages.length);
    return BaseView<ContactUsViewModel>(
      onModelReady: (viewModel) {
        viewModel.getToken();
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
                backgroundColor: mainColor,
                elevation: 0,
                centerTitle: true,
                title: appBarTitle(tr('contact')),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  contactWithUs(
                    context: context,
                    techNumber: tecContactNumber,
                    teacherNumber2: teacherContactNumber2,
                    teacherNumber1: teacherContactNumber,
                  ),
                  heightSpace(25),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
