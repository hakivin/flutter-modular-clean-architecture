import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_modular_app/data/payload/api/profile/get_profile_api_request.dart';
import 'package:flutter_modular_app/data/payload/contracts/profile_request_interface.dart';
import 'package:flutter_modular_app/domain/user.dart';
import 'package:flutter_modular_app/usecase/profile/get_profile.dart';

class ProfilePresenter extends Presenter {
  final GetProfileUseCase _profileUseCase;

  ProfilePresenter(this._profileUseCase);

  // for get profile
  late Function getProfileOnNext;
  late Function getProfileOnComplete;
  late Function getProfileOnError;

  void onGetProfile(GetProfileRequestInterface req) {
    if (req is GetProfileApiRequest) {
      _profileUseCase.execute(_GetProfileObserver(this), req);
    }
  }

  @override
  void dispose() {
    _profileUseCase.dispose();
  }
}

class _GetProfileObserver implements Observer<User> {
  final ProfilePresenter _presenter;

  _GetProfileObserver(this._presenter);

  @override
  void onNext(User? user) {
    _presenter.getProfileOnNext(user);
  }

  @override
  void onComplete() {
    _presenter.getProfileOnComplete();
  }

  @override
  void onError(e) {
    _presenter.getProfileOnError(e);
  }
}
