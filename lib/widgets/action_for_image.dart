import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ActionForImage extends StatefulWidget {
  const ActionForImage({super.key});

  @override
  State<ActionForImage> createState() => _ActionForImageState();
}

class _ActionForImageState extends State<ActionForImage> {
  double verticalProgress = 0;
  double horizontalProgress = 0;
  bool isVerticalCompleted = false;
  bool isHorizontalCompleted = false;

  @override
  Widget build(BuildContext context) {
    double verticalContainerHeight = MediaQuery.of(context).size.height * 0.67;
    double verticalContainerWidth = MediaQuery.of(context).size.width * 0.08;
    double horizontalContainerWidth = MediaQuery.of(context).size.width * 0.2;
    double horizontalContainerHeight =
        MediaQuery.of(context).size.height * 0.12;

    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onHorizontalDragUpdate: (details) {
            if (isVerticalCompleted) {
              setState(() {
                if (!isHorizontalCompleted) {
                  horizontalProgress = (horizontalProgress +
                          details.delta.dx / horizontalContainerWidth)
                      .clamp(0.0, 1.0);
                  if (horizontalProgress >= 1.0) {
                    horizontalProgress = 1.0;
                    isHorizontalCompleted = true;
                    Fluttertoast.showToast(
                      msg: "Finished",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                }
              });
            }
          },
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                width: horizontalContainerWidth,
                height: horizontalContainerHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: isHorizontalCompleted
                      ? Colors.green
                      : const Color.fromARGB(255, 137, 179, 161),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    if (isVerticalCompleted) ...[
                      Image.asset("assets/images/two.png"),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      Image.asset("assets/images/lh.png",
                          width: MediaQuery.of(context).size.width * 0.15),
                    ],
                  ],
                ),
              ),
              Positioned(
                left: horizontalProgress * (horizontalContainerWidth - 24),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.035),
                  child: const CustomThumbIconForHorizontal(),
                ),
              ),
              Positioned(
                left: 0,
                child: Container(
                  width: horizontalContainerWidth * horizontalProgress,
                  height: horizontalContainerHeight,
                  decoration: BoxDecoration(
                    color: const Color(0xff58A285),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onVerticalDragUpdate: (details) {
            setState(() {
              double newProgress =
                  verticalProgress + details.delta.dy / verticalContainerHeight;
              if (!isVerticalCompleted) {
                verticalProgress = newProgress.clamp(0.0, 1.0);
                if (verticalProgress >= 1.0) {
                  isVerticalCompleted = true;
                }
              }
            });
          },
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: verticalContainerWidth,
                height: verticalContainerHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromARGB(255, 137, 179, 161),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    if (verticalProgress < 1.0) ...[
                      Image.asset("assets/images/one.png"),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Image.asset(
                        "assets/images/lv.png",
                        height: MediaQuery.of(context).size.height * 0.52,
                      ),
                      Image.asset("assets/images/a_down.png"),
                    ],
                  ],
                ),
              ),
              Positioned(
                top: verticalProgress * (verticalContainerHeight - 24),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.08),
                  child: const CustomThumbIcon(),
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  width: verticalContainerWidth,
                  height: verticalContainerHeight * verticalProgress,
                  decoration: BoxDecoration(
                    color: const Color(0xff58A285),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomThumbIcon extends StatelessWidget {
  const CustomThumbIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Center(
        child: Image.asset("assets/images/av.png"),
      ),
    );
  }
}

class CustomThumbIconForHorizontal extends StatelessWidget {
  const CustomThumbIconForHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Center(
        child: Image.asset("assets/images/a_right.png"),
      ),
    );
  }
}
