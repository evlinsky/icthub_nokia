#include "xmlparser.h"

xmlParser::xmlParser( QFile* file, QVector<Station>* stations, QVector<Edge>* edges,double *mapHeight,double *mapWidth, int *fontSize, QString &mapDir )
{
    StLst = stations;
    EdLst = edges;

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
    *fontSize = (root.attribute("fontSize")).toInt();
    mapDir = (root.attribute("source"));
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
}

void xmlParser::parseElement(const QDomElement &element)
{
    QDomNode nodeL2;
    Station tmpS;
    Edge tmpE;
    if( element.tagName() == "stations_list" )
    {        
        nodeL2 = element.firstChild();
        while( !nodeL2.isNull() )
        {
            tmpS.id = nodeL2.toElement().attribute("id").toInt();
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
//            tmpE.location = nodeL2.toElement().attribute("location");
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
}
