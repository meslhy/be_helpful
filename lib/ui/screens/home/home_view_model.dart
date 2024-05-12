import 'package:be_helpful/data/model/auth_response/auth_response.dart';
import 'package:be_helpful/data/utils/shared_utils.dart';
import 'package:be_helpful/domain/use_cases/get_all_posts_use_case.dart';
import 'package:be_helpful/ui/utils/base_request_states.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/model/home_responses/posts_response.dart';

@injectable
class HomeViewModel extends Cubit{

  GetAllPostsUseCase getAllPostsUseCase;
  AuthResponse? currentUser ;
  SharedPrefsUtils sharedPrefsUtils;

  HomeViewModel(this.getAllPostsUseCase,this.sharedPrefsUtils):super(BaseRequestInitialState());


  getAllPosts(){
    return getAllPostsUseCase.execute();
  }

  getCurrentUser()async{

    currentUser = (await sharedPrefsUtils.getUser())!;
  }

}