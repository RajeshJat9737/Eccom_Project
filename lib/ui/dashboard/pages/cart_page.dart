import 'package:ecomm_class/data/remote/models/category_model.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  category_model? currentCart;
  int? quantity = 1;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Color(0xffF6F6F6),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40.0,
                      left: 7,
                      right: 7,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                            onTap: (){
                              
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 100, height: 10),
                        Text(
                          "My Cart",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
            flex: 13,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 380,
                            height: 140,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(21.0),
                              child: Row(
                                children: [
                                  Image(
                                    image: NetworkImage(
                                      currentCart!.id ?? "",
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            currentCart!.name ?? "",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "WomanFesion",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              SizedBox(width: 15,),
                                              Icon(Icons.delete_forever, color: Colors.red),
                                            ],
                                          ),
                                          Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("jkdfnks"),
                                              SizedBox(width: 15,),
                                              Container(
                                                width: 80,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffF7F7F7),
                                                  borderRadius: BorderRadius.circular(20)

                                                ),child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text("-",style: TextStyle(fontSize: 21,color: Colors.black,fontWeight: FontWeight.bold),),
                                                  SizedBox(width: 11,),
                                                  Text("1",style: TextStyle(fontSize: 21,color: Colors.black,fontWeight: FontWeight.bold),),
                                                  SizedBox(width: 11,),
                                                  Text("+",style: TextStyle(fontSize: 21,color: Colors.black,fontWeight: FontWeight.bold),),
                                                ],
                                              ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 350,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Row(
                              children: [
                                Image(
                                  image: NetworkImage(
                                    "https://picsum.photos/seed/p1/400/400",
                                  ),
                                ),
                                SizedBox(width: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "currentCart!.name ?? "
                                              "",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "WomanFesion",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(width: 15,),
                                            Icon(Icons.delete_forever, color: Colors.red),
                                          ],
                                        ),
                                        Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("jkdfnks"),
                                            SizedBox(width: 15,),
                                            Container(
                                              width: 80,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffF7F7F7),
                                                  borderRadius: BorderRadius.circular(20)

                                              ),child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("-",style: TextStyle(fontSize: 21,color: Colors.black,fontWeight: FontWeight.bold),),
                                                SizedBox(width: 11,),
                                                Text("1",style: TextStyle(fontSize: 21,color: Colors.black,fontWeight: FontWeight.bold),),
                                                SizedBox(width: 11,),
                                                Text("+",style: TextStyle(fontSize: 21,color: Colors.black,fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        )

                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 350,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Row(
                              children: [
                                Image(
                                  image: NetworkImage(
                                    "https://picsum.photos/seed/p1/400/400",
                                  ),
                                ),
                                SizedBox(width: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "currentCart!.name ?? "
                                              "",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "WomanFesion",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            SizedBox(width: 15,),
                                            Icon(Icons.delete_forever, color: Colors.red),
                                          ],
                                        ),
                                        Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("jkdfnks"),
                                            SizedBox(width: 15,),
                                            Container(
                                              width: 80,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffF7F7F7),
                                                  borderRadius: BorderRadius.circular(20)

                                              ),child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text("-",style: TextStyle(fontSize: 21,color: Colors.black,fontWeight: FontWeight.bold),),
                                                SizedBox(width: 11,),
                                                Text("1",style: TextStyle(fontSize: 21,color: Colors.black,fontWeight: FontWeight.bold),),
                                                SizedBox(width: 11,),
                                                Text("+",style: TextStyle(fontSize: 21,color: Colors.black,fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        )

                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
