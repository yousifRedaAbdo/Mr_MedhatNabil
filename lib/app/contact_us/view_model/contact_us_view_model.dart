import 'package:medhat_nabil/app/auth/view_model/auth_view_model.dart';
import 'package:medhat_nabil/base_view_model.dart';
import 'package:medhat_nabil/locator.dart';
import 'package:medhat_nabil/services/api_service.dart';
import 'package:medhat_nabil/services/shared_pref_services.dart';
import 'package:medhat_nabil/utils/strings.dart';

class ContactUsViewModel extends BaseViewModel {
  AuthenticationViewModel authenticationViewModel = AuthenticationViewModel();
  ApiService apiService = locator<ApiService>();
  var pref = locator<SharedPrefServices>();
  String token = '';

  getToken() async {
    token = await pref.getString(userToken);
    print('token : $token');
  }
}
