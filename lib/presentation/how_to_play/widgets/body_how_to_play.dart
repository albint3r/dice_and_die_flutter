import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import '../../../gen/assets.gen.dart';
import 'text_bottom.dart';

class BodyHowToPlay extends StatelessWidget {
  const BodyHowToPlay({super.key});

  @override
  Widget build(BuildContext context) {
    final imageHowToPlay = Assets.images.howToPlay;
    final width = MediaQuery.of(context).size.width;
    return OnBoardingSlider(
      finishButtonText: 'Back to Lobby',
      totalPage: 5,
      headerBackgroundColor: Colors.yellow,
      speed: 1,
      background: [
        imageHowToPlay.howToPlay1.image(width: width),
        imageHowToPlay.howToPlay2.image(width: width),
        imageHowToPlay.howToPlay3.image(width: width),
        imageHowToPlay.howToPlay4.image(width: width),
        imageHowToPlay.howToPlay5.image(width: width),
      ],
      pageBodies: const [
        TextBottom(
          text:
              'The is played by two player. The purple board is yours and the red one is from your opponent.',
        ),
        TextBottom(
          text:
              'The board consist in 3 columns each one have there own score counter. On the bottom is the dice and the chat button.',
        ),
        TextBottom(
          text:
              'Roll the dice and select one of the three columns to put the result.',
        ),
        TextBottom(
          text: 'You score even more points when stacking the same dice in a column.',
        ),
        TextBottom(
          text: 'You remove all opponents dice with the same value when placing a dice in the matching column.',
        ),
      ],
    );
  }
}
