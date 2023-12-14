import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pincode_controller.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LockPinController controller = Get.put(LockPinController());
    return Scaffold(body: GetBuilder<LockPinController>(builder: (controller) {
      return SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  "Enter your Pin code",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    4,
                    (index) => Container(
                        margin: const EdgeInsets.all(6.0),
                        width: controller.isPinVisble ? 50 : 16,
                        height: controller.isPinVisble ? 50 : 16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: index < controller.enterdPin.length
                                ? controller.isPinVisble
                                    ? Colors.green
                                    : CupertinoColors.activeBlue
                                : CupertinoColors.activeBlue.withOpacity(0.1)),
                        child: controller.isPinVisble &&
                                index < controller.enterdPin.length
                            ? Center(
                                child: Text(
                                  controller.enterdPin[index],
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            : null))),
            IconButton(
                onPressed: () {
                  controller.changVisblity(controller.isPinVisble);
                },
                icon: Icon(controller.isPinVisble
                    ? Icons.visibility_off
                    : Icons.visibility)),
            SizedBox(
              height: controller.isPinVisble ? 50.0 : 8.0,
            ),
            for (var i = 0; i < 3; i++)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(3,
                            (index) => controller.numButton(1 + 3 * i + index))
                        .toList()),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () {}, child: const SizedBox()),
                  controller.numButton(0),
                  TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.backspace,
                        color: Colors.black,
                      ))
                ],
              ),
            )
          ],
        ),
      );
    }));
  }
}
