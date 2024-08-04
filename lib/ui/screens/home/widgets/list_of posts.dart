import 'package:be_helpful/data/model/home_responses/posts_response.dart';
import 'package:be_helpful/ui/screens/home/widgets/post_item.dart';
import 'package:flutter/material.dart';

Widget buildPostsListView(List<Posts> posts) => ListView.separated(
  itemCount: posts.length ?? 0,
  separatorBuilder: (context, index) =>const SizedBox(height: 5,),
  itemBuilder: (context, index) => PostItem(postDM: posts[index]),
);