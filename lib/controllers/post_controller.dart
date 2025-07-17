import 'package:get/get.dart';
import '../models/post_model.dart';
import '../services/api_service.dart';

class PostController extends GetxController {
  var isLoading = true.obs;
  var postList = <Post>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await ApiService.fetchPosts();
      postList.assignAll(posts);
    } catch (e) {
      Get.snackbar("Error", "Failed to load posts");
    } finally {
      isLoading(false);
    }
  }
}
