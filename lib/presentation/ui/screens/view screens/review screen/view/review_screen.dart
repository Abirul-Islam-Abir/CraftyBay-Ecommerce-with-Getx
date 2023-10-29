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
        builder: (_) {
          return controller.isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(kSmallSize),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),border: Border.all(width: 01,color: AppColor.kBlackColor.withOpacity(0.2))),
                          padding: const EdgeInsets.symmetric(horizontal: kDefaultSize,vertical: kSmallSize),

                          child: ListView.separated(
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: controller.productListByReview.length,
                            itemBuilder: (context, index) => ReviewCard(
                              des: '${controller.productListByReview[index].description}',
                              name:
                              '${controller.productListByReview[index].profile!.cusName}',
                            ),
                          ),
                        ),
                      ),
                    ),
                    BottomDetailsCard(price: '222', onPressed:  (){}
                        , name: 'Addreveiw', isProgress: false)
                  ],
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
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
      height: 90,
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
