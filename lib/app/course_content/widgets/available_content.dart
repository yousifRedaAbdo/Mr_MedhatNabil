

import 'package:flutter/material.dart';
import 'package:medhat_nabil/app/course_content/widgets/activity_image.dart';

import '../../../utils/colors.dart';
import '../../../utils/spaces.dart';
import '../../../utils/texts.dart';
import '../model/final_course_content_mobile_model.dart';

Container availableContent(Modules element) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 20),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: mainColor,
    ),
    child: Row(
      children: [
        activityImage(
          modName: element.modname!,
          resourceType: element.elementResourceType!,
        ),
        widthSpace(20),
        Flexible(
          child: mediumText(
            element.name!,
            color: whiteColor,
          ),
        ),
      ],
    ),
  );
}