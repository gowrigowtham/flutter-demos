import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:googlemapdemo/screen/ui/animated_container_widget.dart';
import 'package:googlemapdemo/screen/ui/button_widget.dart';
import 'package:googlemapdemo/screen/ui/column_widget.dart';
import 'package:googlemapdemo/screen/ui/container_widget.dart';
import 'package:googlemapdemo/screen/ui/expansion_tile.dart';
import 'package:googlemapdemo/screen/ui/fitted_box_widget.dart';
import 'package:googlemapdemo/screen/ui/future_builder_widget.dart';
import 'package:googlemapdemo/screen/ui/gesture_detector_widget.dart';
import 'package:googlemapdemo/screen/ui/gridview_widget.dart';
import 'package:googlemapdemo/screen/ui/inkwell_widget.dart';
import 'package:googlemapdemo/screen/ui/interative_viewer.dart';
import 'package:googlemapdemo/screen/ui/listview_widget.dart';
import 'package:googlemapdemo/screen/ui/media_query_widget.dart';
import 'package:googlemapdemo/screen/ui/pageview_widget.dart';
import 'package:googlemapdemo/screen/ui/rich_text.dart';
import 'package:googlemapdemo/screen/ui/row_widget.dart';
import 'package:googlemapdemo/screen/ui/safe_area_widget.dart';
import 'package:googlemapdemo/screen/ui/sliver_widget.dart';
import 'package:googlemapdemo/screen/ui/spread_operator_widget.dart';
import 'package:googlemapdemo/screen/ui/stack_widget.dart';
import 'package:googlemapdemo/screen/ui/text_widget.dart';
import 'package:googlemapdemo/screen/ui/visibility_widget.dart';
import 'package:googlemapdemo/screen/ui/will_pop_widget.dart';
import 'package:googlemapdemo/screen/ui/wrap_widget.dart';

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
      children: const [
        /* ContainerWidget(),
           AnimatedContainerWidget(),
          RowWidget(),
          ColumnWidget(),
          StackWidget(),
          ListViewWidget(),
          GridViewWidget(),
          ButtonWidget(),
          FittedBoxWidget(),
          WrapWidget(),
          ExpansionWidget(),
          VisibilityWidget(),*/
        PageViewWidget(),
        /* SliverWidget(),
          WillpopScopeWidget(),
          FutureBuilderWidget(),
          // SpreadOperatorWidget()
          GestureDectectorWidget(),
          InkWellWidget(),
          InteractiveViewerWidget()
          MediaQueryWidget()
          SafeAreaWidget()
          TextWidget(),
          RichTextWidget()*/
      ],
    );
  }
}
