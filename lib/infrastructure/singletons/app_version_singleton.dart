import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@lazySingleton
class AppVersionSingleton {
  String? _appVersion;
  final PackageInfo packageInfo;

  AppVersionSingleton(this.packageInfo);

  String get appVersion {
    return _appVersion ??= packageInfo.version;
  }
}
