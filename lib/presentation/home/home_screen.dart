import 'package:chillshield/presentation/home/components/checkbox_widget.dart';
import 'package:chillshield/widgets/checkbox_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedValue = 1; // Default selected value
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Column(
            children: [
              Text(
                'Welcome to ChillShield',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              CheckboxWidget(
                title: 'Tần số',
                checkboxes: [
                  BtnCheckbox(
                    value: 1,
                    selectedValue: selectedValue,
                    text: '50 kHz',
                    onTap: (value) {
                      // Handle tap for 50Hz
                      print('Selected: $value');
                      selectedValue = value; // Update selected value
                      setState(() {}); // Refresh the UI
                    },
                  ),
                  const SizedBox(width: 10), 
                  BtnCheckbox(
                    value: 2,
                    selectedValue: selectedValue,
                    text: '60 kHz',
                    onTap: (value) {
                      // Handle tap for 60Hz
                      print('Selected: $value');
                      selectedValue = value; // Update selected value
                      setState(() {}); // Refresh the UI
                    },
                  ),
                  const SizedBox(width: 10), 
                  BtnCheckbox(
                    value: 3,
                    selectedValue: selectedValue,
                    text: '120 kHz',
                    onTap: (value) {
                      // Handle tap for 120Hz
                      print('Selected: $value');
                      selectedValue = value; // Update selected value
                      setState(() {}); // Refresh the UI
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CheckboxWidget(
                title: 'Loại côn trùng',
                checkboxes: [
                  BtnCheckbox(
                    value: 1,
                    selectedValue: selectedValue,
                    text: 'Muỗi',
                    onTap: (value) {
                      // Handle tap for 50Hz
                      print('Selected: $value');
                      selectedValue = value; // Update selected value
                      setState(() {}); // Refresh the UI
                    },
                  ),
                  const SizedBox(width: 10), 
                  BtnCheckbox(
                    value: 2,
                    selectedValue: selectedValue,
                    text: 'Gián',
                    onTap: (value) {
                      // Handle tap for 60Hz
                      print('Selected: $value');
                      selectedValue = value; // Update selected value
                      setState(() {}); // Refresh the UI
                    },
                  ),
                  const SizedBox(width: 10), 
                  BtnCheckbox(
                    value: 3,
                    selectedValue: selectedValue,
                    text: 'Ruồi',
                    onTap: (value) {
                      // Handle tap for 120Hz
                      print('Selected: $value');
                      selectedValue = value; // Update selected value
                      setState(() {}); // Refresh the UI
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CheckboxWidget(
                title: 'Thời gian',
                checkboxes: [
                  BtnCheckbox(
                    value: 1,
                    selectedValue: selectedValue,
                    text: '15 phút',
                    onTap: (value) {
                      // Handle tap for 50Hz
                      print('Selected: $value');
                      selectedValue = value; // Update selected value
                      setState(() {}); // Refresh the UI
                    },
                  ),
                  const SizedBox(width: 10), 
                  BtnCheckbox(
                    value: 2,
                    selectedValue: selectedValue,
                    text: '30 phút',
                    onTap: (value) {
                      // Handle tap for 60Hz
                      print('Selected: $value');
                      selectedValue = value; // Update selected value
                      setState(() {}); // Refresh the UI
                    },
                  ),
                  const SizedBox(width: 10), 
                  BtnCheckbox(
                    value: 3,
                    selectedValue: selectedValue,
                    text: '1 giờ',
                    onTap: (value) {
                      // Handle tap for 120Hz
                      print('Selected: $value');
                      selectedValue = value; // Update selected value
                      setState(() {}); // Refresh the UI
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
