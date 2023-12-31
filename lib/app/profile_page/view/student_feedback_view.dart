import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medhat_nabil/app/profile_page/view_model/profile_page_view_model.dart';
import 'package:medhat_nabil/base_screen.dart';
import 'package:medhat_nabil/utils/colors.dart';
import 'package:medhat_nabil/utils/texts.dart';

class StudentFeedBackView extends StatefulWidget {
  const StudentFeedBackView({Key? key}) : super(key: key);

  @override
  State<StudentFeedBackView> createState() => _StudentFeedBackViewState();
}

class _StudentFeedBackViewState extends State<StudentFeedBackView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfilePageViewModel>(
      onModelReady: (viewModel) async {
        await viewModel.getToken();
        if (!mounted) return;
        viewModel.getStudentFeedbacks(
          context,
        );
      },
      builder: (context, viewModel, child) {
        return SafeArea(
          bottom: false,
          right: false,
          left: false,
          top: false,
          child: Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              backgroundColor: mainColor,
              centerTitle: true,
              title: appBarTitle(tr('feedback')),
              elevation: 0,
            ),
            body: viewModel.studentFeedbackList.isEmpty
                ? Center(
                    child: mediumText(
                      tr('no_data'),
                    ),
                  )
                : ListView.builder(
                    itemCount: viewModel.studentFeedbackList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            color: mainColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                title(
                                    viewModel
                                        .studentFeedbackList[index].feedback!,
                                    color: whiteColor),
                                smallText(
                                  viewModel.studentFeedbackList[index].teacher!
                                      .fullname!,
                                  color: whiteColor,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
