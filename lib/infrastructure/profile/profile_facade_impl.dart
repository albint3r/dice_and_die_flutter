import 'package:injectable/injectable.dart';
import 'package:reactive_forms/src/models/models.dart';

import '../../domain/profile/i_profile_data_source.dart';
import '../../domain/profile/i_profile_facade.dart';

@Injectable(as: IProfileFacade)
class ProfileFacadeImpl implements IProfileFacade {
  ProfileFacadeImpl(this._dataSource);

  final IProfileDataSource _dataSource;

  final FormGroup _formGroup = FormGroup({
    'name': FormControl(value: ''),
    'lastName': FormControl(value: ''),
  });

  @override
  FormGroup get formGroup => _formGroup;

  @override
  String get name => _formGroup.control('name').value as String;

  @override
  Future<String> updateName(String name) => _dataSource.updateName(name);
}
