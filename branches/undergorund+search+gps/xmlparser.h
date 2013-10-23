#ifndef XMLPARSER_H
#define XMLPARSER_H
#include <QtCore>
#include <QFile>
#include <QString>
#include <QVector>
#include <QtXml/qdom.h>
#include <QDebug>
#include "apptypes.h"

class xmlParser
{
    QVector<Station>* StLst;
    QVector<Edge>* EdLst;
    void parseElement( const QDomElement &element);

public:
    xmlParser( QFile* file, QVector<Station>* stations, QVector<Edge>* edges,double* mapHeight,double* mapWidth, double* fontSize, QString& mapDir,QString& mapPastelDir  );
    // QList<Station>* getStationsList();
    // QList<Edge>* getEdgesList();
};

#endif // XMLPARSER_H
