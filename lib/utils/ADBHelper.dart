
import 'dart:io';

import 'package:zither/utils/ADBUtil.dart';

class ADBHelper {

  /// show adb's version
  static Future<ProcessResult?> version() async {
    return await ADBUtil.exec(["version"]);
  }

  static Future<ProcessResult?> shell() async {
    return await ADBUtil.exec(["shell"]);
  }

  /// show all apk package names
  static Future<ProcessResult?> allPackages() async {
    return await ADBUtil.exec(["shell", "pm", "list", "packages"]);
  }

  /// show package names of all system apk
  static Future<ProcessResult?> systemPackages() async {
    return await ADBUtil.exec(["shell", "pm", "list", "packages", "-s"]);
  }

  /// show package names of all downloaded apk's
  static Future<ProcessResult?> downloadPackages() async {
    return await ADBUtil.exec(["shell", "pm", "list", "packages", "-3"]);
  }

  /// get device android's version code
  static Future<ProcessResult?> deviceVersion() async {
    return await ADBUtil.exec(["shell", "getprop", "ro.build.version.release"]);
  }

  /// get device model type
  static Future<ProcessResult?> deviceModel() async {
    return await ADBUtil.exec(["shell", "getprop", "ro.product.model"]);
  }

  /// show all process
  static Future<ProcessResult?> processes() async {
    return await ADBUtil.exec(["shell", "ps"]);
  }

  /// show all currently connected devices
  static Future<ProcessResult?> devices() async {
    return await ADBUtil.exec(["devices"]);
  }

  /// install apk by path
  static Future<ProcessResult?> install(String path) async {
    return await ADBUtil.exec(["install", path]);
  }

  /// uninstall apk by package name
  static Future<ProcessResult?> uninstall(String packageName) async {
    return await ADBUtil.exec(["uninstall", packageName]);
  }

  static Future<ProcessResult?> cpuInfo() async {
    return await ADBUtil.exec(["shell", "top", "-n" "1"]);
  }
}