import 'package:ciptakarya/app/modules/story/controllers/story_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story/story_page_view/story_page_view.dart';

class StoryView extends GetView<StoryPageController> {
  const StoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot?>(
        stream: controller.collectionStreamDataStory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final semuaStory = snapshot.data?.docs;
            return DismissiblePage(
              onDismissed: () {
                Get.back();
              },
              child: StoryPageView(
                itemBuilder: (context, index, storyIndex) {
                  return Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            '${(semuaStory?[index].data() as Map<String, dynamic>)['image']}',
                            fit: BoxFit.cover,
                            width: Get.width,
                            loadingBuilder: (context, child, progress) {
                              return progress == null
                                  ? child
                                  : const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.amber,
                                      ),
                                    );
                            },
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        child: Column(
                          children: [
                            Container(
                              width: Get.width,
                              color: Colors.black.withOpacity(0.2),
                              height: 85,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Center(
                                        child: Text(
                                      '${(semuaStory?[index].data() as Map<String, dynamic>)['tanggal']}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    const SizedBox(
                                      height: 5,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                pageLength: semuaStory!.length,
                storyLength: (int storyIndex) {
                  return 1;
                },
              ),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.amber,
            ));
          }
        },
      ),
    );
  }
}
