import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/screens/client/client_dashboard/client_support/bloc/client_support_bloc.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FaqQnaTile extends StatefulWidget {
  int index;
  Map<String,dynamic> item;
   FaqQnaTile(this.index,this.item, {super.key});

  @override
  State<FaqQnaTile> createState() => _FaqQnaTileState();
}

class _FaqQnaTileState extends State<FaqQnaTile> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ClientSupportBloc,ClientSupportState>(
        builder: (context,state){

          final List<dynamic> questions = widget.item["questions"];
          final expandedGroup = state is FaqState ? state.expandedGroupIndex : null;
          final expandedQuestion = state is FaqState ? state.expandedQuestionIndex : null;
          final bool isGroupExpanded = expandedGroup == widget.index;

          return  GestureDetector(
            onTap: (){
              context.read<ClientSupportBloc>().add(ToggleGroup( widget.index));

            },
            child: Container(
              padding: EdgeInsets.all(15.r),
              margin: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.col007FC4),

                  borderRadius: BorderRadius.circular(12.r)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _rowWithArrow(widget.item["category"], isGroupExpanded ),
                 if( isGroupExpanded) ...List.generate(questions.length, (i){
                    int questionIndex = widget.index * 10 + i;
                    final q = questions[i]["q"];
                    final a = questions[i]["a"];
                    final isQuestionExpanded = expandedQuestion == questionIndex;
                    return    GestureDetector(
                      onTap: ()=> context.read<ClientSupportBloc>().add(ToggleQuestion(questionIndex)),
                      child: Container(
                        padding: EdgeInsets.all(15.r),
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.col007FC4),

                            borderRadius: BorderRadius.circular(12.r)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _rowWithArrow(q, isQuestionExpanded),
                            if(isQuestionExpanded)...[
                              SizedBox(height: 10.h,),
                              Text(a,
                                style:regularTextStyle(fontSize: dimen10.sp, color: AppColors.col007FC4),
                              )
                            ]
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          );
        });
  }
  Widget _rowWithArrow(String title, bool isExpanded) {
    return Row(
      children: [
        Expanded(child: Text(title, style: regularTextStyle(fontSize: dimen12.sp,color: AppColors.col6666))),
        SvgPicture.asset( isExpanded ? Assets.svg.keyboardArrowUp:Assets.svg.keyboardArrowDown),
      ],
    );
  }
}
