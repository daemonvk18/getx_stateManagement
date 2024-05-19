import 'package:get/get.dart';
import 'package:getxstatemanagment_app/models/product.dart';

class ShoppingController extends GetxController {
  var products = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    //fetching the products data here
    await Future.delayed(Duration(seconds: 1));
    var serverResponse = [
      Product(
          ProductImage: "ProductImage",
          id: 1,
          productDescription: "productDescription",
          productName: "FirstPod",
          productPrice: 30.00),
      Product(
          ProductImage: "ProductImage",
          id: 2,
          productDescription: "productDescription",
          productName: "SecondPod",
          productPrice: 40.00),
      Product(
          ProductImage: "ProductImage",
          id: 3,
          productDescription: "productDescription",
          productName: "ThirdPod",
          productPrice: 39.50),
    ];
    products.value = serverResponse;
  }
}
