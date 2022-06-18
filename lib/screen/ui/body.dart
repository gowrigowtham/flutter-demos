import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googlemapdemo/screen/ui/animated_container_widget.dart';
import 'package:googlemapdemo/screen/ui/button_widget.dart';
import 'package:googlemapdemo/screen/ui/column_widget.dart';
import 'package:googlemapdemo/screen/ui/container_widget.dart';
import 'package:googlemapdemo/screen/ui/fitted_box_widget.dart';
import 'package:googlemapdemo/screen/ui/gridview_widget.dart';
import 'package:googlemapdemo/screen/ui/listview_widget.dart';
import 'package:googlemapdemo/screen/ui/row_widget.dart';
import 'package:googlemapdemo/screen/ui/stack_widget.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /* ContainerWidget(),
        AnimatedContainerWidget(),
        RowWidget(),
        ColumnWidget(),
        StackWidget(),
        ListViewWidget(),
        GridViewWidget(),
        ButtonWidget(),*/
        FittedBoxWidget(),
      ],
    );
  }
}
