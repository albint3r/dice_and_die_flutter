import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/app_user.dart';
import '../../core/types.dart';

part 'viewer.freezed.dart';

part 'viewer.g.dart';

@freezed
class Viewer with _$Viewer {
  const factory Viewer({
    required String id,
    required AppUser appUser,
  }) = _Viewer;

  const Viewer._();

  factory Viewer.fromJson(Json json) => _$ViewerFromJson(json);
}
