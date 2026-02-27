import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecomm_class/domain/constants/app_routes.dart';
import 'package:ecomm_class/ui/category/bloc/category_bloc.dart';
import 'package:ecomm_class/ui/category/bloc/category_event.dart';
import 'package:ecomm_class/ui/category/bloc/category_state.dart';
import 'package:ecomm_class/ui/dashboard/pages/home/bloc/product_bloc.dart';
import 'package:ecomm_class/ui/dashboard/pages/home/bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/product_event.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(FetchAllProductEvent());
    context.read<CategoryBloc>().add(FetchAllCategoryEvent());

  }
  int currentPosition = 0;

  List<String> banner = [
    "https://cdn.vectorstock.com/i/1000v/51/63/online-shopping-e-commerce-banner-concept-vector-25035163.jpg",
    "https://img.freepik.com/free-psd/black-friday-super-sale-web-banner-template_106176-1647.jpg",
    "https://c8.alamy.com/comp/2H4RC9Y/ecommerce-web-banner-with-3d-smartphone-illustration-with-shopping-bags-wallet-and-credit-card-icons-pump-out-of-screen-2H4RC9Y.jpg",
    "https://t4.ftcdn.net/jpg/02/49/50/15/360_F_249501541_XmWdfAfUbWAvGxBwAM0ba2aYT36ntlpH.jpg",
    "https://www.zilliondesigns.com/blog/wp-content/uploads/Perfect-Ecommerce-Sales-Banner-1280x720.jpg",
  ];

  List<Map<String, dynamic>> mProductsData = [
    {
      "image": "https://picsum.photos/seed/p1/400/400",
      "name": "Wireless Headphones",
      "price": "120",
      "colors": [
        Colors.black,
        Colors.blue,
        Colors.deepOrangeAccent,
        Colors.brown,
        Colors.amber,
        Colors.grey,
      ],
    },
    {
      "image": "https://picsum.photos/seed/p2/400/400",
      "name": "Smart Watch Pro",
      "price": "250",
      "colors": [
        Colors.black,
        Colors.grey,
        Colors.blueAccent,
        Colors.redAccent,
      ],
    },
    {
      "image": "https://picsum.photos/seed/p3/400/400",
      "name": "Bluetooth Speaker",
      "price": "90",
      "colors": [
        Colors.black,
        Colors.green,
        Colors.orange,
        Colors.purple,
      ],
    },
    {
      "image": "https://picsum.photos/seed/p4/400/400",
      "name": "Gaming Mouse",
      "price": "60",
      "colors": [
        Colors.black,
        Colors.red,
        Colors.blue,
        Colors.greenAccent,
      ],
    },
    {
      "image": "https://picsum.photos/seed/p5/400/400",
      "name": "Mechanical Keyboard",
      "price": "150",
      "colors": [
        Colors.black,
        Colors.white,
        Colors.blueGrey,
        Colors.pinkAccent,
      ],
    },
    {
      "image": "https://picsum.photos/seed/p6/400/400",
      "name": "4K Action Camera",
      "price": "300",
      "colors": [
        Colors.black,
        Colors.grey,
        Colors.redAccent,
      ],
    },
    {
      "image": "https://picsum.photos/seed/p7/400/400",
      "name": "Laptop Backpack",
      "price": "80",
      "colors": [
        Colors.black,
        Colors.brown,
        Colors.blue,
        Colors.teal,
      ],
    },
    {
      "image": "https://picsum.photos/seed/p8/400/400",
      "name": "Fitness Tracker",
      "price": "110",
      "colors": [
        Colors.black,
        Colors.pink,
        Colors.purple,
        Colors.deepPurpleAccent,
        Colors.orangeAccent,
        Colors.amber,
      ],
    },
    {
      "image": "https://picsum.photos/seed/p9/400/400",
      "name": "Portable Charger",
      "price": "45",
      "colors": [
        Colors.black,
        Colors.white,
        Colors.blueGrey,
        Colors.amber,
        Colors.redAccent,
      ],
    },
    {
      "image": "https://picsum.photos/seed/p10/400/400",
      "name": "Noise Cancelling Earbuds",
      "price": "180",
      "colors": [
        Colors.black,
        Colors.blueAccent,
        Colors.grey,
      ],
    },
    {
      "image": "https://picsum.photos/seed/p11/400/400",
      "name": "Smartphone Gimbal",
      "price": "210",
      "colors": [
        Colors.black,
        Colors.white,
        Colors.orangeAccent,
      ],
    },
    {
      "image": "https://picsum.photos/seed/p12/400/400",
      "name": "LED Desk Lamp",
      "price": "70",
      "colors": [
        Colors.white,
        Colors.black,
        Colors.amber,
      ],
    },
    {
      "image": "https://picsum.photos/seed/p13/400/400",
      "name": "VR Headset",
      "price": "350",
      "colors": [
        Colors.black,
        Colors.blueGrey,
        Colors.deepPurple,
      ],
    },
    {
      "image": "https://picsum.photos/seed/p14/400/400",
      "name": "Digital Camera",
      "price": "500",
      "colors": [
        Colors.black,
        Colors.grey,
        Colors.brown,
      ],
    },
    {
      "image": "https://picsum.photos/seed/p15/400/400",
      "name": "Tablet Stand",
      "price": "35",
      "colors": [
        Colors.black,
        Colors.redAccent,
        Colors.blueGrey,
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.games_outlined, color: Colors.black),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 11),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SizedBox(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color(0xffF6F6F6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(51),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 11),
            StatefulBuilder(
              builder: (context, ss) {
                return SizedBox(
                  height: 170,
                  child: Stack(
                    children: [
                      CarouselSlider(
                        items: banner.map((e) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.network(
                                e,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 2),
                          autoPlayCurve: Curves.easeInOut,
                          height: 200,
                          onPageChanged: (index, _) {
                            currentPosition = index;
                            ss(() {});
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        child: SizedBox(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: DotsIndicator(
                              dotsCount: banner.length,
                              animate: true,
                              position: currentPosition.toDouble(),
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              decorator: DotsDecorator(
                                activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(51),
                                ),
                                activeColor: Colors.black,
                                color: Colors.transparent,
                                activeSize: Size(15, 7),
                                size: Size(7, 7),
                                spacing: EdgeInsets.symmetric(horizontal: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(51),
                                  side: BorderSide(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 11),
            SizedBox(
              height: 100,
              child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state){
                  if (state is CategoryLoadingState){
                    return Center(
                     child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CategoryErrorState){
                    return Center(
                      child: Text(state.errorMsg),
                    );
                  }
                  if(state is CategoryLoadedState){
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categories.length,
                      itemBuilder: (_, index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 9),
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(state.categories[index].id ?? mProductsData[index]["image"],),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              mProductsData[index]["name"],
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  return Container();
                }

              ),
            ),
            SizedBox(height: 11),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For You",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            SizedBox(height: 11),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: BlocBuilder<ProductBloc,ProductState>(
                builder: (context, state) {
                  if(state is ProductLoadingState){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is ProductErrorState){
                    return Center(
                      child: Text(state.errorMsg),
                    );
                  }
                  if (state is ProductLoadedState){
                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: state.products.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 11,
                        crossAxisSpacing: 11,
                        childAspectRatio: 11 / 12,
                      ),
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, AppRoutes.route_detail_page,arguments: state.products[index]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffF6F6F6),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          state.products[index].image ?? mProductsData[index]["image"], ///  agne image null hovi to us image ki jageh pr aap ka logo wali image dikha sakhte hai
                                          width: 100,
                                          height: 100,
                                        ),
                                        SizedBox(height: 3),
                                        Text(
                                          state.products[index].name ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "₹ ${state.products[index].price }",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              spacing: 2,
                                              children: List.generate(
                                                  mProductsData[index]["colors"].length > 4 ? 4 :
                                                  mProductsData[index]["colors"].length,(childIndex) {
                                                if(mProductsData[index]["colors"].length >4 ){
                                                  if (childIndex == 3){
                                                    return Container(
                                                      width: 22,
                                                      height: 22,
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.transparent,
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                          )
                                                      ),child: Center(
                                                        child: Text("+${(mProductsData[index]["colors"].length)-3}",style: TextStyle(
                                                            color: Colors.grey.shade600,
                                                            fontSize: 10
                                                        ),)),
                                                    );
                                                  } else {
                                                    if (childIndex==0) {
                                                      return SizedBox(
                                                        width: 20,
                                                        height: 20,
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                              width: 20,
                                                              height: 20,
                                                              decoration: BoxDecoration(
                                                                border: Border.all(
                                                                  color: mProductsData[index]["colors"][childIndex],
                                                                ),
                                                                shape: BoxShape.circle,
                                                              ),
                                                            ),
                                                            Center(
                                                              child: Container(
                                                                margin: EdgeInsets.all(
                                                                    3),
                                                                width: 20,
                                                                height: 20,
                                                                decoration: BoxDecoration(
                                                                  color: mProductsData[index]["colors"][childIndex],
                                                                  shape: BoxShape.circle,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }else {
                                                      return Container(
                                                        margin: EdgeInsets.all(3),
                                                        width: 17,
                                                        height: 17,
                                                        decoration: BoxDecoration(
                                                          color: mProductsData[index]["colors"][childIndex],
                                                          shape: BoxShape.circle,
                                                        ),
                                                      );
                                                    }
                                                  }
                                                }else {
                                                  if (childIndex==0) {
                                                    return SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child: Stack(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            decoration: BoxDecoration(
                                                              border: Border.all(
                                                                color: mProductsData[index]["colors"][childIndex],
                                                              ),
                                                              shape: BoxShape.circle,
                                                            ),
                                                          ),
                                                          Center(
                                                            child: Container(
                                                              margin: EdgeInsets.all(3),
                                                              width: 20,
                                                              height: 20,
                                                              decoration: BoxDecoration(
                                                                color: mProductsData[index]["colors"][childIndex],
                                                                shape: BoxShape.circle,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }else {
                                                    return Container(
                                                      margin: EdgeInsets.all(3),
                                                      width: 17,
                                                      height: 17,
                                                      decoration: BoxDecoration(
                                                        color: mProductsData[index]["colors"][childIndex],
                                                        shape: BoxShape.circle,
                                                      ),
                                                    );
                                                  }
                                                }
                                              }),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFF6408),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(21),
                                        bottomLeft: Radius.circular(18),
                                      ),
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                    return Container();
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
