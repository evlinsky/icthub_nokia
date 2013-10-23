#ifndef MODEL_H
#define MODEL_H
#include <QtCore>
#include <QMetaObject>
#include <QFile>
#include <QString>
#include <QVector>
#include <QDebug>
#include <QtDeclarative>
#include "xmlparser.h"
class AppData;
#include "appdata.h"

class Model: public QObject
{
    Q_OBJECT

public:

    Q_INVOKABLE int getQuantity();
    Q_INVOKABLE int getSearchQuantity();
    Q_INVOKABLE QVariantMap getClickedStation(int x, int y);
    Q_INVOKABLE QVariantMap getNearestClickedStation(int x, int y);
    Q_INVOKABLE QVariantMap getStationNamesList();
    Q_INVOKABLE QVariantMap getStationIdsList();
    Q_INVOKABLE QVariantMap getMapStationById( int _id );
    Q_INVOKABLE QVariantList getStationById( unsigned short int _id );
    Q_INVOKABLE QVariantList getRoute( int _StartPositonId,
                                       int _EndPositonId,int legCost = 0 );
    Q_INVOKABLE int getTimeBtwnStations(int id1,int id2);
    Q_INVOKABLE QVector<Edge> getStationEdgeList(unsigned short int _id);
 //   Q_INVOKABLE QVariantMap func();
    Q_INVOKABLE QVariantList getStations();
    Q_INVOKABLE QVariantList getAllEdges();
    Q_INVOKABLE QVariantList getRects();
    Q_INVOKABLE QVariantList getRouteStations(QVariantList route);
    Q_INVOKABLE QVariantList getRouteEdges(QVariantList route);
    Q_INVOKABLE QVariantList searchStations(QString input);
    Q_INVOKABLE double getXmlHeight();
    Q_INVOKABLE double getXmlWidth();
    Q_INVOKABLE double getXmlFontSize();
    Q_INVOKABLE int getStationIdByName(QString stationName);
    Q_INVOKABLE int isTransition(int _id);
    Q_INVOKABLE QVariantMap getEdge(int id1,int id2);
    Q_INVOKABLE QVariantMap getCircle(int id);
    Q_INVOKABLE QString getMapDir();
    Q_INVOKABLE QString getMapPastelDir();

public:
    Model( QFile* fileName );
    ~Model();


private:
    xmlParser* dataParser;

    int statQuantity;
    int searchStationsQuantity;
    QVector<Station> StationsList;
    QVector<Edge> EdgesList;
    QVector<Rect> RectsList;
    AppData* appData;
    double mapHeight;
    double mapWidth;
    double fontSize;
    QString mapDir;
    QString mapPastelDir;

    void parseXMLdata( QFile* fileName );
};

#endif // MODEL_H
