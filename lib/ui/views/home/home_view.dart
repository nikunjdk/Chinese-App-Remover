import 'package:chineseappremover/ui/views/home/home_view_model.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:screenshot/screenshot.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.getChineseApps(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Chinese Apps'),
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
                onTap: () => model.navigateToShowAllApps(),
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
                            'Detecting Chinese Apps',
                            style: TextStyle(
                              fontSize: 30.0,
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
            : model.chineseApps.length == 0
                ? Screenshot(
                    controller: model.screenshotController,
                    child: Container(
                      constraints: BoxConstraints.expand(),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets\\images\\atmanirbhar.png'),
                          // fit: BoxFit.fill,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'Congratulations!!!',
                              style: TextStyle(
                                fontSize: 40.0,
                                color: Colors.blue,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'You have removed all banned chinese app on your phone using the Chinese App Remover',
                                style: TextStyle(
                                  color: Colors.green[500],
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 350.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                SizedBox(
                                  width: 150.0,
                                  child: RaisedButton(
                                    color: Colors.orange,
                                    onPressed: () =>
                                        model.navigateToShowAllApps(),
                                    child: Center(
                                      child: Text(
                                        'My apps',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 150.0,
                                  child: RaisedButton(
                                    color: Colors.blue[900],
                                    onPressed: () =>
                                        model.navigateToAlternatives(),
                                    child: Center(
                                      child: Text(
                                        'Alternative to Chinese Apps',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            SizedBox(
                              width: 140.0,
                              child: RaisedButton(
                                color: Colors.green,
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(
                                        Icons.share,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        'Share Now!',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: () => model.shareNow(),
                              ),
                            ),
                          ],
                        ),
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
                        Application app = model.chineseApps[position];
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
                                onTap: () =>
                                    DeviceApps.openApp(app.packageName),
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
                                            await model.getChineseApps();
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
                      itemCount: model.chineseApps.length,
                    ),
                  ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
