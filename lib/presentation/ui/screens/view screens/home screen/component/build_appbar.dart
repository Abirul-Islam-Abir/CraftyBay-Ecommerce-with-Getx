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
        IconButton(onPressed: () {}, icon: const Icon(Icons.phone_outlined)),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded))
      ],
    );
