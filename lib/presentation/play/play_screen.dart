import 'package:chillshield/presentation/play/play_controller.dart';
import 'package:chillshield/routes/route_name.dart';
import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:chillshield/shared/utils/text_style.dart';
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
            style: AppTextStyle.title(fontSize: 36),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 81,
              backgroundColor: AppClolors.txtMainColor,
              child: Icon(
                Icons.volume_up_rounded,
                size: 120,
                color: AppClolors.white,
              ),
            ),
            const SizedBox(height: 32),
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
                      buildInfoView(title: 'Côn trùng', info: 'mosquito'),
                      buildInfoView(title: 'Tần số', info: '120kHz'),
                      buildInfoView(title: 'Thời gian', info: '1 giờ'),
                    ],
                  ),
                ),
              ),
            )
          ],
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
}
