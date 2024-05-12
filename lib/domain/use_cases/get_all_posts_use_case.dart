import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/data/model/home_responses/posts_response.dart';
import 'package:be_helpful/domain/repos/home_repo/home_repo.dart';
import 'package:be_helpful/ui/utils/base_request_states.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


@injectable
class GetAllPostsUseCase extends Cubit{

  HomeRepo repo;

  GetAllPostsUseCase(this.repo):super(BaseRequestInitialState());

  execute()async{
    Either<Failuer,PostsResponse> either = await repo.getAllPosts();

    either.fold(
            (error) => emit(BaseRequestErrorState(error.errorMessage)),
            (data) => emit(BaseRequestSuccessState<PostsResponse>(data: data))
    );

  }

}