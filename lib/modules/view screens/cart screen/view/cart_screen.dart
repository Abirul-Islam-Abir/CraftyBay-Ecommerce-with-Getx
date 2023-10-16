import 'package:crafty_bay_ecommerce/modules/view%20screens/bottom%20nav/controller/bottom_nav_controller.dart';
import 'package:crafty_bay_ecommerce/modules/view%20screens/home%20screen/controller/home_screen_controller.dart';
import 'package:crafty_bay_ecommerce/utils/snackbar.dart';

import '../../../../utils/export.dart';
import '../../../widgets/bottom_details_card.dart';
import '../../../widgets/normal_text.dart';
import '../../home screen/component/cart_card.dart';
import '../controller/cart_screen_controller.dart';

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
                          removeBtn: () {},
                          addBtn: () {},
                          deletePress: () {
                            SnackToast.showDeleteDialog(
                                controller.cartList[index].id);
                          },
                          count: '00',
                          title: controller.cartList[index].product ?? 'Null',
                          price: '00.00',
                          colorText: controller.cartList[index].color ?? 'Red',
                          sizeText: controller.cartList[index].size ?? 'XX'),
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
