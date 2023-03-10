
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:process_run/shell_run.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ADBUtil {
  static late Shell shell;

  static String adbPath = "";
  static const String KEY_ADB_PATH = "key_adb_path";

  static void init() async {
    adbPath = await getAdbPath();
    shell = Shell(
      environment: Platform.environment,
      throwOnError: false,
      stderrEncoding: const Utf8Codec(),
      stdoutEncoding: const Utf8Codec(),
    );
  }

  static Future<void> setAdbPath(String path) async {
    final shared = await SharedPreferences.getInstance();
    shared.setString(KEY_ADB_PATH, path);
  }

  static Future<String> getAdbPath() async {
    if (checkADB()) {
      return adbPath;
    }
    final shared = await SharedPreferences.getInstance();
    return shared.getString(KEY_ADB_PATH) ?? "";
  }

  static bool checkADB() {
    return adbPath.isNotEmpty;
  }

  static Future<ProcessResult?> exec(
      List<String> arguments,
      {void Function(Process process)? onProcess}
  ) async {
    if (!checkADB()) {
      return null;
    }
    try {
      return await shell.runExecutableArguments(adbPath, arguments, onProcess: onProcess);
    } catch (e) {
      return null;
    }
  }
}
