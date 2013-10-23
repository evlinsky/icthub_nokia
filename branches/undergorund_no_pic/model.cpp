#include "model.h"
#include <math.h>

Model::Model( QFile* fileName )
{
    parseXMLdata( fileName );
    //statQuantity = StationsList.size();
    //qDebug("Model was created");

    //    qDebug() << statQuantity;
    //    qDebug() << StationsList.first().name;
    //    qDebug() << StationsList.last().name;
}

Model::~Model()
{
    if ( dataParser != NULL )
        delete dataParser;
}

QVariantList Model::getRouteEdges(QVariantList route){
    QVariantList edges;
    for (int i=1; i<route.count(); ++i) {
        QVariantMap temp = getEdge(route.at(i).toMap()["id"].toInt(), route.at(i-1).toMap()["id"].toInt());
        QVariantMap map;
        map.insert("x1",temp["x1"]);
        map.insert("y1",temp["y1"]);
        map.insert("x2",temp["x2"]);
        map.insert("y2",temp["y2"]);
        map.insert("y3",temp["y3"]);
        map.insert("x3",temp["x3"]);
        map.insert("y4",temp["y4"]);
        map.insert("x4",temp["x4"]);
        map.insert("id",temp["id"]);
        map.insert("byLegs",temp["byLegs"]);
        map.insert("color",temp["color"]);
        edges.append(map);
    }
    return edges;
}
QVariantList Model::getRouteStations(QVariantList route) {
    QVariantList list;

    for (int i=0; i<route.count(); ++i)
    {
        /*QVariantMap cur;
        cur.insert("id", temp["id"]);
        cur.insert("stationColor", temp["color"]);
        cur.insert("xCenter", StationsList.at(temp["id"].toInt()-1).xCenter);
        cur.insert("yCenter", StationsList.at(temp["id"].toInt()-1).yCenter);
        if(StationsList.at(temp["id"].toInt()-1).xCenter == -1){
            QVariantMap map = getEdge(StationsList.at(temp["id"].toInt()-1).id,-1);
            cur.insert("xCenter", map.take("x1").toInt());
            cur.insert("yCenter", map.take("y1").toInt());
        }
        list.append(cur);*/
        QVariantMap temp = getMapStationById(route.at(i).toMap()["id"].toInt());
        list.append(temp);
    }

    return list;
}

QVariantMap Model::getClickedStation(int x, int y)
{
    for (int i=0; i<StationsList.size(); ++i)
    {
        if ((x>StationsList.at(i).x)&&(x<StationsList.at(i).x+StationsList.at(i).width)&&
                (y>StationsList.at(i).y)&&(y<StationsList.at(i).y+StationsList.at(i).height))
        {
            QVariantMap res;
            res.insert("id", StationsList.at(i).id);
            res.insert("x", StationsList.at(i).x);
            res.insert("y", StationsList.at(i).y);
            res.insert("fullName", StationsList.at(i).fullName);
            res.insert("stationColor", StationsList.at(i).color);
            return res;
        }
    }
    QVariantMap res;
    res.insert("fullName", "NULL");
    return res;
}
QVariantMap Model::getNearestClickedStation(int x, int y)
{
    int minDist = 9999999;
    QVariantMap res;
    for (int i=0; i<StationsList.size(); ++i)
    {
        int dX1 = abs(x - StationsList.at(i).x);
        int dY1 = abs(y - StationsList.at(i).y);
        int dX2 = abs(x - StationsList.at(i).x - StationsList.at(i).width);
        int dY2 = abs(y - StationsList.at(i).y - StationsList.at(i).height);

        int curX = (dX1<dX2)?dX1:dX2;
        int curY = (dY1<dY2)?dY1:dY2;
        if (curX*curX + curY*curY < minDist)
        {
            minDist =  curX*curX + curY*curY;
            res.insert("id", StationsList.at(i).id);
            res.insert("x", StationsList.at(i).x);
            res.insert("y", StationsList.at(i).y);
            res.insert("fullName", StationsList.at(i).fullName);
            res.insert("stationColor", StationsList.at(i).color);
        }
    }
    return res;
}

