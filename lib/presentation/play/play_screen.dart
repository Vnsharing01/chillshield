import 'package:chillshield/presentation/play/play_controller.dart';
import 'package:chillshield/routes/route_name.dart';
import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:chillshield/shared/constants/app_image.dart';
import 'package:chillshield/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayScreen extends GetView<PlayController> {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: AppClolors.background,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'ChillShield',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppClolors.txtMainColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 81,
              backgroundColor: AppClolors.txtMainColor.withOpacity(0.2),
              child: Image.asset(
                AppImage.logo,
                fit: BoxFit.contain,
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(height: 54),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 54),
              child: AppButton(
                onPressed: () {
                  Get.offNamed(RouteName.home);
                },
                buttonTile: 'STOP',
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Material(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Thông tin',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Muỗi',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Muỗi',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Muỗi',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
