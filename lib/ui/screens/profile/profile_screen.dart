import 'package:be_helpful/data/model/profile_response/profile_response.dart';
import 'package:be_helpful/domain/di/di.dart';
import 'package:be_helpful/ui/screens/profile/profile_view_model.dart';
import 'package:be_helpful/ui/utils/app_assets.dart';
import 'package:be_helpful/ui/utils/app_colors.dart';
import 'package:be_helpful/ui/utils/base_request_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../data/model/home_responses/posts_response.dart';
import '../home/widgets/list_of posts.dart';
import 'edit_profile/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = "ProfileScreen";

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {

  ProfileViewModel viewModel = getIt();

  @override
  void initState() {
    viewModel.getProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder(
          bloc:viewModel.getProfileUseCase,
          builder: (context, state) {

            print(state);
            if(state is BaseRequestSuccessState){
              ProfileDataDetails profileDataDetails = state.data.data.data;
              return Column(
                children: [
                  const SizedBox(height: 20.0),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if(profileDataDetails.photo!.url != "default.jpg" )CircleAvatar(
                        radius: 70.0,
                        backgroundImage: NetworkImage(
                          profileDataDetails.photo?.url?? AppAssets.unknownOnline,
                        ), // Replace with your image URL
                      ),
                      if(profileDataDetails.photo!.url == "default.jpg" )CircleAvatar(
                        radius: 70.0,
                        backgroundImage: AssetImage(AppAssets.unknown)
                      ),
                      const SizedBox(height: 10.0),
                      Column(
                        children: [
                          Text(
                            profileDataDetails.name??"",
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          // ElevatedButton.icon(
                          //   onPressed: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => const AddPostScreen(),
                          //       ),
                          //     );
                          //   },
                          //   icon: const Icon(Icons.add),
                          //   label: const Text(
                          //     'إضافة منشور',
                          //     style: TextStyle(
                          //       fontSize: 18.0,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          //   style: ElevatedButton.styleFrom(
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(12.0),
                          //     ),
                          //     minimumSize: const Size(200, 50),
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfileScreen(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.black),
                      fixedSize: const Size(200, 30),
                    ),
                    child: const Text(
                      'تعديل الملف الشخصي',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 40.0,
                    thickness: 10.0,
                  ),
                  if(profileDataDetails.posts != null) Expanded(
                      child: buildPostsListView(profileDataDetails.posts!)
                  ),
                ],
              );
            }
            else if(state is BaseRequestErrorState){
              return  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message)
                ],
              );
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
