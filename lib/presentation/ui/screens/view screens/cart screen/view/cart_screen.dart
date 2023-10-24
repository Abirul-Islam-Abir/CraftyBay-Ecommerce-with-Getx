import '../../../../../../data/utils/export.dart';
import '../../../../widgets/bottom_details_card.dart';
import '../../../../widgets/normal_text.dart';
import '../../home screen/component/cart_card.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<BottomNavController>().goToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: Get.find<BottomNavController>().goToHome,
              icon: const Icon(Icons.arrow_back_ios_new_outlined)),
          title: const NormalText('Cart'),
        ),
        body: GetBuilder<HomeScreenController>(
          builder: (_) => Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CartCard(
                          img: controller.cartList[index].product!.image
                              .toString(),
                          removeBtn: () {},
                          addBtn: () {},
                          deletePress: () {
                            SnackToast.showDeleteDialog(
                                controller.cartList[index].id);
                          },
                          count: '0',
                          title:
                              controller.cartList[index].product?.title ?? '',
                          price: controller.cartList[index].price.toString(),
                          colorText: controller.cartList[index].color ?? '',
                          sizeText: controller.cartList[index].size ?? ''),
                      itemCount: controller.cartList.length)),
              BottomDetailsCard(
                name: 'Check Out',
                onPressed: () {},
                price: '00.00',
              ),
            ],
          ),
        ),
      ),
    );
  }
}