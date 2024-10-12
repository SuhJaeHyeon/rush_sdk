import 'package:flutter/material.dart';

class PermissionPage extends StatelessWidget {
  const PermissionPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // if (UserController.to.maintenanceIsNeeded.value) {
    //   return InterruptPage.maintenance(UserController.to.maintenanceImage!);
    // } else if (UserController.to.versionUpdateIsNeeded.value) {
    //   return InterruptPage.update(UserController.to.versionUpdateImage!);
    // } else if (UserController.to.isBlocked != null) {
    //   return InterruptPage.blocked(
    //     AppInfoController.to.appInfo.value.permissions['block']['image'],
    //     UserController.to.isBlocked!,
    //   );
    // }
    return child;
  }
}
