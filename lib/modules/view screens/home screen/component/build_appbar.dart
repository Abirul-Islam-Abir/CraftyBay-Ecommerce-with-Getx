import 'package:crafty_bay_ecommerce/modules/view%20screens/home%20screen/view/profile_screen.dart';
import 'package:crafty_bay_ecommerce/utils/export.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/image_assets.dart';

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
