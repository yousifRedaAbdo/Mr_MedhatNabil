

import 'package:medhat_nabil/base_view_model.dart';
import 'package:medhat_nabil/enums/screen_state.dart';
import 'package:medhat_nabil/locator.dart';
import 'package:medhat_nabil/services/navigation_service.dart';
import 'package:medhat_nabil/services/shared_pref_services.dart';
import 'package:medhat_nabil/utils/strings.dart';

class CourseContentDrawerViewModel extends BaseViewModel {
  var navigation = locator<NavigationService>();
  var pref = locator<SharedPrefServices>();

  String userRole = '';
  String token = '';

  getUserRole() async {
    userRole = await pref.getString(userType);
    setState(ViewState.Idle);
  }

  getToken() async {
    token = await pref.getString(userToken);
    setState(ViewState.Idle);
  }
}
