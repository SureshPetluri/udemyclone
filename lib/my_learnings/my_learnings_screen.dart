import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';
import '../routes/appRoutes.dart';
import '../utils/customWidgets.dart';

class MyLearningsScreen extends StatelessWidget {
  const MyLearningsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBarCont(route:AppRoutes.myLearnings,),),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 40),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 400,
                  mainAxisSpacing: 20,
                  maxCrossAxisExtent:Get.width<780? 340 : 380,
                  crossAxisSpacing: 20.0),
              itemCount: 5,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 400,
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.learn);
                    },
                    child: Column(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assests/images/charminar.jpg",
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          "The complete JavaScript Course 2023:From Zero To Expert!",
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 5,),
                        const Text("Stephane Maareke,Stephane Maareke",textAlign: TextAlign.left,),
                        const SizedBox(height: 5,),
                        Row(
                          children: const [
                            Text("529"),
                            SizedBox(width: 10,),
                            Text("1649",style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.lineThrough,
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
