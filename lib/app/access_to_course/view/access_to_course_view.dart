import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:medhat_nabil/app/access_to_course/view_model/access_to_course_view_model.dart';
import 'package:medhat_nabil/base_screen.dart';
import 'package:medhat_nabil/comman_widgets/loding_dialog.dart';
import 'package:medhat_nabil/enums/screen_state.dart';
import 'package:medhat_nabil/app/single_student_report/view/single_student_report_view.dart';
import 'package:medhat_nabil/utils/colors.dart';
import 'package:medhat_nabil/utils/extensions.dart';
import 'package:medhat_nabil/utils/spaces.dart';
import 'package:medhat_nabil/utils/texts.dart';

import '../../reports/quizzes_report/view/attendance_view.dart';
import '../model/access_to_course_model.dart';

class AccessToCourseReportView extends StatelessWidget {
  String courseId;

  AccessToCourseReportView(this.courseId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AccessToCourseReportViewModel>(
      onModelReady: (viewModel) {
        viewModel.GetAccessToCourse(context: context, courseId: courseId);
      },
      builder: (context, viewModel, child) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: mainColor,
              title: appBarTitle('Accessed To Course'),
              centerTitle: true,
              bottom: TabBar(
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                automaticIndicatorColorAdjustment: true,
                labelColor: mainColor,
                unselectedLabelColor: backgroundColor,
                indicator: const BoxDecoration(
                  color: backgroundColor,
                ),
                tabs: [
                  Tab(
                    child: Text(
                      tr('access_by'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      tr('not_access_by'),
                    ),
                  ),
                ],
              ),
            ),
            body: viewModel.state == ViewState.Busy
                ? const Center(
                    child: CircularProgressIndicator(
                      color: mainColor,
                    ),
                  )
                : Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: backgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBarView(
                        children: [
                          seenView(viewModel.viewedList, courseId),
                          unSeenView(viewModel.notViewedList, courseId)
                        ],
                      ),
                    ),
                  ),
            floatingActionButton: FloatingActionButton(
              elevation: 20,
              backgroundColor: backgroundColor,
              onPressed: () {
                loadingDialog(context);
                viewModel.generateAccessToCoursePDF.generateReport(
                  context,
                  'Accessed to course details',
                  viewModel.viewedList,
                  viewModel.notViewedList,
                );
              },
              child: Icon(
                Icons.download,
                color: mainColor,
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget seenView(List<Viewed> list, String courseId) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace(10),
        Text(
          "${tr('student_num')} : ${list.length}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          ),
        ),
        heightSpace(10),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return list.isEmpty
                  ? Center(
                      child: mediumText(tr('no_data')),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      color: mainColor,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            cardText(
                              'Id : ${list[index].id}',
                            ),
                            cardText(
                              list[index].name,
                              fontWeight: FontWeight.bold,
                            ),
                            cardText(
                              'Last access:${list[index].lastaccess}',
                              fontWeight: FontWeight.w500,
                            ),
                            cardText(
                              'Center : ${list[index].centername}',
                            ),
                          ],
                        ),
                      ),
                    ).onTap(
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleStudentReportView(
                              list[index].name,
                              list[index].id,
                              courseId,
                            ),
                          ),
                        );
                      },
                    );
            },
          ),
        ),
      ],
    ),
  );
}

Widget unSeenView(List<NotViewed> list, String courseId) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace(10),
        Text(
          "${tr('student_num')} : ${list.length}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          ),
        ),
        heightSpace(10),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return list.isEmpty
                  ? Center(
                      child: mediumText(tr('no_data')),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      color: mainColor,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            cardText(
                              'Id : ${list[index].id}',
                            ),
                            cardText(
                              list[index].name,
                              fontWeight: FontWeight.bold,
                            ),
                            cardText(
                              list[index].lastaccess,
                              fontWeight: FontWeight.w500,
                            ),
                            cardText(
                              'Center : ${list[index].centername}',
                            ),
                          ],
                        ),
                      ),
                    ).onTap(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleStudentReportView(
                            list[index].name,
                            list[index].id,
                            courseId,
                          ),
                        ),
                      );
                    });
            },
          ),
        ),
      ],
    ),
  );
}
