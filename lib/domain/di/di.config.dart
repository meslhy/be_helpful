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

import '../../data/repos/auth_repo/auth_repo_impl.dart' as _i10;
import '../../data/repos/home_repo/ds/home_online_ds.dart' as _i5;
import '../../data/repos/home_repo/home_repo.dart' as _i7;
import '../../data/utils/shared_utils.dart' as _i8;
import '../../ui/screens/auth/forget_pass/otp/otp_view_model.dart' as _i20;
import '../../ui/screens/auth/forget_pass/send_otp/send_otp_view_model.dart'
    as _i16;
import '../../ui/screens/auth/login/login_view_model.dart' as _i14;
import '../../ui/screens/auth/signup/signup_view_model.dart' as _i18;
import '../../ui/screens/home/home_view_model.dart' as _i12;
import '../repos/auth_repo/auth_repo.dart' as _i9;
import '../repos/home_repo/ds/home_online_ds.dart' as _i4;
import '../repos/home_repo/home_repo.dart' as _i6;
import '../use_cases/get_all_posts_use_case.dart' as _i11;
import '../use_cases/login_use_case.dart' as _i13;
import '../use_cases/send_otp_use_case.dart' as _i15;
import '../use_cases/sign_up_use_case.dart' as _i17;
import '../use_cases/verification_otp_use_case.dart' as _i19;
import 'app_module.dart' as _i21;

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
    gh.factory<_i8.SharedPrefsUtils>(() => _i8.SharedPrefsUtils());
    gh.factory<_i9.AuthRepo>(() => _i10.AuthRepoImpl(
          gh<_i3.Connectivity>(),
          gh<_i8.SharedPrefsUtils>(),
        ));
    gh.factory<_i11.GetAllPostsUseCase>(
        () => _i11.GetAllPostsUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i12.HomeViewModel>(() => _i12.HomeViewModel(
          gh<_i11.GetAllPostsUseCase>(),
          gh<_i8.SharedPrefsUtils>(),
        ));
    gh.factory<_i13.LoginUseCase>(() => _i13.LoginUseCase(gh<_i9.AuthRepo>()));
    gh.factory<_i14.LoginViewModel>(
        () => _i14.LoginViewModel(gh<_i13.LoginUseCase>()));
    gh.factory<_i15.SendOTPUseCase>(
        () => _i15.SendOTPUseCase(gh<_i9.AuthRepo>()));
    gh.factory<_i16.SendOTPViewModel>(
        () => _i16.SendOTPViewModel(gh<_i15.SendOTPUseCase>()));
    gh.factory<_i17.SignUpUseCase>(
        () => _i17.SignUpUseCase(gh<_i9.AuthRepo>()));
    gh.factory<_i18.SignUpViewModel>(
        () => _i18.SignUpViewModel(gh<_i17.SignUpUseCase>()));
    gh.factory<_i19.VerificationOTPUseCase>(
        () => _i19.VerificationOTPUseCase(gh<_i9.AuthRepo>()));
    gh.factory<_i20.VerificationOTPViewModel>(
        () => _i20.VerificationOTPViewModel(gh<_i19.VerificationOTPUseCase>()));
    return this;
  }
}

class _$AppModule extends _i21.AppModule {}
