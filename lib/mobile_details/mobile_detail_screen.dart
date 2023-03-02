import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../card_payment/card_view.dart';
import '../routes/appRoutes.dart';
import '../utils/customWidgets.dart';
import 'mobile_details_controller.dart';

class MobileDetailsScreen extends StatelessWidget {
  MobileDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("width is ${Get.width}");
    return Scaffold(
      appBar: AppBar(
        title: AppBarCont(route: AppRoutes.details),
      ),
      body: GetBuilder<MobileDetailsController>(
          init: MobileDetailsController(),
          builder: (controller) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: const BoxDecoration(

                      ),
                  child: SingleChildScrollView(
                    child: Column(
                      // crossAxisAlignment : CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assests/images/charminar.jpg",
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Learning Python for Data Analysis and Visualization Ver 1",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 24, color: Colors.black,),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Learn python and how to use it to analyze,visualize and present data. Includes tons of sample code and hours of video!",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Created by ",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text("Jose Portilla",
                                style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "LastUpdated 09/2019",
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.language_outlined),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "English",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 1.0,
                          leading: Icon(
                            Icons.language_outlined,
                            color: Colors.black,
                          ),
                          title: Text(
                            "English[Auto], Indonesian[Auto],italian[Auto],polish[Auto],Portuguese[Auto],Spanish[Auto]",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                       /* Container(
                          width: 250,
                          height: 45,
                          child: MaterialButton(
                            onPressed: () {},
                            color: Colors.brown,
                            child: Text("Add to cart",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700)),
                          ),
                        ),*/
                        Container(
                          margin: EdgeInsets.only(top: 18),
                          width: 250,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                              border: Border.all(color: Colors.black)),
                          child: MaterialButton(
                            onPressed: () {
                              Get.dialog(const CardScreen());

                            },
                            child: Text(
                              "Buy Now",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("30-Day Money-back Guarantee"),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("This Course include"),
                        buildListTile(
                            "This Course include", Icons.video_camera_back),
                        buildListTile(
                            "2 articles", Icons.insert_drive_file_outlined),
                        buildListTile(
                            "6 downloadable resources", Icons.download),
                        buildListTile(
                            "This Course include", Icons.insert_drive_file),
                        buildListTile("This Course include",
                            Icons.mobile_screen_share_sharp),
                        buildListTile("This Course include",
                            Icons.precision_manufacturing),
                        Container(
                          height: Get.width > 620 ? 250 : null,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                              border: Border.all(color: Colors.black)),
                          child: Wrap(direction: Axis.vertical, children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text("What You'll learn"),
                            ),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                width: 250,
                                child: const Text(
                                    "Analyze financial statements to gain deeper insight into the financial results, profitability, financial strength, and cash return generation potential.")),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                width: 250,
                                child: const Text(
                                    "Analyze financial statements to gain deeper insight into the financial results, profitability, financial strength, and cash return generation potential.")),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 35, horizontal: 10),
                                width: 300,
                                child: const Text(
                                    "Analyze financial statements to gain deeper insight into the financial results, profitability, financial strength, and cash return generation potential.")),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                width: 300,
                                child: const Text(
                                    "Analyze financial statements to gain deeper insight into the financial results, profitability, financial strength, and cash return generation potential.")),
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 550,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Course content"),
                              const ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Text(
                                    "15 sections • 110 lectures • 21h 5m total length"),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.0),
                                    border: Border.all(color: Colors.grey)),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) => Card(
                                          child: ListTile(
                                    leading: IconButton(
                                      splashRadius: 0.1,
                                      onPressed: () {},
                                      icon: const Icon(Icons.arrow_drop_down),
                                    ),
                                    title: const Text("Course content"),
                                    trailing: const Text("Course content"),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text("Requirements"),
                        Text("General business acumen"),
                        Text("A passion for finance"),
                        Text("A sense of humor"),
                        const Text(
                            """Are you a financial professional working in industry looking to get more out of your career?

                              Do you have what it takes to sit at the boardroom table at your company and contribute?

                              Do you want to take what you know about the numbers side of the business and make a greater 
                              contribution at the highest levels?

                              If this is the way you are thinking today and the direction you'd like to go, then this is the 
                              leadership program for you.

                              Hi there, I’m Blair Cook and I’m a seven time CFO and three time corporate director. 
                              I’ve spent the past two decades around the boardroom table facilitating strategy sessions,
                               raising financing, negotiating mergers and acquisitions, and 
                               reporting to a board of directors or serving on the board of directors.

                              In this program, we have curated ideas to help financial professionals move from the cubicle to the corner office 
                              as soon as possible. Its table stakes that you know the numbers and can prepare the reports. 
                              In this program, you’ll learn to move beyond the accounting to think strategically, act as a 
                              catalyst leader, and influence the decisions of any organization for the better.

                              What are you waiting for? Enroll with us now to get started!"""),
                        const Text(
                          "Who this course is for:",
                          textAlign: TextAlign.left,
                        ),
                        const Text(
                            "Financial professional seeking senior or executive professional development"),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }

  ListTile buildListTile(String text, IconData icon) {
    return ListTile(
      dense: true,
      // contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 1.0,
      leading: Icon(icon),
      title: Text(text),
    );
  }
}
