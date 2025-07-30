

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportClientBottomSheet extends StatelessWidget {
  const ReportClientBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return    DraggableScrollableSheet(
      initialChildSize: 0.2, // default 20% of screen
      minChildSize: 0.1,     // min height
      maxChildSize: 0.8,     // max height
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
          ),
          child: ListView.builder(
            controller: scrollController,
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.location_on),
                title: Text("Location #$index"),
              );
            },
          ),
        );
      },
    );
  }
}
