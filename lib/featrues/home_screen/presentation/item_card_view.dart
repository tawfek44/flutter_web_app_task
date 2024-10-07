import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/styles/colors.dart';
import 'package:flutter_task/core/widgets/app_text.dart';

class TaskCardView extends StatelessWidget {
  const TaskCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.black,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: getItemImage(context: context),
            ),
            getItemInfoWidget(),
          ],
        ),
      ),
    );
  }

  getItemImage({required context}) => Flexible(
        child: Stack(
          children: [
            getItemImageWidget(),
            getThreeDotsButton(context: context)
          ],
        ),
      );

  getItemImageWidget() => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        child: Image.network(
          'https://images.pexels.com/photos/1459495/pexels-photo-1459495.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          width: double.infinity, // Make it responsive
          height: 300.h, // Adjust height dynamically
          fit: BoxFit.cover, // Ensure the image fits the container
        ),
      );

  getItemInfoWidget() => Padding(
        padding: EdgeInsets.symmetric(vertical:  8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getItemStatusWidget(),
            SizedBox(height: 4.h),
            AppText(
              text: 'Item Title',
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.grey, size: 16.w),
                SizedBox(width: 4.w),
                AppText(
                    fontSize: 14.sp,
                    text: 'Jan 16 - Jan 20, 2024',
                    maxLines: 2,
                    color: AppColors.greyColor),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Profile Avatars
                SizedBox(
                  width: 70.w,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomLeft,
                    children: [
                      CircleAvatar(
                        backgroundImage: const NetworkImage(
                            "https://media.istockphoto.com/id/1014791354/photo/charming-man.jpg?s=1024x1024&w=is&k=20&c=ByPkFNJv99jSHiC-FqrxErjbNLlCMsZULTAUt4dODXA="),
                        radius: 10.w,
                      ),
                      Positioned(
                        left: 15.w,
                        child: CircleAvatar(
                          backgroundImage: const NetworkImage(
                              "https://media.istockphoto.com/id/906808234/photo/handsome-man.jpg?s=1024x1024&w=is&k=20&c=D6KMO7LtLa-CsYmgYavDEN8TyDrdNHvTtyfFkrg4iYA="),
                          radius: 10.w,
                        ),
                      ),
                      Positioned(
                        left: 25.w,
                        child: CircleAvatar(
                          backgroundColor: AppColors.white,
                          radius: 10.w,
                          child: AppText(
                            text: '+6',
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Task status
                AppText(
                    text: '4 unfinished tasks',
                    color: AppColors.greyColor,
                    fontSize: 12.sp),
              ],
            )
          ],
        ),
      );

  getItemStatusWidget() => Opacity(
        opacity: .5,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.w),
                  side: BorderSide(
                      color: AppColors.black,
                      width: 1.w,
                      style: BorderStyle.solid)),
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              backgroundColor: AppColors.itemButtonColor),
          onPressed: () {},
          label: AppText(
            text: "Pending Approval",
            fontSize: 12.sp,
            color: AppColors.white,
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.white,
          ),
          iconAlignment: IconAlignment.end,
        ),
      );

  getThreeDotsButton({required context}) => Positioned(
        top: 2.h,
        right: 2.w,
        child: Align(
          alignment: Alignment.topRight,
          child: Opacity(
            opacity: .6,
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: AppColors.black,
                radius: MediaQuery.of(context).size.width > 600 ? 20.w : 15.w,
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.more_horiz,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
