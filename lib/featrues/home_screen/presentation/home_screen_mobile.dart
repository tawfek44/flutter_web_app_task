import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constants/constnats.dart';
import 'package:flutter_task/core/styles/colors.dart';
import 'package:flutter_task/core/widgets/app_text.dart';
import 'package:flutter_task/featrues/home_screen/presentation/item_card_view.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  bool isChoiceSelected = false;
  ChoicesType choices = ChoicesType.items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: AppBar(
            bottom: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 2.h),
                child: Container(
                  height: .128.h,
                  color: AppColors.primaryColor,
                )),
            backgroundColor: Colors.black,
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.dehaze,
                  color: AppColors.white,
                )),
            title: AppText(
              text: "Logo",
              fontSize: appBarFontLogoSizeForMobile,
              color: AppColors.primaryColor,
            ),
            actions: getAppBarActions(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15.h,
              ),
              getItemsRow(),
              SizedBox(
                height: 25.h,
              ),
              ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => const TaskCardView(),
              )
            ],
          ),
        ),
      ),
    );
  }

  getItemsRow() => Row(
        children: [
          AppText(
            text: "Items",
            color: AppColors.white,
            fontSize: fontSize + 10.sp,
          ),
          const Spacer(),
          IconButton(
            style:
                IconButton.styleFrom(backgroundColor: AppColors.secondaryColor),
            onPressed: () {},
            icon: const Icon(
              Icons.tune,
              color: AppColors.white,
            ),
          ),
        ],
      );

  getIconButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
      ),
      onPressed: () {},
      label: AppText(text: "Add a new item"),
      icon: const Icon(
        Icons.add,
        color: AppColors.black,
      ),
    );
  }

  List<Widget> getAppBarActions() => [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: const Icon(Icons.settings_outlined, color: AppColors.white)),
        const Icon(
          Icons.notifications_outlined,
          color: AppColors.white,
        ),
        getAppBaerVerticalDivider(),
        CircleAvatar(
          radius: 10.w,
          backgroundImage: const NetworkImage(
            "https://images.pexels.com/photos/1459495/pexels-photo-1459495.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          ),
        ),
      ];

  getAppBaerVerticalDivider() {
    return VerticalDivider(
      color: AppColors.dividerColor,
      indent: 20.h,
      endIndent: 20.h,
    );
  }

  // Function to create a choices widget
  Widget getChoicesWidget(
      {required String choiceValue, required ChoicesType fromWhere}) {
    return TextButton(
      onPressed: () {
        // Handle button press without hiding
        choices = _onChoiceSelected(choice: fromWhere);
        setState(() {});
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox.shrink(),
          AppText(
            text: choiceValue,
            color: Colors.white,
          ),
          if (isChoiceSelected && choices == fromWhere) ...[
            Container(
              color: AppColors.primaryColor,
              height: 2.h,
              width: 8.w,
            )
          ] else
            const SizedBox.shrink(),
        ],
      ),
    );
  }

  // Handle the action when a choice is selected
  ChoicesType _onChoiceSelected({required ChoicesType choice}) {
    setState(() {
      isChoiceSelected = true;
    });
    return choice;
  }
}

enum ChoicesType { items, pricing, info, tasks, analytics }