QVariantMap Model::getStationNamesList()
{
    QVariantMap list;
    for (int i = 0; i<StationsList.size(); i++ )
        list.insert(StationsList.at(i).name, StationsList.at(i).line);

    return list;
}
QVariantList Model::getStations()
{
    QVariantList list;

    for (int i=0; i<StationsList.size(); ++i)
    {
        /*QVariantMap cur;
        cur.insert("id", StationsList.at(i).id);
        cur.insert("fullName", StationsList.at(i).fullName);
        cur.insert("name", StationsList.at(i).name);
        cur.insert("stationColor", StationsList.at(i).color);
        cur.insert("x", StationsList.at(i).x);
        cur.insert("y", StationsList.at(i).y);
        cur.insert("width", StationsList.at(i).width);
        cur.insert("height", StationsList.at(i).height);
        cur.insert("HAlign", StationsList.at(i).HAlign);
        cur.insert("VAlign", StationsList.at(i).VAlign);
        cur.insert("latitude", StationsList.at(i).latitude);
        cur.insert("longitude", StationsList.at(i).longitude);
        cur.insert("xCenter", StationsList.at(i).xCenter);
        cur.insert("yCenter", StationsList.at(i).yCenter);
        if(StationsList.at(i).xCenter == -1){
            QVariantMap map = getEdge(StationsList.at(i).id,-1);
            cur.insert("xCenter", map.take("x1").toInt());
            cur.insert("yCenter", map.take("y1").toInt());
        }
        list.append(cur);*/
        QVariantMap temp = getMapStationById(StationsList.at(i).id);
        list.append(temp);
    }

    return list;
}
QVariantList Model::searchStations(QString input)
{
    QVariantList list;
    for (int i=0; i<StationsList.size(); ++i)
    {
        if (StationsList.at(i).fullName.toLower().contains(input.toLower()))
        {
            QVariantMap cur;
            cur.insert("id", StationsList.at(i).id);
            cur.insert("fullName", StationsList.at(i).fullName);
            cur.insert("stationColor", StationsList.at(i).color);
            list.append(cur);
        }
    }
    searchStationsQuantity=list.count();
    return list;
}

int Model::getTimeBtwnStations(int id1,int id2){
    for(int i=0;i < EdgesList.size();i++){
        if(EdgesList.at(i).idFrom == id1 && EdgesList.at(i).idTo == id2)
            return EdgesList.at(i).value;
        if(EdgesList.at(i).idFrom == id2 && EdgesList.at(i).idTo == id1)
            return EdgesList.at(i).value;
    }
    return 0;
}

QVariantMap Model::getStationIdsList()
{
    QVariantMap list;
    for (int i = 0; i<StationsList.size(); i++ )
        list.insert(StationsList.at(i).name, StationsList.at(i).id);

    return list;
}

QVariantList Model::getStationById( unsigned short int _id )
{
    QVariantList list;
    for (int i = 0; i<StationsList.size(); i++ ){
        if (StationsList.at(i).id == _id){
            list.append(StationsList.at(i).name);
            list.append(StationsList.at(i).line);
            list.append(StationsList.at(i).x);
            list.append(StationsList.at(i).y);
            break;
        }
    }

    return list;
}
QVariantList Model::getAllEdges(){

    QVariantList list;
    for(int j=0; j < EdgesList.size(); j ++){
        QVariantMap map;
        map.insert("x1",EdgesList[j].x1);
        map.insert("y1",EdgesList[j].y1);
        map.insert("x2",EdgesList[j].x2);
        map.insert("y2",EdgesList[j].y2);
        map.insert("y3",EdgesList[j].y3);
        map.insert("x3",EdgesList[j].x3);
        map.insert("y4",EdgesList[j].y4);
        map.insert("x4",EdgesList[j].x4);
        map.insert("id",EdgesList[j].id);
        map.insert("byLegs",EdgesList[j].byLegs);
        map.insert("color",getMapStationById(EdgesList[j].idFrom).take("color"));
        list.append(map);
    }

    return list;
}
QVariantList Model::getRects(){

    QVariantList list;
    for(int j=0; j < RectsList.size(); j ++){
        QVariantMap map;
        map.insert("x",RectsList[j].x);
        map.insert("y",RectsList[j].y);
        map.insert("width",RectsList[j].width);
        map.insert("height",RectsList[j].height);
        map.insert("rotation",RectsList[j].rotation);
        list.append(map);
    }

    return list;
}
QVariantMap Model::getCircle(int id){
    QVariantMap map;
    for (int i = 0; i<StationsList.size(); i++ ){
        if (StationsList.at(i).id == id){
            map.insert("x",StationsList.at(i).xCenter);
            map.insert("y",StationsList.at(i).yCenter);
            return map;
        }
    }
    return map;
}

