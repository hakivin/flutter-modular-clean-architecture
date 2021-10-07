import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_modular_app/data/payload/api/workspace/get_workspace_api_request.dart';
import 'package:flutter_modular_app/data/payload/contracts/workspace_request_interface.dart';
import 'package:flutter_modular_app/domain/workspace.dart';
import 'package:flutter_modular_app/usecase/workspace/get_workspace.dart';

class HomePresenter extends Presenter {
  final GetWorkspaceUseCase _workspaceUseCase;

  HomePresenter(this._workspaceUseCase);

  // for get profile
  late Function getWorkspaceOnNext;
  late Function getWorkspaceOnComplete;
  late Function getWorkspaceOnError;

  void onGetWorkspace(GetWorkspaceRequestInterface req) {
    if (req is GetWorkspaceApiRequest) {
      _workspaceUseCase.execute(_GetWorkspaceObserver(this), req);
    }
  }

  @override
  void dispose() {
    _workspaceUseCase.dispose();
  }
}

class _GetWorkspaceObserver implements Observer<Workspace> {
  final HomePresenter _presenter;

  _GetWorkspaceObserver(this._presenter);

  @override
  void onNext(Workspace? user) {
    _presenter.getWorkspaceOnNext(user);
  }

  @override
  void onComplete() {
    _presenter.getWorkspaceOnComplete();
  }

  @override
  void onError(e) {
    _presenter.getWorkspaceOnError(e);
  }
}