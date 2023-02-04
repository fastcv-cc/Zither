
import 'dart:convert';
import 'dart:io';

import 'package:process_run/shell_run.dart';

class ADBUtil {
  static late Shell shell;

  static void init(){
    shell = Shell(
      environment: Platform.environment,
      throwOnError: false,
      stderrEncoding: const Utf8Codec(),
      stdoutEncoding: const Utf8Codec(),
    );
  }

  static bool checkADB() {
    return true;
  }

  static Future<ProcessResult?> exec(
      List<String> arguments,
      {void Function(Process process)? onProcess}
  ) async {
    try {
      return await shell.runExecutableArguments("adb", arguments, onProcess: onProcess);
    } catch (e) {
      return null;
    }
  }
}
