import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../core/theme/const_values.dart';

class OnBoardingInfoImg extends StatelessWidget {
  const OnBoardingInfoImg({
    required this.images,
  });

  final AssetGenImage images;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Card(
      elevation: elevation,
      margin: const EdgeInsets.all(15),
      child: images.image(
        width: width,
      ),
    );
  }
}
