#include "xmlparser.h"

xmlParser::xmlParser( QFile* file, QVector<Station>* stations, QVector<Edge>* edges,QVector<Rect>* rects, double *mapHeight,double *mapWidth, double *fontSize, QString &mapDir,QString &mapPastelDir, int* statQuantity )
{
    StLst = stations;
    EdLst = edges;
    ReLst = rects;

    QDomDocument doc( "underMapInfo" );

    if( !file->open( QIODevice::ReadOnly ) )
        qDebug() << "file open failed";

    if( !doc.setContent( file ) )
    {
        file->close();
        qDebug() << "setting content failed";
    }
    file->close();

    QDomElement root = doc.documentElement();
    if( root.tagName() != "info" )
        qDebug() << "error: root node";
    *mapHeight = (root.attribute("sourceHeight")).toDouble();
    *mapWidth  = (root.attribute("sourceWidth")).toDouble();
    *fontSize = (root.attribute("fontSize")).toDouble();
    mapDir = (root.attribute("source"));
    mapPastelDir = (root.attribute("pastel_source"));
    QDomNode node = root.firstChild();
    while( !node.isNull() )
    {
        //QDomElement element = node.toElement();

        if( !node.toElement().isNull() )
        {
            parseElement( node.toElement() );
        }
        node = node.nextSibling();
    }
    *statQuantity = maxId;
}

void xmlParser::parseElement(const QDomElement &element)
{
    QDomNode nodeL2;
    Station tmpS;
    Edge tmpE;
    Rect tmpR;
    maxId = 0;
    if( element.tagName() == "stations_list" )
    {        
        nodeL2 = element.firstChild();
        while( !nodeL2.isNull() )
        {
            tmpS.id = nodeL2.toElement().attribute("id").toInt();
            if (tmpS.id > maxId)
                maxId = tmpS.id;
            tmpS.fullName = nodeL2.toElement().attribute("fullname");
            tmpS.name = nodeL2.toElement().attribute("name");
            tmpS.x = nodeL2.toElement().attribute("x").toInt();
            tmpS.y = nodeL2.toElement().attribute("y").toInt();
            tmpS.width = nodeL2.toElement().attribute("width").toInt();
            tmpS.height = nodeL2.toElement().attribute("height").toInt();
            tmpS.HAlign = nodeL2.toElement().attribute("halign").toInt();
            tmpS.VAlign = nodeL2.toElement().attribute("valign").toInt();
            tmpS.color = nodeL2.toElement().attribute("stationcolor").toUtf8();
            tmpS.line = nodeL2.toElement().attribute("line").toUShort();
            tmpS.latitude = nodeL2.toElement().attribute("latitude").toDouble();
            tmpS.longitude = nodeL2.toElement().attribute("longitude").toDouble();
            tmpS.xCenter = nodeL2.toElement().attribute("xcenter",QString("-1")).toDouble();
            tmpS.yCenter = nodeL2.toElement().attribute("ycenter",QString("-1")).toDouble();
            /*
            tmpS.id = nodeL2.toElement().attribute("id").toUShort();
            tmpS.name = nodeL2.toElement().attribute("name");
            tmpS.x = nodeL2.toElement().attribute("x").toUShort();
            tmpS.y = nodeL2.toElement().attribute("y").toUShort();
            */

            StLst->append( tmpS );
            nodeL2 = nodeL2.nextSibling();
        }
    }
    if( element.tagName() == "edges_list" )
    {
        nodeL2 = element.firstChild();
        while( !nodeL2.isNull() )
        {
            tmpE.id = nodeL2.toElement().attribute("id").toUShort();
            tmpE.value = nodeL2.toElement().attribute("value").toUShort();
            tmpE.idFrom = nodeL2.toElement().attribute("idFrom").toUShort();
            tmpE.idTo = nodeL2.toElement().attribute("idTo").toUShort();
            tmpE.byLegs = nodeL2.toElement().attribute("byLegs").toUShort() ? true : false;
            tmpE.x1 = nodeL2.toElement().attribute("x1").toInt();
            tmpE.y1 = nodeL2.toElement().attribute("y1").toInt();
            tmpE.x2 = nodeL2.toElement().attribute("x2").toInt();
            tmpE.y2 = nodeL2.toElement().attribute("y2").toInt();
            tmpE.x3 = nodeL2.toElement().attribute("x3",QString("-1")).toInt();
            tmpE.y3 = nodeL2.toElement().attribute("y3",QString("-1")).toInt();
            tmpE.x4 = nodeL2.toElement().attribute("x4",QString("-1")).toInt();
            tmpE.y4 = nodeL2.toElement().attribute("y4",QString("-1")).toInt();

            EdLst->append( tmpE );
            nodeL2 = nodeL2.nextSibling();
        }
    }
    if( element.tagName() == "rects_list" )
    {
        nodeL2 = element.firstChild();
        while( !nodeL2.isNull() )
        {
            tmpR.x = nodeL2.toElement().attribute("x").toInt();
            tmpR.y = nodeL2.toElement().attribute("y").toInt();
            tmpR.width = nodeL2.toElement().attribute("width").toInt();
            tmpR.height = nodeL2.toElement().attribute("height").toInt();
            tmpR.rotation = nodeL2.toElement().attribute("rotation").toInt();

            ReLst->append( tmpR );
            nodeL2 = nodeL2.nextSibling();
        }
    }
}
