import 'package:be_helpful/data/model/home_responses/posts_response.dart';
import 'package:be_helpful/ui/utils/app_colors.dart';
import 'package:be_helpful/ui/utils/app_theme.dart';
import 'package:be_helpful/ui/widgets/button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PostItem extends StatelessWidget {

  Posts postDM ;
   PostItem({super.key,required this.postDM});

  @override
  Widget build(BuildContext context) {
    print(postDM.createdAt);
    return Container(
      color: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(15),
              child: CachedNetworkImage(
                imageUrl: postDM.images![0].url ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png",
                // errorWidget: (_, __, ___) => Lottie.asset("assets/icons/not_found.json"),
                progressIndicatorBuilder: (_, __, progress) => Center(
                    child: CircularProgressIndicator(value: progress.progress,color: AppColors.primary)),
                height: MediaQuery.of(context).size.height * .25,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10,),
                  Text(
                    postDM.content ?? "",
                    maxLines: 2,
                    style:const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign:TextAlign.right ,

                  ),
                  const SizedBox(height: 5,),
                  lineSpace(context),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              postDM.createdAt.toString().substring(0,10)??"",
                              style: AppTheme.lightTheme.textTheme.labelMedium,
                            ),
                            const SizedBox(width: 2,),
                            Icon(Icons.watch_later_outlined , color: AppColors.grey,)
                          ],
                        ),
                        Text(
                          postDM.location??"",
                          style: AppTheme.lightTheme.textTheme.labelMedium,
                        ),
                         Row(
                          children: [
                            Text(
                              postDM.category??"",
                              style: AppTheme.lightTheme.textTheme.labelMedium,
                            ),
                            Icon(Icons.category_outlined,color: AppColors.grey,)
                          ],
                        ),
                      ],
                    ),
                  ),
                  lineSpace(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        postDM.user!.name ?? "",
                        style:const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        textAlign:TextAlign.right ,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            image: DecorationImage(
                                image: NetworkImage(postDM.user!.photo!.url!), fit: BoxFit.cover)),
                        margin: const EdgeInsets.only(left: 20 ,bottom: 10,top: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomButton(
                color: AppColors.babyBlue,
                text: "WatsApp",
                onPressed: (){
                  goToChatWhatsApp("");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToChatWhatsApp(String phoneNumber) {
    final Uri whatsApp = Uri.parse("https://wa.me/201027734183");
   launchUrl(whatsApp);

  }
}

lineSpace(BuildContext context)=>Container(
  width:MediaQuery.of(context).size.width *.8,
  height: 1,
  color: Colors.grey[300],
);
