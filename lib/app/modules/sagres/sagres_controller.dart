import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'repositories/sagres_repository.dart';

part 'sagres_controller.g.dart';

class SagresController = _SagresControllerBase with _$SagresController;

abstract class _SagresControllerBase with Store {
  Completer<WebViewController> webViewController = Completer<WebViewController>();

  final SagresRepository repository;

  _SagresControllerBase(this.repository){

  }

  @action
  fetchTimetableAndSubjects(page) {
    // status = DataStatus.loading;
    repository.setPersistenceTimetableAndSubjects(page);
    // status = DataStatus.none;
  }
  
}
