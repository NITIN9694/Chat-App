import 'package:endeavors/feature/dash_board/presentation/bloc/dash_board_bloc.dart';
import 'package:endeavors/feature/dash_board/presentation/widget/search_text_filed.dart';
import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/infrastructure/utils/app_menu_bar.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final searchBarTextFiled = TextEditingController();

  @override
  void initState() {
   context.read<DashBoardBloc>().add(LoadDashBoardData());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.colWhite,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //top bar search
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Assigned Client",
                            style: mediumTextStyle(
                                fontSize: 16.sp, color: AppColors.col333),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(Assets.svg.gridView,
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(width: 15.w,),
                              SvgPicture.asset(Assets.svg.viewAgenda,
                                height: 13.h,
                                width: 12.w,
                              ),

                            ],
                          )
                        ],
                      ),

                      //search filed
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h
                        ),
                        child: SearchTextFiled(
                          hintText: "Search here", controller: searchBarTextFiled,),
                      ),
                      //DashBoard Data
                      BlocBuilder<DashBoardBloc, DashBoardState>(
                          builder: (context, state) {
                            if (state is DashBoardLoading) {
                              return CircularProgressIndicator();
                            } else if (state is DashBoardLoaded) {


                              return SizedBox(
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  padding: const EdgeInsets.all(12),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 4,
                                  ),
                                  itemCount: state.dashBoardPersonModel.length,
                                  itemBuilder: (context, index) {
                                    final person = state.dashBoardPersonModel[index];
                                    return Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 16,
                                                  backgroundImage: AssetImage(person.avatarUrl),
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  person.name,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 12),
                                            const Text("VRS Case ID:"),
                                            Text(
                                              person.caseId,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text("Job Status:"),
                                            Text(
                                              person.jobStatus,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: person.jobStatus == "Employed"
                                                    ? Colors.green
                                                    : Colors.teal,
                                              ),
                                            ),
                                            const Spacer(),
                                            const Align(
                                              alignment: Alignment.bottomRight,
                                              child: Icon(Icons.phone_outlined, size: 20),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );

                            }else if(state is DashboardError){
                              return Container(
                                color: Colors.orange,
                              );
                            }
                            return SizedBox();
                          })
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
