
import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/infrastructure/utils/app_menu_bar.dart';
import 'package:endeavors/screens/dash_board/client/bloc/client_bloc.dart';
import 'package:endeavors/screens/dash_board/client/presentation/widget/client_grid_view.dart';
import 'package:endeavors/screens/dash_board/client/presentation/widget/client_list_view.dart';
import 'package:endeavors/screens/dash_board/client/presentation/widget/search_text_filed.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  final searchBarTextFiled = TextEditingController();

  @override
  void initState() {
    context.read<ClientBloc>().add(LoadClientData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colBg.withOpacity(0.03),
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
                    BlocBuilder<ClientBloc, ClientState>(
                        builder: (context, state) {
                      if (state is ClientLoading) {
                        return CircularProgressIndicator();
                      } else if (state is ClientLoaded) {
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
                                          context.read<ClientBloc>().add(ToggleViewType(isGridView: true));
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
                                          context.read<ClientBloc>().add(ToggleViewType(isGridView: false));

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

                              isGridView?  ClientGridView(dashBoardPersonModel: state.dashBoardPersonModel,):ClientListView(dashBoardPersonModel: state.dashBoardPersonModel,),
                            ]);
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
    );
  }
}
