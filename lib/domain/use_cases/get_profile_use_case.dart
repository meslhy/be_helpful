import 'package:be_helpful/data/model/profile_response/profile_response.dart';
import 'package:be_helpful/ui/utils/base_request_states.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../repos/profile_repo/profile_repo.dart';

@injectable
class GetProfileUseCase extends Cubit{
  ProfileRepo profileRepo;

  GetProfileUseCase(this.profileRepo):super(BaseRequestInitialState());

  execute ()async{

    Either either = await profileRepo.getProfile();

    either.fold(
    (failure) =>emit(BaseRequestErrorState(failure.errorMessage)) ,
      (data) => emit(BaseRequestSuccessState<ProfileResponse>(data: data)),
    );
  }

}