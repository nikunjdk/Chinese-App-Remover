import 'package:auto_route/auto_route_annotations.dart';
import 'package:chineseappremover/ui/views/alternatives/alternatives_view.dart';
import 'package:chineseappremover/ui/views/home/home_view.dart';
import 'package:chineseappremover/ui/views/show_all_apps/show_all_apps_view.dart';

@MaterialAutoRouter()
class $Router {
  // run 'flutter pub run build_runner build' after changing the routes in this file
  // paste the logger code in router.gr.dart after updating it
  // final log = getLogger('Router');
  // log.i('generateRoute | name: ${settings.name} arguments: ${settings.arguments}');

  @initial
  HomeView homeViewRoute;
  ShowAllAppsView showAllAppsViewRoute;
  AlternativesView alternativesViewRoute;
}
