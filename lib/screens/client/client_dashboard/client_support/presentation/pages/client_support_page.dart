import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/infrastructure/routes/app_pages.dart';
import 'package:endeavors/screens/case_manager/dash_board/case_manager/presentation/widget/search_text_filed.dart';
import 'package:endeavors/screens/client/client_dashboard/client_support/presentation/widget/faq_qna_tile.dart';
import 'package:endeavors/screens/client/client_dashboard/client_support/presentation/widget/faq_tile.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ClientSupportPage extends StatefulWidget {
  const ClientSupportPage({super.key});

  @override
  State<ClientSupportPage> createState() => _ClientSupportPageState();
}

class _ClientSupportPageState extends State<ClientSupportPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> faqData = [
      {
        "category": "How to connect with my case manager?",
        "description":
        "Lorem ipsum dolor sit amet consectetur. Nulla orci leo mauris mauris. Tristique tristique scelerisque pellentesque nunc morbi ut quisque enim. Felis eget tristique duis molestie quis tellus suspendisse. Ultrices et diam vulputate.",
      },
      {
        "category": "How to get job",
        "description":
        "Lorem ipsum dolor sit amet consectetur. Nulla orci leo mauris mauris. Tristique tristique scelerisque pellentesque nunc morbi ut quisque enim. Felis eget tristique duis molestie quis tellus suspendisse. Ultrices et diam vulputate.",
      },
      {
        "category": "App troubleshooting & fixes",
        "questions": [
          {"q": "App screen is stuck!", "a": "Try restarting the app."},
          {"q": "Not able to login to my account", "a": "Reset your password."},
        ]
      },
      {
        "category": "App Account",
        "questions": [
          {"q": "How to login!", "a": "Try restarting the app."},
          {"q": "Insta account", "a": "Reset your password."},
        ]
      },

    ];

    return Scaffold(
        backgroundColor: AppColors.col007FC4,
        body: LayoutBuilder(builder: (context, constraints) {
          final double constraintsHeight = constraints.maxHeight;
          final double constraintsWidth = constraints.maxWidth;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Center(
                  child: Text(
                "Support",
                style: semiBoldTextStyle(fontSize: dimen15.sp, color: AppColors.colWhite),
              )),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.colWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.sp),
                      topRight: Radius.circular(40.sp),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          //top bar
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/image/support.png",
                                height: 250.h,
                                width: 153.w,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.pushNamed(context, AppRoutes.clientChatDetail);
                                      },
                                      child: Container(
                                          width: constraintsWidth * 0.4,
                                          height: constraintsHeight * 0.19,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15.r), color: AppColors.colBlack),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical:15.h),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(15.r),
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: AppColors.colWhite.withOpacity(0.2)
                                                      ),
                                                      child: Center(
                                                        child: SvgPicture.asset(Assets.svg.chatBubble),
                                                      ),
                                                    ),
                                                    Spacer(),
                                                  ],
                                                ),
                                                Spacer(),
                                                Text("Let's Connect",
                                                  style: semiBoldTextStyle(fontSize: dimen15.sp, color: AppColors.colWhite),
                                                ),

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text("Chat with us",
                                                      style: lightTextStyle(fontSize: dimen11.sp, color: AppColors.colWhite),
                                                    ),
                                                    SvgPicture.asset(Assets.svg.arrowInsert)
                                                  ],
                                                ),

                                              ],
                                            ),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                        width: constraintsWidth * 0.4,
                                        height: constraintsHeight * 0.19,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15.r), color: AppColors.col004576),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical:15.h),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(15.r),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: AppColors.colWhite.withOpacity(0.2)
                                                    ),
                                                    child: Center(
                                                      child: SvgPicture.asset(Assets.svg.call2),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                ],
                                              ),
                                              Spacer(),
                                              Text("Get in touch",
                                                style: semiBoldTextStyle(fontSize: dimen15.sp, color: AppColors.colWhite),
                                              ),

                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text("210 888 8888",
                                                    style: lightTextStyle(fontSize: dimen11.sp, color: AppColors.colWhite),
                                                  ),
                                                  SvgPicture.asset(Assets.svg.arrowInsert)
                                                ],
                                              ),

                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),

                          SizedBox(
                            height: 25.h,
                          ),
                          //Faq
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("FAQ",
                              style: lightTextStyle(fontSize: dimen18.sp ,color: AppColors.col6666),
                              ),
                              SvgPicture.asset(Assets.svg.personRaisedHand)
                            ],
                          ),

                          Padding(
                            padding:  EdgeInsets.symmetric(vertical: 15.h),
                            child: SearchTextFiled(hintText: "Search here", controller: searchController),
                          ),
                         ListView.builder(
                             itemCount: faqData.length,
                             shrinkWrap: true,
                             physics: NeverScrollableScrollPhysics(),
                             itemBuilder: (context,selectionIndex){
                               final item  = faqData[selectionIndex];
                               if(item.containsKey("description")){
                                 return FaqTile(selectionIndex, item);
                               }else{
                                 return FaqQnaTile(selectionIndex, item);
                               }
                             }),

                          SizedBox(
                            height: 20.h,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        }));
  }
}
