
import 'dart:io';

import 'package:zither/base/BaseViewModel.dart';
import 'package:zither/utils/ADBUtil.dart';

class MainViewModel extends BaseViewModel {

  MainViewModel(context) : super(context);

  test(String str, void Function(ProcessResult? result) onResult) async {
    onResult(await ADBUtil.exec([str]));
  }
}
