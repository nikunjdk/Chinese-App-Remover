import 'package:chineseappremover/app/locator.dart';
import 'package:chineseappremover/app/router.gr.dart';
import 'package:device_apps/device_apps.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uninstall_apps/uninstall_apps.dart';

class ShowAllAppsViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  DialogService _dialogService = locator<DialogService>();
  bool _showSystemApps = false;
  bool _onlyLaunchableApps = false;
  List<Application> apps;

  get showSystemApps => _showSystemApps;
  get onlyLaunchableApps => _onlyLaunchableApps;

  void toggleShowSystemApps() {
    _showSystemApps = !_showSystemApps;
    notifyListeners();
  }

  void toggleOnlyLaunchableApps() {
    _onlyLaunchableApps = !_onlyLaunchableApps;
    notifyListeners();
  }

  Future uninstallApp(Application app) async {
    try {
      await UninstallApps.uninstall("com.instagram.android");
    } catch (e) {
      _dialogService.showDialog(
          title: 'App not Uninstalled',
          description:
              'Sorry, the app could not be uninstalled. Please try again later.');
    }
  }

  Future getApps() async {
    setBusy(true);
    var apps = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      includeSystemApps: showSystemApps,
      onlyAppsWithLaunchIntent: onlyLaunchableApps,
    );
    this.apps = apps;
    notifyListeners();
    setBusy(false);
  }

  Future navigateToHome() async {
    await _navigationService.navigateTo(Routes.homeViewRoute);
  }

  Future navigateToAlternatives() async {
    await _navigationService.navigateTo(Routes.alternativesViewRoute);
  }
}
