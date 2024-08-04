import 'package:be_helpful/ui/utils/base_request_states.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/get_profile_use_case.dart';

@injectable
class ProfileViewModel extends Cubit{

  GetProfileUseCase getProfileUseCase;

  ProfileViewModel(this.getProfileUseCase):super(BaseRequestInitialState());

  getProfile(){
    return getProfileUseCase.execute();
  }

}