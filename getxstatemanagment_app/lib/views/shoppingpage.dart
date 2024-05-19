import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstatemanagment_app/controllers/cart_controller.dart';
import 'package:getxstatemanagment_app/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});
  final shoppingcontroller = Get.put(ShoppingController());
  final cartContyroller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: ((context, index) {
                      return Card(
                          color: Colors.white,
                          elevation: 0.0,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  //first thing is row
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //name and below it description
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //name
                                          Text(
                                            '${controller.products[index].productName}',
                                            style: TextStyle(
                                                color: Colors.grey.shade900,
                                                fontSize: 18.0),
                                          ),
                                          //description of the product
                                          Text(
                                            '${controller.products[index].productDescription}',
                                            style: TextStyle(
                                                color: Colors.grey.shade900,
                                                fontSize: 16.0),
                                          )
                                        ],
                                      ),
                                      //now the price of the product
                                      Text(
                                        "\$" +
                                            "${controller.products[index].productPrice}",
                                        style: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontSize: 20.0),
                                      )
                                    ],
                                  ),
                                  //the text button to add to cart
                                  ElevatedButton(
                                      onPressed: () {
                                        cartContyroller.addToCart(
                                            controller.products[index]);
                                      },
                                      child: Text(
                                        "Add To Cart",
                                        style:
                                            TextStyle(color: Colors.deepPurple),
                                      ))
                                ],
                              ),
                            ),
                          ));
                    }));
              }),
            ),

            //total amount shown here
            GetX<CartController>(builder: (cartController) {
              return Text(
                "Total Amount: " + '\$${cartController.totalAmount}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600),
              );
            }),
            const SizedBox(
              height: 100.0,
            ),
            GetX<CartController>(builder: (controller) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                    width: 90.0,
                    margin: const EdgeInsets.only(right: 20.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //cart icon
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),

                        //count of the cartlist
                        Text(
                          '${controller.cartItems.length}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0),
                        )
                      ],
                    )),
              );
            })
          ],
        ),
      ),
    );
  }
}
