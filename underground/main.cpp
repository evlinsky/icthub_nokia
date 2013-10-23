#include <QtGui/QApplication>
#include <qdeclarative.h>
#include <QtDeclarative>
#include <QDeclarativeEngine>
#include <QDeclarativeComponent>
#include <QDeclarativeView>
#include <QDeclarativeItem>
#include <QWidget>
#include <QVBoxLayout>
#include "qmlapplicationviewer.h"
#include <QtCore>
#include <QtDeclarative>
#include "appdata.h"
#include <QDebug>
#include "line.h"
#include "mainwidget.h"





int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    qmlRegisterType<Line>("CustomComponents", 1, 0, "Line");
    qmlRegisterType<MainWidget>("CustomComponents", 1, 0, "MainWidget");

    AppData appData;
    QmlApplicationViewer *viewer = new QmlApplicationViewer();
    viewer->setAttribute(Qt::WA_NoSystemBackground);


    //QDeclarativeView view;
    QFile file( ":/spb.xml" );
    QFile file1( ":/moscow.xml" );
    appData.loadModel( &file );
    appData.loadModel( &file1 );


    appData.setViewer(viewer->rootContext());
    viewer->setOrientation(QmlApplicationViewer::ScreenOrientationLockPortrait);
    viewer->setMainQmlFile(QLatin1String("qml/Underground/Main.qml"));

    viewer->rootContext()->setContextProperty("mapModel", appData.appModel());
    viewer->showExpanded();
    viewer->show();

    return app.exec();    
}
