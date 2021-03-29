import 'package:get/get.dart';
import '../app_core/data_models/user_model.dart';
import '../model/user_list_model.dart';

class UserListPresenter extends GetxController{
  static UserListPresenter get to =>Get.find<UserListPresenter>();

  final _userListModel=UserListModel().obs;

  List<UserModel> get users=>_userListModel.value.users;
  bool get isUsersLoaded=>_userListModel.value.isUsersLoaded.value;
  bool get isErrorExist=>_userListModel.value.isErrorExist.value;

  navigateToOtherPage({String routeName, Object arguments})=>Get.toNamed(routeName, arguments: arguments);

  @override
  void onInit() async{
    await _userListModel.value.onInit();
    update();
    super.onInit();
  }
}