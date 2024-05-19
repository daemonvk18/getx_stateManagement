import 'package:get/get.dart';
import 'package:getxstatemanagment_app/models/product.dart';

class CartController extends GetxController {
  var cartItems = [].obs;
  double get totalAmount =>
      cartItems.fold(0, (sum, item) => sum + item.productPrice);

  @override
  void onInit() {
    super.onInit();
  }

  void addToCart(Product itemadded) async {
    cartItems.add(itemadded);
  }

  void removeFromCart(Product itemremoved) {
    cartItems.remove(itemremoved);
  }
}
