import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:learning_app/app/constants/color.dart';
import 'package:learning_app/app/pages/video/video_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  _initData() {
    DefaultAssetBundle.of(context).loadString('json/info.json').then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Courses',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppColor.homePageTitle,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: AppColor.homePageIcons,
                ),
                const SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColor.homePageIcons,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  'Your Lesson',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColor.homePageSubtitle,
                  ),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () => Get.to(
                    const VideoInfo(),
                  ),
                  child: Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColor.homePageDetail,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: AppColor.homePageIcons,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 230,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.gradientFirst.withOpacity(.8),
                    AppColor.gradientSecond.withOpacity(.9),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                ),
                color: AppColor.secondPageContainerGradient1stColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(80),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(5, 10),
                    blurRadius: 20,
                    color: AppColor.gradientSecond.withOpacity(.2),
                  )
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 15,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next lesson',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.homePageContainerTextSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Let\'s Start',
                      style: TextStyle(
                        fontSize: 25,
                        color: AppColor.homePageContainerTextBig,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'and Learn Together',
                      style: TextStyle(
                        fontSize: 25,
                        color: AppColor.homePageContainerTextBig,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: AppColor.homePageContainerTextBig,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '60 min',
                              style: TextStyle(
                                color: AppColor.homePageContainerTextSmall,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.gradientFirst,
                                  blurRadius: 10,
                                  offset: const Offset(4, 8),
                                )
                              ]),
                          child: const Icon(
                            Icons.play_circle_fill,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://scontent-nrt1-1.xx.fbcdn.net/v/t39.30808-6/420358779_786674660169552_3918623666065571420_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=RZ3_Ogi6BnwAb6DRq0t&_nc_pt=1&_nc_ht=scontent-nrt1-1.xx&oh=00_AfBJDFuA0jX-K6TCJOL8qQ99IjouHPsb6wLXySHlgaxtBA&oe=66214519'),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                              Colors.deepPurple, BlendMode.darken),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 40,
                            offset: const Offset(8, 10),
                            color: AppColor.gradientSecond.withOpacity(.3),
                          ),
                          BoxShadow(
                            blurRadius: 10,
                            offset: const Offset(-1, -5),
                            color: AppColor.gradientSecond.withOpacity(.3),
                          )
                        ]),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                      right: 200,
                      bottom: 30,
                      top: 30,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFvovgYCobgt69WN9VvhDzQtuphPq_cxSfgg&s"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(left: 140, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You are doing great',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColor.homePageDetail,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Keep it up\n",
                            style: TextStyle(
                              color: AppColor.homePagePlanColor,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: 'stick to your plan',
                                style: TextStyle(
                                  color: AppColor.homePagePlanColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Diamond Members',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: AppColor.homePageTitle,
                  ),
                )
              ],
            ),
            Expanded(
                child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                    itemCount: info.length.toDouble() ~/ 2,
                    itemBuilder: (context, index) {
                      int a = 2 * index;
                      int b = 2 * index + 1;
                      return Row(
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width - 90) / 2,
                            height: 170,
                            margin: const EdgeInsets.only(
                                left: 30, bottom: 15, top: 15),
                            padding: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    AppColor.gradientSecond.withOpacity(.5),
                                    BlendMode.darken),
                                image: NetworkImage(info[a]['img']),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColor.gradientSecond.withOpacity(.1),
                                  blurRadius: 3,
                                  offset: const Offset(5, 5),
                                ),
                                BoxShadow(
                                  color:
                                      AppColor.gradientSecond.withOpacity(.1),
                                  blurRadius: 3,
                                  offset: const Offset(-5, -5),
                                )
                              ],
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    info[a]['title'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width - 90) / 2,
                            height: 170,
                            padding: const EdgeInsets.only(bottom: 5),
                            margin: const EdgeInsets.only(
                                left: 30, bottom: 15, top: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    AppColor.gradientSecond.withOpacity(.5),
                                    BlendMode.darken),
                                image: NetworkImage(info[b]['img']),
                                fit: BoxFit.fill,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      AppColor.gradientSecond.withOpacity(.1),
                                  blurRadius: 3,
                                  offset: const Offset(5, 5),
                                ),
                                BoxShadow(
                                  color:
                                      AppColor.gradientSecond.withOpacity(.1),
                                  blurRadius: 3,
                                  offset: const Offset(-5, -5),
                                )
                              ],
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    info[b]['title'],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
