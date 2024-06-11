import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kalakar/helper/kalakar_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';
class SlidingButton extends StatelessWidget {
  const SlidingButton({
    Key? key,
    this.active = 0,
    this.buttonBackgroundColor = Colors.lightBlue,
    this.buttonBorderColor = Colors.blue,
    this.selectedColor = Colors.white,
    this.unSelectedColor = Colors.black,
    required this.buttonBorderRadius ,
    required this.onChanged,
    required this.list,
  });


  final int active;
  final Color buttonBackgroundColor;
  final Color buttonBorderColor;
  final Color selectedColor;
  final Color unSelectedColor;
  final BorderRadiusGeometry buttonBorderRadius;
  final ValueChanged<int> onChanged;
  final List<String> list;

  void _handleTap(int value) {
    onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => slidingButtonMobileView(),
      tablet: (BuildContext context) => slidingButtonWebView(),
    );
  }

  slidingButtonMobileView() {
    return LayoutBuilder(
        builder: (context,constraints) {
          return Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                width: constraints.maxWidth ,
                height: 48.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: Colors.white,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     blurRadius: 5.0,
                    //   ),
                    // ],
                    border: Border.all(color: KalakarColors.border)
                ),
                child: AnimatedAlign(
                  alignment:
                  active == 0 ? Alignment.centerLeft : Alignment.centerRight,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                    width: constraints.maxWidth / 2 ,
                    height: 40.h,
                    decoration: BoxDecoration(
                        color: buttonBackgroundColor,
                        border: Border.all(color: buttonBorderColor),
                        borderRadius: buttonBorderRadius),
                  ),
                ),
              ),
              SizedBox(
                width: constraints.maxWidth   ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        _handleTap(0);
                      },
                      child: Container(
                          width: constraints.maxWidth / 2-50 ,
                          // padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            textAlign: TextAlign.center,
                            list[0],
                            style: TextStyle(
                              color: active == 0 ? selectedColor : unSelectedColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        _handleTap(1);
                      },
                      child: Container(
                          width: constraints.maxWidth / 2-50 ,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: Text(
                            textAlign: TextAlign.center,
                            list[1],
                            style: TextStyle(
                              color: active == 0 ? unSelectedColor : selectedColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                  ],
                ),
              )
            ],
          );
        }
    );
  }

  slidingButtonWebView() {
    return   LayoutBuilder(
        builder: (context,constraints) {
          return Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                width: constraints.maxWidth ,
                height: 48.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: Colors.white,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     blurRadius: 5.0,
                    //   ),
                    // ],
                    border: Border.all(color: KalakarColors.border)
                ),
                child: AnimatedAlign(
                  alignment:
                  active == 0 ? Alignment.centerLeft : Alignment.centerRight,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                    width: constraints.maxWidth / 2,
                    height: 40.h,
                    decoration: BoxDecoration(
                        color: buttonBackgroundColor,
                        border: Border.all(color: buttonBorderColor),
                        borderRadius: buttonBorderRadius),
                  ),
                ),
              ),
              SizedBox(
                width: constraints.maxWidth   ,
                height: 48.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _handleTap(0);
                      },
                      child: Center(
                        child: Text(
                            textAlign: TextAlign.center,
                            list[0],
                            style: TextStyle(
                              color: active == 0 ? selectedColor : unSelectedColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _handleTap(1);
                      },
                      child: Center(
                        child: Text(
                            textAlign: TextAlign.center,
                            list[1],
                            style: TextStyle(
                              color: active == 0 ? unSelectedColor : selectedColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }
    );

  }
}
