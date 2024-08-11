import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onTap,required this.color, this.colorIcon, this.circular = 0.0});
  final IconData icon;
  final void Function()? onTap;
  final Color? color;
  final Color? colorIcon;
  final double? circular;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          
          height: 45,
          width: 45,
          decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(circular!),
        ),
          child: Icon(
            icon,
            size: 28,
            color: colorIcon,
          ),
        ),
      ),
    );
  }
}
