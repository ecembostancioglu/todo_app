import 'package:flutter/material.dart';
import '/constants/app_color_constants.dart';
import '/constants/app_text_constants.dart';
import 'month_todos_page.dart';
import 'today_todos_page.dart';
import 'week_todos_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            bottom:  const TabBar(
              labelColor: AppColorConstants.purple,
              unselectedLabelColor: AppColorConstants.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: AppColorConstants.white),
                tabs: [
                Tab(
                  child:Align(
                    alignment: Alignment.center,
                    child: Text(AppTextConstants.todayTabController),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(AppTextConstants.weekTabController),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(AppTextConstants.monthTabController),
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              TodayToDosPage(),
              WeekToDosPage(),
              MonthToDosPage(),
            ],
          ),
        ),
      ),
    );
  }
}