import 'package:chillshield/presentation/setting/setting_controller.dart';
import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:chillshield/shared/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppClolors.background,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Setting',
            style: AppTextStyle.title(fontSize: 24),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card.outlined(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 1,
                color: AppClolors.selected,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Dark Mode',
                        style: AppTextStyle.label(fontSize: 20),
                      ),
                      trailing: Obx(
                        () => CupertinoSwitch(
                          activeColor: AppClolors.txtMainColor,
                          value: controller.isDarkMode,
                          onChanged: (value) {
                            controller.toggleDarkMode(value);
                          },
                        ),
                      ),
                    ),
                    _buildDividerView(),
                    ListTile(
                      onTap: () {
                        // Navigate to About screen
                      },
                      title: Text(
                        'App info',
                        style: AppTextStyle.label(fontSize: 20),
                      ),
                      trailing: const Icon(
                        Icons.info,
                        color: AppClolors.txtMainColor,
                      ),
                    ),
                    _buildDividerView(),
                    ListTile(
                      onTap: () {
                        // Handle feedback action
                      },
                      title: Text(
                        'Share App',
                        style: AppTextStyle.label(fontSize: 20),
                      ),
                      trailing: const Icon(
                        Icons.share,
                        color: AppClolors.txtMainColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildDividerView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Divider(
        height: 1.5,
        color: AppClolors.label.withOpacity(0.2),
        thickness: 1,
      ),
    );
  }
}
