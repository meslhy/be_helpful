import 'dart:io';

import 'package:be_helpful/data/model/failures.dart';
import 'package:be_helpful/data/model/home_responses/posts_response.dart';
import 'package:be_helpful/domain/repos/home_repo/ds/home_online_ds.dart';
import 'package:be_helpful/domain/repos/home_repo/home_repo.dart';
import 'package:be_helpful/ui/utils/constants.dart';
import 'package:be_helpful/ui/utils/extensions.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo {
  Connectivity connectivity;
  HomeOnlineDS ds;

 HomeRepoImpl(this.connectivity,this.ds);

  @override
  Future<Either<Failuer, PostsResponse>> getAllPosts() async{
    if(await connectivity.isInternetConnective){
      return ds.getAllPosts();
    }else{
      return left(Failuer(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<Failuer, bool>> createPost(String content, String location, String category, File image)async {
    if(await connectivity.isInternetConnective){
      return ds.createPost(content, location, category, image);
    }else{
      return left(Failuer(Constants.internetErrorMessage));
    }
  }


}