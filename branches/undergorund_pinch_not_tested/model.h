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
    Q_INVOKABLE QVariantMap getStationNamesList();
    Q_INVOKABLE QVariantMap getStationIdsList();
    Q_INVOKABLE QVariantMap getMapStationById( int _id );
    Q_INVOKABLE QVariantList getStationById( unsigned short int _id );
    Q_INVOKABLE QVariantList getRoute( int _StartPositonId,
                                       int _EndPositonId );
    Q_INVOKABLE int getTimeBtwnStations(int id1,int id2);
    Q_INVOKABLE QVector<Edge> getStationEdgeList(unsigned short int _id);
 //   Q_INVOKABLE QVariantMap func();
    Q_INVOKABLE QVariantList getStations();
    Q_INVOKABLE QVariantList getAllEdges();
    Q_INVOKABLE QVariantList searchStations(QString input);
    Q_INVOKABLE double getXmlHeight();
    Q_INVOKABLE double getXmlWidth();
    Q_INVOKABLE int getXmlFontSize();
    Q_INVOKABLE int getStationIdByName(QString stationName);
    Q_INVOKABLE int isTransition(int _id);
    Q_INVOKABLE QVariantMap getEdge(int id1,int id2);
    Q_INVOKABLE QString getMapDir();

public:
    Model( QFile* fileName );
    ~Model();


private:
    xmlParser* dataParser;

    unsigned short int statQuantity;
    int searchStationsQuantity;
    QVector<Station> StationsList;
    QVector<Edge> EdgesList;
    AppData* appData;
    double mapHeight;
    double mapWidth;
    int fontSize;
    QString mapDir;

    void parseXMLdata( QFile* fileName );
};

#endif // MODEL_H
