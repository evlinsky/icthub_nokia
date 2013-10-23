#include "model.h"
#include "modelchooser.h"


ModelChooser::ModelChooser(QList<Model*> m)
{
    models = m;
    state = 0;
}

ModelChooser::~ModelChooser()
{
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
int ModelChooser::getStationIdByName(QString stationName){
        return models[state]->getStationIdByName(stationName);
}

QVariantList ModelChooser::getRoute( int _StartPositonId,
                              int _EndPositonId )
{
        return models[state]->getRoute( _StartPositonId,_EndPositonId );



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

int ModelChooser::getFont()
{
        return models[state]->getXmlFontSize();
}


QString ModelChooser::getMapDir(){
        return models[state]->getMapDir();
}
double ModelChooser::getXmlHeight(){
        return models[state]->getXmlHeight();
}
double ModelChooser::getXmlWidth(){
        return models[state]->getXmlWidth();
}
double ModelChooser::getLinePen(){
    return 8;
}
int ModelChooser::isTransition(int _id){
        return models[state]->isTransition(_id);
}



