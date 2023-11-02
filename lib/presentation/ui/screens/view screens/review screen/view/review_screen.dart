 import 'package:crafty_bay_ecommerce/presentation/ui/screens/view%20screens/review%20screen/controller/review_screen_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/bottom_details_card.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/common_text.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/count_card.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/normal_text.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/subtitle_text.dart';

import '../../../../../../data/utils/export.dart';
import '../../create product review screen/view/create_product_review_screen.dart';
import '../component/bottom_review_details_card.dart';
import '../component/review_card.dart';

class ReviewScreen extends StatelessWidget {
  ReviewScreen({super.key});

  final controller = Get.put(ReviewScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Review')),
      body:  GetBuilder<ReviewScreenController>(
        builder: (controller) => controller.isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(kSmallSize),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            border: Border.all(
                                width: 01,
                                color: AppColor.kBlackColor.withOpacity(0.2))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultSize, vertical: kSmallSize),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: controller.productListByReview.length,
                          itemBuilder: (context, index) => ReviewCard(
                            des:
                                '${controller.productListByReview[index].description}',
                            name:
                                '${controller.productListByReview[index].profile!.cusName}',
                          ),
                        ),
                      ),
                    ),
                  ),
                  BottomReviewDetailsCard(
                      length: '${controller.productListByReview.length}',
                      onPressed:controller.goToCreateReviewScreen,
                      isProgress: false)
                ],
              ),
      ),

    );
  }
}

