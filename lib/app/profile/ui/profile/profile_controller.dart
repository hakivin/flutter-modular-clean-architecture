import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_app/app/profile/ui/profile/profile_presenter.dart';
import 'package:flutter_modular_app/data/payload/api/profile/get_profile_api_request.dart';
import 'package:flutter_modular_app/domain/user.dart';

class ProfileController extends Controller {
  final ProfilePresenter _presenter;

  bool isLoading = true;

  ProfileController(this._presenter);

  User? args;

  @override
  void onInitState() {
    _presenter.onGetProfile(GetProfileApiRequest());
    getArgs();
  }

  void getArgs() {
    print("arguments: ${args?.isLoggedIn}");
  }

  @override
  void initListeners() {
    _presenter.getProfileOnNext = (User user) {
      Modular.get<User>().isLoggedIn = user.isLoggedIn;
      print("profile: success getProfile ${user.isLoggedIn} ${Modular.get<User>().isLoggedIn}");
    };

    _presenter.getProfileOnComplete = () {
      print("profile: completed getProfile");
      isLoading = false;
      refreshUI();
    };

    _presenter.getProfileOnError = (e) {
      print("profile: error getProfile $e");
    };
  }
}
