import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../domain/profile/entities/referral_program.dart';
import '../../domain/profile/i_profile_data_source.dart';
import '../../domain/profile/i_profile_facade.dart';

@Injectable(as: IProfileFacade)
class ProfileFacadeImpl implements IProfileFacade {
  ProfileFacadeImpl(this._dataSource);

  final IProfileDataSource _dataSource;

  final FormGroup _formGroup = FormGroup({
    'name': FormControl(
      value: '',
      validators: [
        Validators.required,
        Validators.maxLength(15),
      ],
    ),
  });

  @override
  FormGroup get formGroup => _formGroup;

  @override
  String get name => _formGroup.control('name').value as String;

  @override
  Future<String> updateName(String name) => _dataSource.updateName(
        name.toLowerCase(),
      );

  @override
  Future<List<ReferralProgram>> getUserReferralProgram() async {
    try {
      final response = await _dataSource.getUserReferralProgram();
      return response.referrals;
    } catch (e) {
      return [];
    }
  }
}
