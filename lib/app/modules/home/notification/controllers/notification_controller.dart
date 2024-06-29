import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:angelhack_hcm/app/shared/constants/enums/systems.dart';
import 'package:angelhack_hcm/app/shared/utils/utils.dart';
import 'package:angelhack_hcm/app/shared/widgets/base/base_controller.dart';

import '../../homepage/controllers/homepage_controller.dart';

class NotificationController extends BaseController {
  //* Dependencies
  final homeController = Get.find<HomepageController>();

  //* Variables
  final notifications = [].obs;
  final hasReadAll = false.obs;
  final pagingController = PagingController(firstPageKey: 0);

  // Generate a list of 10 dummy notifications

  //* Getters
  bool get hasNotification => notifications.isNotEmpty;
  bool get hasReadAllNotification => hasReadAll.value;

  //* Methods
  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) => fetchData(pageKey));
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  Future<void> fetchData(int pageKey, {int pageSize = 20}) async {
    // Do Something

    try {
      // do something

      // if no data
      if (notifications.isEmpty) {
        pagingController.appendLastPage([]);
      } else {
        pagingController.appendPage(notifications, pageKey + 1);
      }
    } catch (e) {
      pagingController.error = e;
    }
  }

  Future<void> onRefresh() async {
    pagingController.refresh();
  }

  Future<void> markAsRead(int id) async {
    try {
      // do something

      // refresh notification
      await onRefresh();
    } catch (e) {
      await AppUtils.showSnackBar(
        message: e.toString(),
        type: SnackBarType.error,
      );
    }
  }

  Future<void> markAllAsRead() async {
    try {
      // do something

      // refresh notification
      await onRefresh();
      homeController.hasNotification.value = false;
    } catch (e) {
      await AppUtils.showSnackBar(
        message: e.toString(),
        type: SnackBarType.error,
      );
    }
  }
}
