import 'package:endeavors/infrastructure/utils/app_menu_bar.dart';
import 'package:endeavors/screens/dash_board/client/presentation/widget/search_text_filed.dart';
import 'package:endeavors/screens/dash_board/jobs/presentation/widgets/job_list_widget.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key});

  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  TextEditingController jobSearchTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colBg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppMenuBar(),
              SizedBox(
                height: 35.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jobs List",
                        style: mediumTextStyle(
                            fontSize: 16.sp, color: AppColors.col333),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: SearchTextFiled(
                          hintText: "Search here",
                          controller: jobSearchTextEditingController,
                        ),
                      ),
                      ClientListWidget(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
