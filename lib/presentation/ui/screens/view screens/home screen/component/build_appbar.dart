import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../../../../../../data/utils/export.dart';
import '../../../../../state holder controller/theme_controller.dart';
import '../../read profile screen/view/read_profile_screen.dart';

AppBar buildAppBar(context) => AppBar(
      title: SvgPicture.asset(ImageAsset.titleLogoSvg),
      actions: [
        IconButton(
            onPressed: () {
              Get.to(() => ProfileScreen());
            },
            icon: const Icon(EvaIcons.personOutline)),
        IconButton(
            onPressed: () {
              Get.changeTheme(Get.isDarkMode?ThemeData.light(): ThemeData.dark());


            },
            icon: const Icon(Icons.notifications_none_rounded)),
        IconButton(
            onPressed: () {
              box.remove(BoxKey.setTokenKey);
              Get.offAllNamed(RouteName.emailVerifyScreen);
            },
            icon: const Icon(Icons.logout_outlined)),
        GetBuilder<HomeScreenController>(builder: (logic) {
          return Switch(value: true, onChanged: (v) {});
        })
      ],
    );
