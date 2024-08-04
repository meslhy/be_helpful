// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repos/auth_repo/auth_repo_impl.dart' as _i14;
import '../../data/repos/home_repo/ds/home_online_ds.dart' as _i5;
import '../../data/repos/home_repo/home_repo.dart' as _i7;
import '../../data/repos/profile_repo/ds/profile_online_ds.dart' as _i9;
import '../../data/repos/profile_repo/profile_repo.dart' as _i11;
import '../../data/utils/shared_utils.dart' as _i12;
import '../../ui/screens/auth/forget_pass/otp/otp_view_model.dart' as _i28;
import '../../ui/screens/auth/forget_pass/reset_pass/reset_pass_view_model.dart'
    as _i22;
import '../../ui/screens/auth/forget_pass/send_otp/send_otp_view_model.dart'
    as _i24;
import '../../ui/screens/auth/login/login_view_model.dart' as _i19;
import '../../ui/screens/auth/signup/signup_view_model.dart' as _i26;
import '../../ui/screens/home/home_view_model.dart' as _i17;
import '../../ui/screens/profile/profile_view_model.dart' as _i20;
import '../repos/auth_repo/auth_repo.dart' as _i13;
import '../repos/home_repo/ds/home_online_ds.dart' as _i4;
import '../repos/home_repo/home_repo.dart' as _i6;
import '../repos/profile_repo/ds/profile_online_ds.dart' as _i8;
import '../repos/profile_repo/profile_repo.dart' as _i10;
import '../use_cases/get_all_posts_use_case.dart' as _i15;
import '../use_cases/get_profile_use_case.dart' as _i16;
import '../use_cases/login_use_case.dart' as _i18;
import '../use_cases/reset_pass_use_case.dart' as _i21;
import '../use_cases/send_otp_use_case.dart' as _i23;
import '../use_cases/sign_up_use_case.dart' as _i25;
import '../use_cases/verification_otp_use_case.dart' as _i27;
import 'app_module.dart' as _i29;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.Connectivity>(() => appModule.getConnectivity());
    gh.factory<_i4.HomeOnlineDS>(() => _i5.HomeOnlineDSImpl());
    gh.factory<_i6.HomeRepo>(() => _i7.HomeRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i4.HomeOnlineDS>(),
        ));
    gh.factory<_i8.ProfileOnlineDS>(() => _i9.ProfileOnlineDsImpl());
    gh.factory<_i10.ProfileRepo>(() => _i11.ProfileRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i8.ProfileOnlineDS>(),
        ));
    gh.factory<_i12.SharedPrefsUtils>(() => _i12.SharedPrefsUtils());
    gh.factory<_i13.AuthRepo>(() => _i14.AuthRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i12.SharedPrefsUtils>(),
        ));
    gh.factory<_i15.GetAllPostsUseCase>(
        () => _i15.GetAllPostsUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i16.GetProfileUseCase>(
        () => _i16.GetProfileUseCase(gh<_i10.ProfileRepo>()));
    gh.factory<_i17.HomeViewModel>(() => _i17.HomeViewModel(
          gh<_i15.GetAllPostsUseCase>(),
          gh<_i12.SharedPrefsUtils>(),
        ));
    gh.factory<_i18.LoginUseCase>(() => _i18.LoginUseCase(gh<_i13.AuthRepo>()));
    gh.factory<_i19.LoginViewModel>(
        () => _i19.LoginViewModel(gh<_i18.LoginUseCase>()));
    gh.factory<_i20.ProfileViewModel>(
        () => _i20.ProfileViewModel(gh<_i16.GetProfileUseCase>()));
    gh.factory<_i21.ResetPassUseCase>(
        () => _i21.ResetPassUseCase(gh<_i13.AuthRepo>()));
    gh.factory<_i22.ResetPassViewModel>(
        () => _i22.ResetPassViewModel(gh<_i21.ResetPassUseCase>()));
    gh.factory<_i23.SendOTPUseCase>(
        () => _i23.SendOTPUseCase(gh<_i13.AuthRepo>()));
    gh.factory<_i24.SendOTPViewModel>(
        () => _i24.SendOTPViewModel(gh<_i23.SendOTPUseCase>()));
    gh.factory<_i25.SignUpUseCase>(
        () => _i25.SignUpUseCase(gh<_i13.AuthRepo>()));
    gh.factory<_i26.SignUpViewModel>(
        () => _i26.SignUpViewModel(gh<_i25.SignUpUseCase>()));
    gh.factory<_i27.VerificationOTPUseCase>(
        () => _i27.VerificationOTPUseCase(gh<_i13.AuthRepo>()));
    gh.factory<_i28.VerificationOTPViewModel>(
        () => _i28.VerificationOTPViewModel(gh<_i27.VerificationOTPUseCase>()));
    return this;
  }
}

class _$AppModule extends _i29.AppModule {}
