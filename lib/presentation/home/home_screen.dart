import 'package:chillshield/presentation/home/components/checkbox_widget.dart';
import 'package:chillshield/presentation/home/home_controller.dart';
import 'package:chillshield/shared/constants/app_clolors.dart';
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
          extendBodyBehindAppBar: true,
          backgroundColor: AppClolors.background,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            child: Column(
              children: [
                Text(
                  'Welcome to ChillShield',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                const CircleAvatar(
                  radius: 64,
                  backgroundColor: AppClolors.primary,
                  child: Icon(
                    Icons.policy,
                    size: 36,
                  ),
                ),
                const SizedBox(height: 16),
                frequencyWidget(controller),
                const SizedBox(height: 16),
                typeOfInsectWidget(controller),
                const SizedBox(height: 16),
                timeWidget(controller),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: AppClolors.btnBackground,
                  ),
                  child: const Text(
                    'START',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppClolors.white,
                    ),
                  ),
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
