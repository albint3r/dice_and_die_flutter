/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background_lose.png
  AssetGenImage get backgroundLose =>
      const AssetGenImage('assets/images/background_lose.png');

  /// File path: assets/images/background_win.png
  AssetGenImage get backgroundWin =>
      const AssetGenImage('assets/images/background_win.png');

  /// File path: assets/images/monetface.png
  AssetGenImage get monetface =>
      const AssetGenImage('assets/images/monetface.png');

  /// File path: assets/images/you_lose.png
  AssetGenImage get youLose =>
      const AssetGenImage('assets/images/you_lose.png');

  /// File path: assets/images/you_win.png
  AssetGenImage get youWin => const AssetGenImage('assets/images/you_win.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [backgroundLose, backgroundWin, monetface, youLose, youWin];
}

class $AssetsSoundsGen {
  const $AssetsSoundsGen();

  /// File path: assets/sounds/dice_random_rolling_effect.mp3
  String get diceRandomRollingEffect =>
      'assets/sounds/dice_random_rolling_effect.mp3';

  /// File path: assets/sounds/dice_roll.mp3
  String get diceRoll => 'assets/sounds/dice_roll.mp3';

  /// File path: assets/sounds/piano_key.WAV
  String get pianoKey => 'assets/sounds/piano_key.WAV';

  /// File path: assets/sounds/slash1_sound.mp3
  String get slash1Sound => 'assets/sounds/slash1_sound.mp3';

  /// List of all assets
  List<String> get values =>
      [diceRandomRollingEffect, diceRoll, pianoKey, slash1Sound];
}

class Assets {
  Assets._();

  static const AssetGenImage appLogo = AssetGenImage('assets/app_logo.png');
  static const AssetGenImage defaultAvatar =
      AssetGenImage('assets/default_avatar.png');
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSoundsGen sounds = $AssetsSoundsGen();

  /// List of all assets
  List<AssetGenImage> get values => [appLogo, defaultAvatar];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