QVariantMap Model::getEdge(int id1,int id2){
    QVariantMap map;
    for(int j=0; j < EdgesList.size(); j ++){
        if(EdgesList[j].idFrom == id1 && (EdgesList[j].idTo == id2 || id2 == -1)){
            map.insert("x1",EdgesList[j].x1);
            map.insert("y1",EdgesList[j].y1);
            map.insert("x2",EdgesList[j].x2);
            map.insert("y2",EdgesList[j].y2);
            map.insert("y3",EdgesList[j].y3);
            map.insert("x3",EdgesList[j].x3);
            map.insert("y4",EdgesList[j].y4);
            map.insert("x4",EdgesList[j].x4);
            map.insert("id",EdgesList[j].id);
            map.insert("byLegs",EdgesList[j].byLegs);
            map.insert("color",getMapStationById(EdgesList[j].idFrom).take("color"));
            return map;
        }
        if(EdgesList[j].idTo == id1 && (EdgesList[j].idFrom == id2 || id2 == -1)){
            map.insert("x2",EdgesList[j].x1);
            map.insert("y2",EdgesList[j].y1);
            map.insert("x1",EdgesList[j].x2);
            map.insert("y1",EdgesList[j].y2);
            map.insert("y3",EdgesList[j].y3);
            map.insert("x3",EdgesList[j].x3);
            map.insert("y4",EdgesList[j].y4);
            map.insert("x4",EdgesList[j].x4);
            map.insert("id",EdgesList[j].id);
            map.insert("byLegs",EdgesList[j].byLegs);
            map.insert("color",getMapStationById(EdgesList[j].idFrom).take("color"));
            return map;
        }
    }
    return map;
}

QVariantMap Model::getMapStationById( int _id )
{
    //qDebug() << "getMapStationById " << _id;
    QVariantMap cur;
    for (int i = 0; i<StationsList.size(); i++ ){
        if (StationsList.at(i).id == _id){
            cur.insert("id", StationsList.at(i).id);
            cur.insert("fullName", StationsList.at(i).fullName);
            cur.insert("name", StationsList.at(i).name);
            cur.insert("stationColor", StationsList.at(i).color);
            cur.insert("color",StationsList.at(i).color);
            cur.insert("x", StationsList.at(i).x);
            cur.insert("y", StationsList.at(i).y);
            cur.insert("width", StationsList.at(i).width);
            cur.insert("height", StationsList.at(i).height);
            cur.insert("HAlign", StationsList.at(i).HAlign);
            cur.insert("VAlign", StationsList.at(i).VAlign);
            cur.insert("latitude", StationsList.at(i).latitude);
            cur.insert("longitude", StationsList.at(i).longitude);
            for(int j=0; j < EdgesList.size(); j ++){
                if(EdgesList[j].idFrom == _id){
                    cur.insert("xCenter",EdgesList[j].x1);
                    cur.insert("yCenter",EdgesList[j].y1);
                }
                if(EdgesList[j].idTo == _id){
                    cur.insert("xCenter",EdgesList[j].x2);
                    cur.insert("yCenter",EdgesList[j].y2);
                }
            }
            if (StationsList.at(i).xCenter!=-1) {
                cur.insert("xCenter", StationsList.at(i).xCenter);
                cur.insert("yCenter", StationsList.at(i).yCenter);
            }
            return cur;
        }
    }

    cur.insert("fullName","Empty station");
    cur.insert("line",0);
    cur.insert("id",_id);
    return cur;

    /*QVariantMap map;
    for (int i = 0; i<StationsList.size(); i++ ){
        if (StationsList.at(i).id == _id){
            map.insert("fullName",StationsList.at(i).fullName);
            map.insert("color",StationsList.at(i).color);
            map.insert("width",StationsList.at(i).width);
            //qDebug() << "Line" << StationsList.at(i).line;
            map.insert("id",_id);
            for(int j=0; j < EdgesList.size(); j ++){
                if(EdgesList[j].idFrom == _id){
                    map.insert("x",EdgesList[j].x1);
                    map.insert("y",EdgesList[j].y1);
                }
                if(EdgesList[j].idTo == _id){
                    map.insert("x",EdgesList[j].x2);
                    map.insert("y",EdgesList[j].y2);
                }
            }
            return map;
        }
    }

    map.insert("fullName","Empty station");
    map.insert("line",0);
    map.insert("id",_id);
    return map;*/

}
int Model::getStationIdByName(QString stationName){
    for (int i = 0; i<StationsList.size(); i++ ){
        if (!StationsList.at(i).fullName.compare(stationName)){
            return StationsList.at(i).id;
        }
    }
    return 0;
}

