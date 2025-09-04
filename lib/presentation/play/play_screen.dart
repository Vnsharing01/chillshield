import 'package:chillshield/presentation/play/components/duration_widget.dart';
import 'package:chillshield/presentation/play/play_controller.dart';
import 'package:chillshield/routes/route_name.dart';
import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:chillshield/shared/constants/app_image.dart';
import 'package:chillshield/shared/constants/key_string.dart';
import 'package:chillshield/shared/enums/background_sound_enum.dart';
import 'package:chillshield/shared/utils/text_style.dart';
import 'package:chillshield/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class PlayScreen extends GetView<PlayController> {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'ChillShield',
              style: AppTextStyle.title(fontSize: 36),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 81,
                backgroundColor: AppClolors.txtMainColor,
                child: DurationWidget(
                  key: KeyString.durationKey,
                  duration:
                      Duration(minutes: controller.model.time?.value ?? 0),
                  isPlaying: controller.isPlaying,
                  stopMusic: (isPlaying) {
                    if (isPlaying) {
                      controller.stop();
                      Future.delayed(const Duration(milliseconds: 300), () {
                        if (Get.context!.mounted) {
                          showDialog(
                            context: context,
                            builder: (context) => buildDialogfinish(),
                          );
                        }
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 54),
                child: AppButton(
                  onPressed: () {
                    if (controller.isPlaying) {
                      controller.pause();
                      KeyString.durationKey.currentState?.pause();
                    } else {
                      controller.play();
                      KeyString.durationKey.currentState?.resume();
                    }
                  },
                  buttonTile: controller.isPlaying ? 'Pause' : 'Start',
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
                  color: AppClolors.selected,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Thông tin',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.label(
                              fontSize: 20,
                              color: AppClolors.label,
                            ),
                          ),
                        ),
                        buildInfoView(
                          title: 'Côn trùng',
                          info: '${controller.model.insect?.name}',
                        ),
                        buildInfoView(
                          title: 'Tần số',
                          info: '${controller.model.frequency?.title}',
                        ),
                        buildInfoView(
                          title: 'Thời gian',
                          info: '${controller.model.time?.title}',
                        ),
                        buildInfoView(
                          title: 'Nhạc nền',
                          info:
                              '${controller.model.backgroundSound?.displayName}',
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoView({
    required String title,
    required String info,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            '$title: ',
            textAlign: TextAlign.end,
            style: AppTextStyle.body(fontSize: 16),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 8,
          child: Text(
            info,
            style: AppTextStyle.label(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget buildDialogfinish() {
    return Dialog.fullscreen(
      backgroundColor: AppClolors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            margin: const EdgeInsets.all(24),
            color: AppClolors.selected,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImage.logo,
                    fit: BoxFit.contain,
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Bạn có muốn tiếp tục?',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.title(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  AppButton(
                    onPressed: () {
                      Get.back();
                      Future.delayed(
                        const Duration(milliseconds: 300),
                        () {
                          controller.play();
                          KeyString.durationKey.currentState?.startDuration();
                        },
                      );
                    },
                    buttonTile: 'Tiếp tục',
                  ),
                  const SizedBox(height: 8),
                  AppButton(
                    onPressed: () {
                      Get.back();
                      Get.offAllNamed(
                        RouteName.home,
                      );
                    },
                    buttonTile: 'Trang chủ',
                    backgroundColor: AppClolors.btnSecondary,
                    textColor: AppClolors.txtOranage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
