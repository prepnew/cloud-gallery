import 'package:cloud_gallery/ui/flow/accounts/accounts_screen.dart';
import 'package:cloud_gallery/ui/flow/media_transfer/media_transfer_screen.dart';
import 'package:cloud_gallery/ui/flow/onboard/onboard_screen.dart';
import 'package:data/models/media/media.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../flow/home/home_screen.dart';
import '../flow/media_metadata_details/media_metadata_details.dart';
import '../flow/media_preview/media_preview_screen.dart';
import 'app_route.dart';

class AppRouter {
  static AppRoute get home => AppRoute(
        AppRoutePath.home,
        builder: (context) => const HomeScreen(),
      );

  static AppRoute get onBoard => AppRoute(
        AppRoutePath.onBoard,
        builder: (context) => const OnBoardScreen(),
      );

  static AppRoute get accounts => AppRoute(
        AppRoutePath.accounts,
        builder: (context) => const AccountsScreen(),
      );

  static AppRoute get mediaTransfer => AppRoute(
    AppRoutePath.transfer,
    builder: (context) => const MediaTransferScreen(),
  );

  static AppRoute preview(
          {required List<AppMedia> medias, required String startFrom}) =>
      AppRoute(
        AppRoutePath.preview,
        builder: (context) => MediaPreview(
          medias: medias,
          startFrom: startFrom,
        ),
      );

  static AppRoute mediaMetaDataDetails(
      {required AppMedia media}) =>
      AppRoute(
        AppRoutePath.metaDataDetails,
        builder: (context) => MediaMetadataDetailsScreen(
          media: media,
        ),
      );

  static final routes = <GoRoute>[
    home.goRoute,
    onBoard.goRoute,
    accounts.goRoute,
    mediaTransfer.goRoute,
    GoRoute(
      path: AppRoutePath.metaDataDetails,
      builder: (context, state) => state.widget(context),
    ),
    GoRoute(
      path: AppRoutePath.preview,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          opaque: false,
          key: state.pageKey,
          child: state.widget(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      },
    ),
  ];
}

class AppRoutePath {
  static const home = '/';
  static const onBoard = '/on-board';
  static const accounts = '/accounts';
  static const preview = '/preview';
  static const transfer = '/transfer';
  static const metaDataDetails = '/metadata-details';
}
