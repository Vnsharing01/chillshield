import 'package:chillshield/presentation/home/components/checkbox_widget.dart';
import 'package:chillshield/shared/constants/app_clolors.dart';
import 'package:chillshield/widgets/checkbox_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int frequencySelectedValue = 1; // Default selected value
  int insectSelectedValue = 1; // Default selected value
  int timeSelectedValue = 1; // Default selected value
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
              frequencyWidget(),
              const SizedBox(height: 16),
              typeOfInsectWidget(),
              const SizedBox(height: 16),
              timeWidget(),
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

  Widget timeWidget() {
    return CheckboxWidget(
      title: 'Thời gian',
      checkboxes: [
        BtnCheckbox(
          value: 1,
          selectedValue: timeSelectedValue,
          text: '15 phút',
          onTap: (value) {
            // Handle tap for 50Hz
            print('Selected: $value');
            timeSelectedValue = value; // Update selected value
            setState(() {}); // Refresh the UI
          },
        ),
        const SizedBox(width: 10),
        BtnCheckbox(
          value: 2,
          selectedValue: timeSelectedValue,
          text: '30 phút',
          onTap: (value) {
            // Handle tap for 60Hz
            print('Selected: $value');
            timeSelectedValue = value; // Update selected value
            setState(() {}); // Refresh the UI
          },
        ),
        const SizedBox(width: 10),
        BtnCheckbox(
          value: 3,
          selectedValue: timeSelectedValue,
          text: '1 giờ',
          onTap: (value) {
            // Handle tap for 120Hz
            print('Selected: $value');
            timeSelectedValue = value; // Update selected value
            setState(() {}); // Refresh the UI
          },
        ),
      ],
    );
  }

  Widget typeOfInsectWidget() {
    return CheckboxWidget(
      title: 'Loại côn trùng',
      checkboxes: [
        BtnCheckbox(
          value: 1,
          selectedValue: insectSelectedValue,
          text: 'Muỗi',
          onTap: (value) {
            // Handle tap for 50Hz
            print('Selected: $value');
            insectSelectedValue = value; // Update selected value
            setState(() {}); // Refresh the UI
          },
        ),
        const SizedBox(width: 10),
        BtnCheckbox(
          value: 2,
          selectedValue: insectSelectedValue,
          text: 'Gián',
          onTap: (value) {
            // Handle tap for 60Hz
            print('Selected: $value');
            insectSelectedValue = value; // Update selected value
            setState(() {}); // Refresh the UI
          },
        ),
        const SizedBox(width: 10),
        BtnCheckbox(
          value: 3,
          selectedValue: insectSelectedValue,
          text: 'Ruồi',
          onTap: (value) {
            // Handle tap for 120Hz
            print('Selected: $value');
            insectSelectedValue = value; // Update selected value
            setState(() {}); // Refresh the UI
          },
        ),
      ],
    );
  }

  Widget frequencyWidget() {
    return CheckboxWidget(
      title: 'Tần số',
      checkboxes: [
        BtnCheckbox(
          value: 1,
          selectedValue: frequencySelectedValue,
          text: '50 kHz',
          onTap: (value) {
            // Handle tap for 50Hz
            print('Selected: $value');
            frequencySelectedValue = value; // Update selected value
            setState(() {}); // Refresh the UI
          },
        ),
        const SizedBox(width: 10),
        BtnCheckbox(
          value: 2,
          selectedValue: frequencySelectedValue,
          text: '60 kHz',
          onTap: (value) {
            // Handle tap for 60Hz
            print('Selected: $value');
            frequencySelectedValue = value; // Update selected value
            setState(() {}); // Refresh the UI
          },
        ),
        const SizedBox(width: 10),
        BtnCheckbox(
          value: 3,
          selectedValue: frequencySelectedValue,
          text: '120 kHz',
          onTap: (value) {
            // Handle tap for 120Hz
            print('Selected: $value');
            frequencySelectedValue = value; // Update selected value
            setState(() {}); // Refresh the UI
          },
        ),
      ],
    );
  }
}
