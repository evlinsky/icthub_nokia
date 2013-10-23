#ifndef APPDATA_H
#define APPDATA_H


#include <QFile>
#include <QDebug>
#include <QList>
#include "qmlapplicationviewer.h"

class Model;
class ModelChooser;


#include "model.h"
#include "modelchooser.h"

class AppData
{
    QList <Model*> models;
    QDeclarativeContext* appViewer;

public:
    AppData();
    ~AppData();

    Q_INVOKABLE void loadModel( QFile* fileName );

    Q_INVOKABLE ModelChooser* appModel();
    Q_INVOKABLE Model* appTmpModel();

    void setViewer(QDeclarativeContext * viewer);


    void reloadMap();
};

#endif // APPDATA_H
