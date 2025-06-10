import 'package:endeavors/feature/dash_board/presentation/bloc/dash_board_bloc.dart';
import 'package:endeavors/feature/dash_board/presentation/widget/dash_board_grid_view.dart';
import 'package:endeavors/feature/dash_board/presentation/widget/dash_board_list_view.dart';
import 'package:endeavors/feature/dash_board/presentation/widget/search_text_filed.dart';
import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/infrastructure/utils/app_menu_bar.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
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
          padding: EdgeInsets.only(left: 20.w,right: 20.w, top: 20.h),
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

                      //DashBoard Data
                      BlocBuilder<DashBoardBloc, DashBoardState>(
                          builder: (context, state) {
                        if (state is DashBoardLoading) {
                          return CircularProgressIndicator();
                        } else if (state is DashBoardLoaded) {
                          bool isGridView = true;

                            isGridView = state.isGridView;

                          return Column(
                              children: [
                                //top bar search
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Assigned Client",
                                      style: mediumTextStyle(
                                          fontSize: 16.sp, color: AppColors.col333),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap:(){
                                            context.read<DashBoardBloc>().add(ToggleViewType(isGridView: true));
                                          },
                                          child: SvgPicture.asset(
                                            isGridView?   Assets.svg.gridView:Assets.svg.unselectedGridView,
                                            height: 20.h,
                                            width: 20.w,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        GestureDetector(
                                          onTap:(){
                                            context.read<DashBoardBloc>().add(ToggleViewType(isGridView: false));

                                          },
                                          child: SvgPicture.asset(
                                          isGridView?  Assets.svg.viewAgenda:Assets.svg.selectedViewAgenda,
                                            height: 13.h,
                                            width: 12.w,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                //search filed
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.h),
                                  child: SearchTextFiled(
                                    hintText: "Search here",
                                    controller: searchBarTextFiled,
                                  ),
                                ),

                                isGridView?  DashBoardGridView(dashBoardPersonModel: state.dashBoardPersonModel,):DashBoardListView(dashBoardPersonModel: state.dashBoardPersonModel,),
                              ]);
                        } else if (state is DashboardError) {
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
