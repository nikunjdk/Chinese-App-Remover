import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';

import 'show_all_apps_view_model.dart';

class ShowAllAppsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShowAllAppsViewModel>.reactive(
      onModelReady: (model) => model.getApps(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('My Apps'),
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (context) {
                return <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                    value: 'system_apps',
                    child: Text('Toggle system apps'),
                  ),
                  PopupMenuItem<String>(
                    value: "launchable_apps",
                    child: Text('Toggle launchable apps only'),
                  ),
                ];
              },
              onSelected: (key) {
                if (key == "system_apps") {
                  model.toggleShowSystemApps();
                }
                if (key == "launchable_apps") {
                  model.toggleOnlyLaunchableApps();
                }
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: null,
                accountEmail: null,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets\\images\\logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              ListTile(
                title: Text('Detect Chinese Apps'),
                onTap: () => model.navigateToHome(),
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Text('Alternative to Chinese Apps'),
                onTap: () => model.navigateToAlternatives(),
              ),
              Divider(
                color: Colors.black,
              ),
              ListTile(
                title: Text('Show My Apps'),
              ),
              Divider(
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: model.isBusy
            ? Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets\\images\\background.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 450.0,
                      ),
                      SpinKitFadingCircle(
                        color: Colors.blue[900],
                        size: 50.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Detecting Apps',
                            style: TextStyle(
                              fontSize: 35.0,
                              height: 3.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 60.0,
                              ),
                              SpinKitThreeBounce(
                                color: Colors.blue[900],
                                size: 20.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets\\images\\background.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: ListView.builder(
                  itemBuilder: (context, position) {
                    Application app = model.apps[position];
                    return Column(
                      children: <Widget>[
                        Card(
                          color: Color.fromRGBO(0, 0, 0, 0.4),
                          child: ListTile(
                            leading: app is ApplicationWithIcon
                                ? CircleAvatar(
                                    backgroundImage: MemoryImage(app.icon),
                                    backgroundColor: Colors.white,
                                  )
                                : null,
                            onTap: () => DeviceApps.openApp(app.packageName),
                            title: Text(
                              "${app.appName}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              'Version: ${app.versionName}\n'
                              'Installed: ${DateTime.fromMillisecondsSinceEpoch(app.installTimeMillis).toString()}\n'
                              'Updated: ${DateTime.fromMillisecondsSinceEpoch(app.updateTimeMillis).toString()}',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            trailing: SizedBox(
                              width: 120.0,
                              child: Center(
                                child: RaisedButton(
                                  color: Colors.red[400],
                                  child: Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                'Uninstall',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                'App',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onPressed: () async {
                                    await model.uninstallApp(app).then(
                                      (value) async {
                                        await Future.delayed(
                                          Duration(seconds: 5),
                                        );
                                        await model.getApps();
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: model.apps.length,
                ),
              ),
      ),
      viewModelBuilder: () => ShowAllAppsViewModel(),
    );
  }
}
