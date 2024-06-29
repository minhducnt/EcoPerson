import 'package:envied/envied.dart';

import 'package:angelhack_hcm/app/shared/env/app_env.dart';

part 'dev.env.g.dart';

@Envied(
  obfuscate: true,
  allowOptionalFields: true,
  path: AppEnvironment.developmentPath,
)
final class DevEnv implements AppEnvironment {
  DevEnv();

  @override
  @EnviedField(varName: 'BASE_URL')
  final String baseUrl = _DevEnv.baseUrl;

  @override
  @EnviedField(varName: 'FILE_SERVER_URL')
  final String fileServerUrl = _DevEnv.fileServerUrl;
}
