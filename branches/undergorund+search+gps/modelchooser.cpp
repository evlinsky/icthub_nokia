#include "model.h"
#include "modelchooser.h"


ModelChooser::ModelChooser(QList<Model*> m)
{
    models = m;
    state = 0;
    prevLegCost[0] = 0;
    prevLegCost[1] = 100;
    prevLegCost[2] = -3;
}

ModelChooser::~ModelChooser()
{
}
QVariantMap ModelChooser::getClickedStation(int x, int y)
{
    return models[state]->getClickedStation(x, y);
}
QVariantMap ModelChooser::getNearestClickedStation(int x, int y)
{
    return models[state]->getNearestClickedStation(x, y);
}

QVariantMap ModelChooser::getStationNamesList()
{
    return models[state]->getStationNamesList();
}
void ModelChooser::reloadMap(){
    state++;
    state = state%models.size();
}
void ModelChooser::setCity(int newState){
    state = newState;
    state = state%models.size();
}

QVariantList ModelChooser::getStations()
{
    return models[state]->getStations();
}
QVariantList ModelChooser::getAllEdges(){
    return models[state]->getAllEdges();
}
QVariantList ModelChooser::searchStations(QString input){
    return models[state]->searchStations(input);
}

int ModelChooser::getTimeBtwnStations(int id1,int id2){
    return models[state]->getTimeBtwnStations(id1,id2);
}

QVariantMap ModelChooser::getStationIdsList()
{
    return models[state]->getStationIdsList();
}

QVariantList ModelChooser::getStationById( unsigned short int _id )
{
    return models[state]->getStationById(_id );
}
QVariantMap ModelChooser::getMapStationById( int _id )
{
    return models[state]->getMapStationById(_id );

}
QVariantMap ModelChooser::getEdge(int id1,int id2)
{
    return models[state]->getEdge(id1,id2 );

}
QVariantMap ModelChooser::getCircle(int id)
{
    return models[state]->getCircle(id);
}

int ModelChooser::getStationIdByName(QString stationName){
    return models[state]->getStationIdByName(stationName);
}
QVariantList ModelChooser::getRoutesNum(){
    QVariantList routesNum;
    for(int i=0;i < routes.size(); i++ ){
        routesNum.push_back(prevLegCost[routes[i]]);
    }
    return routesNum;
}

QVariantList ModelChooser::getRoute( int _StartPositonId,
                                     int _EndPositonId, int legCost)
{
    for(int i = 0; i < 3; i++){
        if(_StartPositonId == prevStartId[i] && _EndPositonId == prevFinishId[i]
                && legCost == prevLegCost[i]){
            return prevRoute[i];
        }
    }
    for(int i = 0; i < 3; i++){
        prevStartId[i] = _StartPositonId;
        prevFinishId[i] = _EndPositonId;
        prevRoute[i] = models[state]->getRoute( _StartPositonId,_EndPositonId, prevLegCost[i]);
    }
    routes.clear();
    routes.push_back(0);
    if(prevRoute[0] != prevRoute[1]){
        routes.push_back(1);
        if(prevRoute[0] != prevRoute[2] && prevRoute[1] != prevRoute[2]){
            routes.push_back(2);
        }
    }else{
        if(prevRoute[0] != prevRoute[2]){
            routes.push_back(2);
        }
    }


    for(int i = 0; i < 3; i++){
        if(_StartPositonId == prevStartId[i] && _EndPositonId == prevFinishId[i]
                && legCost == prevLegCost[i]){
            return prevRoute[i];
        }
    }



}
QVector<Edge> ModelChooser::getStationEdgeList(unsigned short int _id){
    return models[state]->getStationEdgeList(_id);
}


int ModelChooser::getQuantity()
{
    return models[state]->getQuantity();
}
int ModelChooser::getSearchQuantity()
{
    return models[state]->getSearchQuantity();
}

double ModelChooser::getFont()
{
    return models[state]->getXmlFontSize();
}


QString ModelChooser::getMapDir(){
    return models[state]->getMapDir();
}
QString ModelChooser::getMapPastelDir(){
    return models[state]->getMapPastelDir();
}
double ModelChooser::getXmlHeight(){
    return models[state]->getXmlHeight();
}
double ModelChooser::getXmlWidth(){
    return models[state]->getXmlWidth();
}
double ModelChooser::getLinePen(){
    return 6;
}
int ModelChooser::isTransition(int _id){
    return models[state]->isTransition(_id);
}



