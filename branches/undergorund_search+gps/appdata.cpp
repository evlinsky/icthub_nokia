#include "appdata.h"
#include "modelchooser.h"

AppData::AppData()
{
    //models = new QList<Model*>();
}

AppData::~AppData()
{
}

void AppData::loadModel( QFile *fileName )
{
    models.append(new Model( fileName ));
}

void AppData::setViewer(QDeclarativeContext * view){
    appViewer = view;
}

ModelChooser* AppData::appModel()
{
    ModelChooser* mapchooser = new ModelChooser(models);
    return mapchooser;
}
