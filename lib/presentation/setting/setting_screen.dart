import 'package:chillshield/presentation/setting/components/item_info_widget.dart';
import 'package:chillshield/presentation/setting/components/radio_check_audio_widget.dart';
import 'package:chillshield/presentation/setting/setting_controller.dart';
import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:chillshield/shared/utils/text_style.dart';
import 'package:chillshield/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
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
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ItemInfoWidget(
                              controller: controller,
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return _buildAudioPopup();
                                    });
                              },
                              title: 'Âm thanh nền',
                              icon: Icons.chevron_right_rounded,
                            ),
                            _buildDividerView(),
                            ItemInfoWidget(
                              controller: controller,
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return _buildInfoPopup();
                                    });
                              },
                              title: 'App info',
                              icon: Icons.info,
                            ),
                            _buildDividerView(),
                            ItemInfoWidget(
                              controller: controller,
                              onTap: () => controller.shareApp(),
                              title: 'Share App',
                              icon: Icons.share,
                            ),
                            _buildDividerView(),
                          ],
                        ),
                      ),
                      Text(
                        'Version 1.0.0',
                        style: AppTextStyle.label(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoPopup() {
    return AlertDialog(
      title: Text(
        'App Info',
        textAlign: TextAlign.center,
        style: AppTextStyle.title(fontSize: 20),
      ),
      content: Text(
        '''ChillSheild sử dụng sóng âm tần số cao để hỗ trợ xua đuổi côn trùng như muỗi, gián, ruồi… giúp bạn tận hưởng không gian thoải mái hơn.\n
⚠ Lưu ý khoa học:\n Hiệu quả của phương pháp đuổi côn trùng bằng tần số âm thanh vẫn đang được nghiên cứu và có thể khác nhau tùy môi trường, loài côn trùng và thiết bị phát. Ứng dụng không thay thế các biện pháp phòng chống côn trùng truyền thống!''',
        style: AppTextStyle.body(fontSize: 16),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.symmetric(
        horizontal: 36,
        vertical: 20,
      ),
      actions: [
        AppButton(
          onPressed: () => Get.back(),
          buttonTile: 'Đóng',
        ),
      ],
    );
  }

  Widget _buildAudioPopup() {
    final controller = Get.find<SettingController>();
    return Obx(
      () => Dialog.fullscreen(
        backgroundColor: AppClolors.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Âm thanh nền',
                style: AppTextStyle.title(fontSize: 24),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildDividerView(),
                    RadioCheckAudioWidget(
                      text: 'Tiếng suối chảy',
                      value: 1,
                      selectedValue: controller.isAudioValue,
                      onTap: controller.toggleAudio,
                    ),
                    _buildDividerView(),
                    RadioCheckAudioWidget(
                      text: 'Tiếng mưa rơi',
                      value: 2,
                      selectedValue: controller.isAudioValue,
                      onTap: controller.toggleAudio,
                    ),
                    _buildDividerView(),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomCenter,
                child: AppButton(
                  onPressed: () => Get.back(),
                  buttonTile: 'Chọn',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDividerView() {
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
