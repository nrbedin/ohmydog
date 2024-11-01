import 'package:flutter/material.dart';
import 'package:ohmydog/app/core/ui/extensions/size_screen_extension.dart';

class RoundedButtonWithIcons extends StatelessWidget {
  final GestureTapCallback onTap;
  final double width;
  final Color color;
  final IconData icon;
  final String label;
  const RoundedButtonWithIcons({
   super.key,
   required this.onTap, 
   required this.width, 
   required this.color, 
   required this.icon,
   required this.label,
    });

   @override
   Widget build(BuildContext context) {
       return InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 2),
              child: Icon(
                icon ,
                color: Colors.white,
                size: 20.w,
              ),
            ),
            const Padding(
              padding:  EdgeInsets.symmetric(vertical: 8.0),
              child: VerticalDivider(
                color: Colors.white,
                thickness: 2,
              ),
              
            ),
            Padding(
              padding:  EdgeInsets.zero,
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
            
                ),
              ),
            )
          ],
        ),
        ),
       );
  }
}