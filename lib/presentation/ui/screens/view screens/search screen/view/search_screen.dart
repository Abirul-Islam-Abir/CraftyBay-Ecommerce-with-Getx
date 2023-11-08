import 'package:crafty_bay_ecommerce/data/utils/export.dart';

class SearchScreen extends StatelessWidget {
    SearchScreen({super.key});
final controller = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return   Scaffold(body: Column(
      children: [
        TextFormField(controller: controller.searchController,onChanged: (v){

        },),
        Expanded(
          child: ListView.builder(
            itemCount: controller.listProductByBrand.length,
            itemBuilder:  (context, index) => Text(''),),
        ),
      ],
    ),);
  }
}
