
import 'dart:io';

import 'package:zither/base/BaseViewModel.dart';
import 'package:zither/utils/ADBHelper.dart';
import 'package:zither/utils/ADBUtil.dart';

class MainViewModel extends BaseViewModel {

  MainViewModel(context) : super(context);

  bool checkAdb() {
    return ADBUtil.checkADB();
  }

  void setPath() {
  }

  test(String str, void Function(ProcessResult? result) onResult) async {
    onResult(await ADBHelper.deviceVersion());
  }
}
