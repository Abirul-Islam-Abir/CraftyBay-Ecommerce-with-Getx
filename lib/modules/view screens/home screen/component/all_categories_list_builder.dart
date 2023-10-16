import 'package:crafty_bay_ecommerce/modules/widgets/categories_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../../model/category list model/category_list_model.dart';
import '../../../../utils/animation_effect.dart';
import '../../../../utils/app_size.dart';
import '../../categories screen/controller/categories_screen_controller.dart';
import 'categories_product_card.dart';

class AllCategoriesListBuilder extends StatelessWidget {
  const AllCategoriesListBuilder(this.products, {super.key});

  final List<CategoryListModel> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: Get.width,
      padding: const EdgeInsets.all(kTooSmallSize),
      child: GetBuilder<CategoriesScreenController>(
        builder: (controller) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                controller.isLoading == true ? 4 : products.length,
                (index) => controller.isLoading
                    ? const CategoriesCardShimmer()
                    : Animate(
                        effects: EffectFactory.zoomOut,
                        child: CategoriesProductCard(
                          onTap: () {},
                          img: '${products[index].categoryImg}',
                          categoryName: '${products[index].categoryName}',
                        )),
              ),
            )),
      ),
    );
  }
}
