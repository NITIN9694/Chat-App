import 'package:endeavors/gen/assets.gen.dart';
import 'package:endeavors/screens/client/client_dashboard/client_support/bloc/client_support_bloc.dart';
import 'package:endeavors/styles/colors.dart';
import 'package:endeavors/styles/sizes.dart';
import 'package:endeavors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FaqTile extends StatefulWidget {
  int index;

  Map<String, dynamic> item;

  FaqTile(this.index, this.item, {super.key});

  @override
  State<FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<FaqTile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientSupportBloc,ClientSupportState>(
      builder: (context,state){
        final isExpanded = state is FaqState && state.expandedGroupIndex  == widget.index;

        return     Padding(
          padding:  EdgeInsets.symmetric(vertical:10.h ),
          child: GestureDetector(
            onTap: ()=> context.read<ClientSupportBloc>().add(ToggleGroup(widget.index)),
            child: Container(
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.col007FC4),

                  borderRadius: BorderRadius.circular(12.r)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 _rowWithArrow(widget.item["category"], isExpanded),
                  if(isExpanded)...[
                    SizedBox(height: 10.h,),
                    Text(widget.item["description"],
                    style:regularTextStyle(fontSize: dimen10.sp, color: AppColors.col007FC4),
                    )
                  ]
                ],
              ),
            ),
          ),
        );
      },
    );
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
