import 'package:flutter/material.dart';

void customModalBottomSheet(context, Widget bottomSheetContent) {
  showModalBottomSheet(
      context: context,
      builder: (context) => bottomSheetContent,
      isScrollControlled: true,
      elevation: 15);
}
