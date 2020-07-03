import 'package:chineseappremover/ui/views/alternatives/alternatives_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AlternativesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlternativesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Alternative to Chinese Apps'),
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
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets\\images\\background.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: model.bannedApps.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 6.0, right: 6.0),
                      child: Card(
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: ExpansionTile(
                            trailing: Icon(
                              Icons.expand_more,
                              color: Colors.white,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${model.bannedApps[index]}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      model.alternativeApps[index].length,
                                  itemBuilder:
                                      (BuildContext context, int index2) {
                                    return FlatButton(
                                      child: Text(
                                        '${model.alternativeApps[index][index2][0]}',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () async {
                                        String url = model
                                            .alternativeApps[index][index2][1];
                                        await model.launchUrl(url);
                                      },
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      viewModelBuilder: () => AlternativesViewModel(),
    );
  }
}
