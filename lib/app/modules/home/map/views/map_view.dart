import 'package:flutter/material.dart';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:get/get.dart';

import 'package:angelhack_hcm/app/routes/app_pages.dart';

import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MapView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'MapView is working',
              style: TextStyle(fontSize: 20),
            ),
            //
            TextButton(
              onPressed: () async {
                final result = await Amplify.Auth.signOut();
                if (result is CognitoCompleteSignOut) {
                  safePrint('Sign out completed successfully');
                  await Get.offAllNamed(Routes.SPLASH);
                } else if (result is CognitoFailedSignOut) {
                  safePrint(
                    'Error signing user out: ${result.exception.message}',
                  );
                }
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
