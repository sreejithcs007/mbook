import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../model/bookModel.dart';
import '../service/bookservice.dart';

class PostController extends GetxController {
  RxList postlist = RxList();
  RxBool isloading = true.obs;
  RxBool isInternetConncted = true.obs;
  RxBool isListScrollDown = false.obs;
  var url = "https://www.googleapis.com/books/v1/volumes?q=search+terms";

  checkIfInternetConnected() async {
    ///for checking internet connection
    isInternetConncted.value = await InternetConnectionChecker().hasConnection;
  }

  ///calling api and get response
   getPost() async {
    ///type void
    checkIfInternetConnected();
    isloading.value = true;
    var response = await BookService().getMethod(url);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        postlist.add(BookModel.fromJson(element));
      });
      isloading.value = false;
    }
  }

  @override
  void onInit() {
    getPost();
    isInternetConncted();
    super.onInit();
  }
}