QVariantList Model::getRoute( int _StartPositonId,
                              int _EndPositonId,int legCost)
{
    QVariantList shoterWay;
    int infinity = 999999999;
    int v = _StartPositonId;
    statQuantity = 195;
    qDebug() << statQuantity;
    int* P = new int[statQuantity+1];
    int* D = new int[statQuantity+1];
    bool* visitedVer = new bool[statQuantity+1];

    if(_StartPositonId == _EndPositonId){
        shoterWay.append( getMapStationById(_StartPositonId));
        shoterWay.append( getMapStationById(_StartPositonId));
        delete P;
        delete D;
        delete visitedVer;
        return shoterWay;
    }


    //qDebug() <<  "From: " << _StartPositonId << " To: " << _EndPositonId;


    for(int i=0; i < statQuantity+1;i++){
        D[i] = infinity;
        visitedVer[i] = false;
        P[i] = 0;
    }
    D[_StartPositonId] = 0;
    P[_StartPositonId] = 0;
    visitedVer[_StartPositonId] = true;

    while(1){
        QVector<Edge> edges = getStationEdgeList(v);
        for(int i = 0; i < edges.size() ; i++ ){
            qDebug() << edges.at(i).idTo;
            if(visitedVer[edges.at(i).idTo] == false && D[edges.at(i).idTo] > D[v] + edges.at(i).value){
                D[edges.at(i).idTo] = D[v] + edges.at(i).value;
                if(getEdge(edges.at(i).idTo,v).value("byLegs").toBool()){
                    D[edges.at(i).idTo] += legCost;
                }
                P[edges.at(i).idTo] = v;
            }
        }
        //qDebug() << v ;
        int w = infinity;
        v = -1;

        for(int i = 0; i < statQuantity + 1 ; i++){
            if(visitedVer[i] == false && D[i] < w){
                v = i;
                w = D[i];
            }
        }
        if(v == _EndPositonId){
            //qDebug() << "Route";
            int u = _EndPositonId;
            while(u != _StartPositonId)
            {
                shoterWay.append( getMapStationById(u));
                u=P[u];
            }
            shoterWay.append( getMapStationById(u));
            delete P;
            delete D;
            delete visitedVer;
            return shoterWay;

        }
        if(v == -1){
            //cant find rout
            //qDebug() << "No route";
            delete P;
            delete D;
            delete visitedVer;
            return shoterWay;
        }
        visitedVer[v] = true;

    }



}
QVector<Edge> Model::getStationEdgeList(unsigned short int _id){
    QVector<Edge> edges;


    for(int i=0;i < EdgesList.size();i++){
        if(EdgesList.at(i).idFrom == _id){
            edges.append(EdgesList.at(i));
        }
        if(EdgesList.at(i).idTo == _id){
            edges.append(EdgesList.at(i));
            int tmp = edges[edges.size() - 1].idTo;
            edges[edges.size() - 1].idTo = edges[edges.size() - 1].idFrom;
            edges[edges.size() - 1].idFrom = tmp;
        }
    }
    return edges;


}
double Model::getXmlHeight(){
    return mapHeight;
}
double Model::getXmlWidth(){
    return mapWidth;
}
double Model::getXmlFontSize(){
    return fontSize;
}

void Model::parseXMLdata( QFile* file )
{
    dataParser = new xmlParser( file, &StationsList, &EdgesList,&RectsList, &mapHeight,&mapWidth, &fontSize,mapDir,mapPastelDir, &statQuantity );
    delete dataParser;
}

int Model::getQuantity()
{
    return StationsList.size();
    //return statQuantity;
}
int Model::getSearchQuantity()
{
    return searchStationsQuantity;
}

QString Model::getMapDir(){
    return mapDir;
}
QString Model::getMapPastelDir(){
    return mapPastelDir;
}
 int Model::isTransition(int _id){
     for(int i=0;i < EdgesList.size();i++){
         if(EdgesList.at(i).idFrom == _id){
             if(EdgesList.at(i).byLegs)
                 return EdgesList.at(i).idTo;
         }
         if(EdgesList.at(i).idTo == _id){
             if(EdgesList.at(i).byLegs)
                 return EdgesList.at(i).idFrom;
         }
     }
     return 0;
 }



