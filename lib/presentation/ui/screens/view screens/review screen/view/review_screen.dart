import 'package:crafty_bay_ecommerce/presentation/ui/screens/view%20screens/create%20review%20screen/view/create_review_screen.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/view%20screens/review%20screen/controller/review_screen_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/bottom_details_card.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/common_text.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/count_card.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/normal_text.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/widgets/subtitle_text.dart';

import '../../../../../../data/utils/export.dart';

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
                      length: '222',
                      onPressed: () {
                        Get.to(CreateReviewScreen());
                      },
                      name: '',
                      isProgress: false)
                ],
              ),
      ),

    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.des, required this.name});

  final String des, name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: 80,
      width: Get.width,
      child: Column(
        children: [
          Row(children: [
            Icon(Icons.manage_accounts_outlined),
            NormalText(name)
          ]),
          SubtitleText(des),
        ],
      ),
    );
  }
}

class BottomReviewDetailsCard extends StatelessWidget {
  const BottomReviewDetailsCard(
      {super.key,
      required this.length,
      required this.onPressed,
      required this.name,
      required this.isProgress});

  final String length, name;
  final GestureTapCallback onPressed;
  final bool isProgress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: AppColor.kPrimaryColor.shade50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const NormalText('Reviews'),
              NormalText(
                '( $length )'
              ),
            ],
          ),
          isProgress
              ? const Center(child: CircularProgressIndicator())
              :  FloatingActionButton(onPressed: onPressed,child: Icon(Icons.add),),
        ],
      ),
    );
  }
}