#ifndef MODELCHOOSER_H
#define MODELCHOOSER_H

#include <QtCore>
#include <QMetaObject>
#include <QFile>
#include <QString>
#include <QVector>
#include <QDebug>
#include <QtDeclarative>
#include "model.h"

class ModelChooser: public QObject
{
    Q_OBJECT

public:

    Q_INVOKABLE int getQuantity();
    Q_INVOKABLE int getSearchQuantity();
    Q_INVOKABLE double getFont();
    Q_INVOKABLE QVariantMap getNearestClickedStation(int x, int y);
    Q_INVOKABLE QVariantMap getClickedStation(int x, int y);
    Q_INVOKABLE QVariantMap getStationNamesList();
    Q_INVOKABLE QVariantMap getStationIdsList();
    Q_INVOKABLE QVariantMap getMapStationById( int _id );
    Q_INVOKABLE QVariantList getStationById( unsigned short int _id );
    Q_INVOKABLE QVariantList getRoute( int _StartPositonId,
                                       int _EndPositonId,int legCost = 0 );
    Q_INVOKABLE QVariantList getRoutesNum();
    Q_INVOKABLE int getTimeBtwnStations(int id1,int id2);
    Q_INVOKABLE QVector<Edge> getStationEdgeList(unsigned short int _id);
 //   Q_INVOKABLE QVariantMap func();
    Q_INVOKABLE QVariantList getStations();
    Q_INVOKABLE QVariantList getAllEdges();
    Q_INVOKABLE QVariantList getRects();
    Q_INVOKABLE QVariantList getRouteStations(QVariantList route);
    Q_INVOKABLE QVariantList getRouteEdges(QVariantList route);
    Q_INVOKABLE QVariantList searchStations(QString input);
    Q_INVOKABLE int getStationIdByName(QString stationName);
    Q_INVOKABLE void reloadMap();
    Q_INVOKABLE QString getMapDir();
    Q_INVOKABLE QString getMapPastelDir();
    Q_INVOKABLE void setCity(int newState);
    Q_INVOKABLE double getXmlHeight();
    Q_INVOKABLE double getXmlWidth();
    Q_INVOKABLE QVariantMap getEdge(int id1,int id2);
    Q_INVOKABLE QVariantMap getCircle(int id);
    Q_INVOKABLE double getLinePen();
    Q_INVOKABLE int isTransition(int _id);

public:
    ModelChooser(QList<Model*> m);
    ~ModelChooser();


private:
    QList<Model*> models;
    int state;
    QVariantList prevRoute[5];
    int prevStartId[5];
    int prevFinishId[5];
    int prevLegCost[5];
    QList<int> routes;
};


#endif // MODELCHOOSER_H
