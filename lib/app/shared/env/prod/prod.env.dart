import 'package:envied/envied.dart';

import 'package:angelhack_hcm/app/shared/env/app_env.dart';

part 'prod.env.g.dart';

@Envied(
  obfuscate: true,
  allowOptionalFields: true,
  path: AppEnvironment.productionPath,
)
final class ProdEnv implements AppEnvironment {
  ProdEnv();

  @override
  @EnviedField(varName: 'BASE_URL')
  final String baseUrl = _ProdEnv.baseUrl;

  @override
  @EnviedField(varName: 'FILE_SERVER_URL')
  final String fileServerUrl = _ProdEnv.fileServerUrl;
}
