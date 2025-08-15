import 'package:chillshield/presentation/setting/setting_controller.dart';
import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:chillshield/shared/utils/text_style.dart';
import 'package:chillshield/widgets/app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

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
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
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
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: Text(
                                          'App Info',
                                          textAlign: TextAlign.center,
                                          style:
                                              AppTextStyle.title(fontSize: 20),
                                        ),
                                        content: Text(
                                          '''ChillSheild sử dụng sóng âm tần số cao để hỗ trợ xua đuổi côn trùng như muỗi, gián, ruồi… giúp bạn tận hưởng không gian thoải mái hơn.\n
⚠ Lưu ý khoa học:\n Hiệu quả của phương pháp đuổi côn trùng bằng tần số âm thanh vẫn đang được nghiên cứu và có thể khác nhau tùy môi trường, loài côn trùng và thiết bị phát. Ứng dụng không thay thế các biện pháp phòng chống côn trùng truyền thống!''',
                                          style:
                                              AppTextStyle.body(fontSize: 16),
                                        ),
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        actionsPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 36,
                                          vertical: 20,
                                        ),
                                        actions: [
                                          AppButton(
                                            onPressed: () => Get.back(),
                                            buttonTile: 'Close',
                                          ),
                                        ],
                                      );
                                    });
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
                              onTap: () async {
                                // Handle feedback action
                                SharePlus.instance.share(
                                  ShareParams(
                                    text:
                                        "Muỗi? Gián? Côn trùng? Không còn là vấn đề. \nĐêm nay ngủ ngon, không còn tiếng vo ve 🛡️ \nDùng thử ngay: https://www.youtube.com/watch?v=ebYDOadpPcI",
                                    // rest of params
                                    excludedCupertinoActivities: [
                                      CupertinoActivityType.postToFacebook,
                                      CupertinoActivityType.postToTwitter,
                                      CupertinoActivityType.message,
                                    ],
                                  ),
                                );
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
