import 'package:flutter/material.dart';
import 'components/user_list_view_components.dart';
import '../app_core/ui/ui.dart';
import 'package:get/get.dart';
import '../presenter/user_list_presenter.dart';


class UserListView extends Ui with UserListViewComponents{
  const UserListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context)=>getPage(
      title: "Flutter MVP Sample",
      body: GetX<UserListPresenter>(
        init: UserListPresenter(),
        builder: (presenter)=>presenter.isUsersLoaded?(
            presenter.isErrorExist?getErrorScreen(errorTitle: "Kullanıcılar Yüklenemedi...", errorMessage: "İnternet bağlantınızı kontrol edin.")
                :
            getPageElementsWidget(
                pageElements: List<Widget>.generate(
                    presenter.users.length,
                        (i) => getUserBox(user: presenter.users[i],
                        onPressed: ()=>presenter.navigateToOtherPage(routeName: 'userDetailView', arguments:  presenter.users[i])
                    )
                )
            )
        ):getLoadingScreen(loadingMessage: "Kullanıcılar Yükleniyor\n..."),
      )
  );
}


