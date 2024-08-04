import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/data/model/profile_response/profile_response.dart';
import 'package:be_helpful/domain/repos/profile_repo/profile_repo.dart';
import 'package:be_helpful/ui/utils/constants.dart';
import 'package:be_helpful/ui/utils/extensions.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repos/profile_repo/ds/profile_online_ds.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl extends ProfileRepo {

  Connectivity connectivity;
  ProfileOnlineDS profileOnlineDS;
  ProfileRepoImpl(this.connectivity,this.profileOnlineDS);
  @override
  Future<Either<Failuer, ProfileResponse>> getProfile() async{
    if(await connectivity.isInternetConnective){
      return profileOnlineDS.getProfile();
    }else{
      return left(Failuer(Constants.internetErrorMessage));
    }
  }

}