

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_app/data/payload/api/workspace/get_workspace_api_request.dart';
import 'package:flutter_modular_app/domain/workspace.dart';

import 'home_presenter.dart';

class HomeController extends Controller {
  final HomePresenter _presenter;

  bool isLoading = true;

  HomeController(this._presenter);

  Workspace? args;

  @override
  void onInitState() {
    _presenter.onGetWorkspace(GetWorkspaceApiRequest());
    getArgs();
  }

  void getArgs() {
    // print("arguments: ${args?.isLoggedIn}");
  }

  @override
  void initListeners() {
    _presenter.getWorkspaceOnNext = (Workspace workspace) {
      Modular.get<Workspace>().copy(workspace);
      print("home: success getWorkspace");
    };

    _presenter.getWorkspaceOnComplete = () {
      print("home: completed getWorkspace");
      isLoading = false;
      refreshUI();
    };

    _presenter.getWorkspaceOnError = (e) {
      print("profile: error getProfile $e");
    };
  }
}
