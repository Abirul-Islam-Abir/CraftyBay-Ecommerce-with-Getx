import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../../../../../../data/utils/export.dart';
import '../view/profile_screen.dart';

AppBar buildAppBar(context) => AppBar(
      title: SvgPicture.asset(ImageAsset.titleLogoSvg),
      actions: [
        IconButton(
            onPressed: () {
              Get.to(() => ProfileScreen());
            },
            icon: const Icon(EvaIcons.personOutline)),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded)),
        IconButton(
            onPressed: () {
              storageInstance.remove(StorageKey.setTokenKey);
              Get.offAllNamed(RouteName.emailVerifyScreen);
            },
            icon: const Icon(Icons.logout_outlined)),
        GetBuilder<HomeScreenController>(builder: (logic) {
          return Switch(value: true, onChanged: (v) {});
        })
      ],
    );
