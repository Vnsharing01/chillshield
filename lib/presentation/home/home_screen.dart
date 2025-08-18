import 'package:chillshield/presentation/home/components/checkbox_widget.dart';
import 'package:chillshield/presentation/home/home_controller.dart';
import 'package:chillshield/routes/route_name.dart';
import 'package:chillshield/shared/constants/app_image.dart';
import 'package:chillshield/shared/utils/text_style.dart';
import 'package:chillshield/widgets/app_button.dart';
import 'package:chillshield/widgets/app_icon_button.dart';
import 'package:chillshield/widgets/checkbox_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'ChillShield',
            style: AppTextStyle.title(fontSize: 36),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            AppIconButton(
              onPressed: () => Get.toNamed(RouteName.settings),
              icon: Icons.settings_rounded,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Column(
            children: [
              Image.asset(
                AppImage.logo,
                fit: BoxFit.contain,
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 16),
              frequencyWidget(controller),
              const SizedBox(height: 16),
              typeOfInsectWidget(controller),
              const SizedBox(height: 16),
              timeWidget(controller),
              const SizedBox(height: 32),
              AppButton(
                onPressed: () {
                  Get.offNamed(RouteName.play);
                },
                buttonTile: 'START',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget frequencyWidget(HomeController controller) {
    return Obx(
      () => CheckboxWidget(
        title: 'Tần số',
        checkboxes: [
          BtnCheckbox(
            value: 1,
            selectedValue: controller.frequencySelectedValue,
            text: '50 kHz',
            onTap: controller.setFrequencySelectedValue,
          ),
          const SizedBox(width: 10),
          BtnCheckbox(
            value: 2,
            selectedValue: controller.frequencySelectedValue,
            text: '60 kHz',
            onTap: controller.setFrequencySelectedValue,
          ),
          const SizedBox(width: 10),
          BtnCheckbox(
            value: 3,
            selectedValue: controller.frequencySelectedValue,
            text: '120 kHz',
            onTap: controller.setFrequencySelectedValue,
          ),
        ],
      ),
    );
  }

  Widget typeOfInsectWidget(HomeController controller) {
    return Obx(
      () => CheckboxWidget(
        title: 'Loại côn trùng',
        checkboxes: [
          BtnCheckbox(
            value: 1,
            selectedValue: controller.insectSelectedValue,
            text: 'Muỗi',
            onTap: controller.setInsectSelectedValue,
          ),
          const SizedBox(width: 10),
          BtnCheckbox(
            value: 2,
            selectedValue: controller.insectSelectedValue,
            text: 'Gián',
            onTap: controller.setInsectSelectedValue,
          ),
          const SizedBox(width: 10),
          BtnCheckbox(
            value: 3,
            selectedValue: controller.insectSelectedValue,
            text: 'Ruồi',
            onTap: controller.setInsectSelectedValue,
          ),
        ],
      ),
    );
  }

  Widget timeWidget(HomeController controller) {
    return Obx(
      () => CheckboxWidget(
        title: 'Thời gian',
        checkboxes: [
          BtnCheckbox(
            value: 1,
            selectedValue: controller.timeSelectedValue,
            text: '15 phút',
            onTap: controller.setTimeSelectedValue,
          ),
          const SizedBox(width: 10),
          BtnCheckbox(
            value: 2,
            selectedValue: controller.timeSelectedValue,
            text: '30 phút',
            onTap: controller.setTimeSelectedValue,
          ),
          const SizedBox(width: 10),
          BtnCheckbox(
            value: 3,
            selectedValue: controller.timeSelectedValue,
            text: '1 giờ',
            onTap: controller.setTimeSelectedValue,
          ),
        ],
      ),
    );
  }
}
