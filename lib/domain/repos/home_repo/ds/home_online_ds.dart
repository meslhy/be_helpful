import 'dart:io';

import 'package:be_helpful/data/model/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:be_helpful/data/model/home_responses/posts_response.dart';
abstract class HomeOnlineDS{

  Future<Either<Failuer,PostsResponse>> getAllPosts();
  Future<Either<Failuer,bool>> createPost(String content , String location ,String category ,File image );
}