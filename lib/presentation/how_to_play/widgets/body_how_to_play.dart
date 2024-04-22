import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import '../../../gen/assets.gen.dart';
import 'onboarding_info_img.dart';
import 'text_bottom.dart';

class BodyHowToPlay extends StatelessWidget {
  const BodyHowToPlay({super.key});

  @override
  Widget build(BuildContext context) {
    final imageHowToPlay = Assets.images.howToPlay;
    final x = imageHowToPlay.howToPlay1;
    final width = MediaQuery.of(context).size.width;
    return OnBoardingSlider(
      finishButtonText: 'Back to Lobby',
      totalPage: 5,
      headerBackgroundColor: Colors.red,
      controllerColor: Colors.black,
      speed: 1,
      centerBackground: true,
      addButton: false,
      background: [
        OnBoardingInfoImg(
          images: imageHowToPlay.howToPlay1,
        ),
        OnBoardingInfoImg(
          images: imageHowToPlay.howToPlay2,
        ),
        OnBoardingInfoImg(
          images: imageHowToPlay.howToPlay3,
        ),
        OnBoardingInfoImg(
          images: imageHowToPlay.howToPlay4,
        ),
        OnBoardingInfoImg(
          images: imageHowToPlay.howToPlay5,
        ),
      ],
      pageBodies: const [
        TextBottom(
          text:
              'The game is played by two players. The purple board is yours, and the red one belongs to your opponent.',
        ),
        TextBottom(
          text:
              'The board consists of 3 columns, each with its own score counter. At the bottom are the dice and the chat button.',
        ),
        TextBottom(
          text:
              'Roll the dice and select one of the three columns to place the result.',
        ),
        TextBottom(
          text:
              'You score even more points when stacking the same dice in a column.',
        ),
        TextBottom(
          text:
              "You remove all opponent's dice with the same value when placing a die in the matching column.",
        ),
      ],
    );
  }
}
