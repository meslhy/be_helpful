import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/data/model/home_responses/posts_response.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{

  Future<Either<Failuer,PostsResponse>> getAllPosts();
}