import 'package:reactive_forms/reactive_forms.dart';
const bottomAppBarHeight = 80.0;
const borderRadius = 15.0;
const longButtonWidth = 135.0;
const shortButtonWidth = 65.0;
const inputFieldHeight = 60.0;
const inputFieldHeightStaticBox = 90.0;
const buttonHeight = 50.0;
const padding = 8.0;
const columnPadding = 15.0;
const progressBarHeight = 30.0;
const elevation = 15.0;
const animationButtonDuration = Duration(milliseconds: 100);
// Card Size:
const waitingRoomCardHeight = 100.0;
const waitingRoomCardWidth = 350.0;
const columnWithMax = 85.0;
const columnWithMin = 70.0;
const waitingRoomLabelCardHeight = 65.0;
const waitingRoomLabelCardWidth = 100.0;
// Font Size:
const h1 = 20.0;

const h2 = 15.0;
const body = 10.0;
const bodySmall = 8.0;
const diceNumberFontSize = 30.0;

Map<String, String Function(dynamic error)> validationMessages = {
  ValidationMessage.required: (error) => 'Field must not be empty',
  ValidationMessage.email: (error) => 'Must enter a valid email',
  ValidationMessage.minLength: (error) => 'The min length is 8',
  ValidationMessage.maxLength: (error) {
    final requiredLength = error['requiredLength'] as int;
    final actualLength = error['actualLength'] as int;
    return 'The min length is $requiredLength. You have: $actualLength';
  },
  ValidationMessage.mustMatch: (error) => 'Password not match',
};
