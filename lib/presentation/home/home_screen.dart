import 'package:chillshield/data/models/ultrasonic_model.dart';
import 'package:chillshield/presentation/home/components/checkbox_widget.dart';
import 'package:chillshield/presentation/home/home_controller.dart';
import 'package:chillshield/routes/route_name.dart';
import 'package:chillshield/shared/constants/app_image.dart';
import 'package:chillshield/shared/constants/get_it.dart';
import 'package:chillshield/shared/constants/key_string.dart';
import 'package:chillshield/shared/enums/background_sound_enum.dart';
import 'package:chillshield/shared/enums/duration_enum.dart';
import 'package:chillshield/shared/enums/frequency_enum.dart';
import 'package:chillshield/shared/enums/insect_enum.dart';
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
                  if (controller.frequencySelectedValue ==
                      FrequencyEnum.none.key) {
                    Get.snackbar(
                      'Bạn chưa chọn tần số',
                      'Vui lòng chọn tần số',
                      snackPosition: SnackPosition.TOP,
                    );
                  } else if (controller.insectSelectedValue ==
                      InsectEnum.none.key) {
                    Get.snackbar(
                      'Bạn chưa chọn loại côn trùng',
                      'Vui lòng chọn loại côn trùng',
                      snackPosition: SnackPosition.TOP,
                    );
                  } else {
                    Get.offNamed(
                      RouteName.play,
                      arguments: UltrasonicModel(
                        backgroundSound: BackgroundSoundEnumExtension.fromName(
                          preferences.getString(KeyString.backgroundSound) ??
                              BackgroundSoundEnum.stream.name,
                        ),
                        insect: InsectExtension.fromKey(
                          controller.insectSelectedValue,
                        ),
                        time: DurationEnumExtension.fromKey(
                          controller.timeSelectedValue,
                        ),
                        frequency: FrequencyEnumExtension.fromKey(
                          controller.frequencySelectedValue,
                        ),
                      ),
                    );
                  }
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
            value: FrequencyEnum.frequency20kHz.key,
            selectedValue: controller.frequencySelectedValue,
            text: FrequencyEnum.frequency20kHz.name,
            onTap: controller.setFrequencySelectedValue,
            isEnabled: controller.insectSelectedValue != 2,
          ),
          const SizedBox(width: 10),
          BtnCheckbox(
            value: FrequencyEnum.frequency30kHz.key,
            selectedValue: controller.frequencySelectedValue,
            text: FrequencyEnum.frequency30kHz.name,
            onTap: controller.setFrequencySelectedValue,
          ),
          const SizedBox(width: 10),
          BtnCheckbox(
            value: FrequencyEnum.frequency42kHz.key,
            selectedValue: controller.frequencySelectedValue,
            text: FrequencyEnum.frequency42kHz.name,
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
            value: InsectEnum.mosquito.key,
            selectedValue: controller.insectSelectedValue,
            text: InsectEnum.mosquito.name,
            onTap: controller.setInsectSelectedValue,
          ),
          const SizedBox(width: 10),
          BtnCheckbox(
            value: InsectEnum.cockroach.key,
            selectedValue: controller.insectSelectedValue,
            text: InsectEnum.cockroach.name,
            onTap: controller.setInsectSelectedValue,
          ),
          const SizedBox(width: 10),
          BtnCheckbox(
            value: InsectEnum.orther.key,
            selectedValue: controller.insectSelectedValue,
            text: InsectEnum.orther.name,
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
            value: DurationEnum.fifteenMinute.key,
            selectedValue: controller.timeSelectedValue,
            text: DurationEnum.fifteenMinute.name,
            onTap: controller.setTimeSelectedValue,
          ),
          const SizedBox(width: 10),
          BtnCheckbox(
            value: DurationEnum.thirtyMinute.key,
            selectedValue: controller.timeSelectedValue,
            text: DurationEnum.thirtyMinute.name,
            onTap: controller.setTimeSelectedValue,
          ),
          const SizedBox(width: 10),
          BtnCheckbox(
            value: DurationEnum.oneHour.key,
            selectedValue: controller.timeSelectedValue,
            text: DurationEnum.oneHour.name,
            onTap: controller.setTimeSelectedValue,
          ),
        ],
      ),
    );
  }
}
