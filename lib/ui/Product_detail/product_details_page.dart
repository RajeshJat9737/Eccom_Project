import 'package:ecomm_class/data/remote/models/product_model.dart';
import 'package:ecomm_class/domain/constants/app_routes.dart';
import 'package:ecomm_class/ui/cart/bloc/cart_bloc.dart';
import 'package:ecomm_class/ui/cart/bloc/cart_event.dart';
import 'package:ecomm_class/ui/cart/bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductModel? currentProduct;
  int quantity = 1;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    currentProduct = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Color(0xffF6F6F6),
                  child: Stack(
                    children: [
                      Center(
                        child: Image.network(
                          currentProduct!.image!,
                          width: 200,
                          height: 200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 33.0,
                          left: 7,
                          right: 7,
                        ),
                        child: Row(
                          children: [
                            InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: (){
                                Navigator.pushReplacementNamed(context, AppRoutes.route_dashboard);
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                 decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.share, color: Colors.black),
                              ),
                            ),
                            SizedBox(width: 10),
                            InkWell(
                              onTap: (){
                                Navigator.pushReplacementNamed(context, AppRoutes.route_favorit_page);
                              },
                              child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(21),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentProduct!.name ?? "",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "₹ ${currentProduct!.price ?? ""}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrangeAccent,
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.white,
                                          size: 12,
                                        ),
                                        Text(
                                          "4.8",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 11),
                                  Text(
                                    "(320 review)",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "Seller: Tariqul",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Color",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 11),
                      SizedBox(
                        height: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              margin: EdgeInsets.all(3),
                              width: 35,
                              height: 38,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 11),
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.brown),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.all(3),
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.brown,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 11),
                            Container(
                              margin: EdgeInsets.all(3),
                              width: 35,
                              height: 38,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 11),
                            Container(
                              margin: EdgeInsets.all(3),
                              width: 35,
                              height: 38,
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 11),
                            Container(
                              margin: EdgeInsets.all(3),
                              width: 35,
                              height: 38,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrangeAccent,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Text(
                                    "Description",
                                    style: TextStyle(color: Colors.white,fontSize: 15),
                                  ),
                                ),
                                Text("Specifications"),
                                Text("Reviews"),
                              ],
                            ),
                            SizedBox(height: 11,),
                            Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [Text("Lorem ipsup dorol sit amet consectur adip.",style: TextStyle(color: Colors.grey.shade700),)]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 90,
              margin: EdgeInsets.all(25),
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(45),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatefulBuilder(
                    builder: (context, ss) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (quantity > 1) {
                                  quantity--;
                                  ss(() {});
                                }
                              },
                              icon: Icon(Icons.remove, color: Colors.white),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "$quantity ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(width: 5),
                            IconButton(
                              onPressed: () {
                                quantity++;
                                ss(() {});
                              },
                              icon: Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  InkWell(
                    onTap: () {
                      context.read<CartBloc>().add(
                        AddToCartEvent(
                          productId: int.parse(currentProduct!.id!),
                          quantity: quantity,
                        ),
                      );
                    },
                    child: BlocConsumer<CartBloc, CartState>(
                      listener: (context, state) {
                        if (state is CartLoadingState) {
                          isLoading = true;
                        }

                        if (state is CartFailureState) {
                          isLoading = false;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMsg),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }

                        if (state is CartSuccessState) {
                          isLoading = false;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Item added to Cart Successfully!!",
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      builder: (context, state) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 21,
                            vertical: 13,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: isLoading
                              ? Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 11),
                                    Text(
                                      "Adding To Cart...",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              : Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
