/****************************************************************************
** Meta object code from reading C++ file 'model.h'
**
** Created: Sat Sep 10 00:27:42 2011
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "model.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'model.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Model[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
      24,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: signature, parameters, type, tag, flags
      11,    6,    7,    6, 0x02,
      25,    6,    7,    6, 0x02,
      61,   57,   45,    6, 0x02,
      88,   57,   45,    6, 0x02,
     122,    6,   45,    6, 0x02,
     144,    6,   45,    6, 0x02,
     168,  164,   45,    6, 0x02,
     204,  164,  191,    6, 0x02,
     277,  239,  191,    6, 0x02,
     329,  299,  191,    6, 0x22,
     355,  347,    7,    6, 0x02,
     398,  164,  384,    6, 0x02,
     437,    6,  191,    6, 0x02,
     451,    6,  191,    6, 0x02,
     471,  465,  191,    6, 0x02,
     502,    6,  495,    6, 0x02,
     517,    6,  495,    6, 0x02,
     531,    6,  495,    6, 0x02,
     560,  548,    7,    6, 0x02,
     588,  164,    7,    6, 0x02,
     606,  347,   45,    6, 0x02,
     626,  623,   45,    6, 0x02,
     649,    6,  641,    6, 0x02,
     661,    6,  641,    6, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_Model[] = {
    "Model\0\0int\0getQuantity()\0getSearchQuantity()\0"
    "QVariantMap\0x,y\0getClickedStation(int,int)\0"
    "getNearestClickedStation(int,int)\0"
    "getStationNamesList()\0getStationIdsList()\0"
    "_id\0getMapStationById(int)\0QVariantList\0"
    "getStationById(unsigned short int)\0"
    "_StartPositonId,_EndPositonId,legCost\0"
    "getRoute(int,int,int)\0"
    "_StartPositonId,_EndPositonId\0"
    "getRoute(int,int)\0id1,id2\0"
    "getTimeBtwnStations(int,int)\0QVector<Edge>\0"
    "getStationEdgeList(unsigned short int)\0"
    "getStations()\0getAllEdges()\0input\0"
    "searchStations(QString)\0double\0"
    "getXmlHeight()\0getXmlWidth()\0"
    "getXmlFontSize()\0stationName\0"
    "getStationIdByName(QString)\0"
    "isTransition(int)\0getEdge(int,int)\0"
    "id\0getCircle(int)\0QString\0getMapDir()\0"
    "getMapPastelDir()\0"
};

const QMetaObject Model::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Model,
      qt_meta_data_Model, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Model::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Model::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Model::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Model))
        return static_cast<void*>(const_cast< Model*>(this));
    return QObject::qt_metacast(_clname);
}

int Model::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: { int _r = getQuantity();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 1: { int _r = getSearchQuantity();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 2: { QVariantMap _r = getClickedStation((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 3: { QVariantMap _r = getNearestClickedStation((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 4: { QVariantMap _r = getStationNamesList();
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 5: { QVariantMap _r = getStationIdsList();
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 6: { QVariantMap _r = getMapStationById((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 7: { QVariantList _r = getStationById((*reinterpret_cast< unsigned short int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 8: { QVariantList _r = getRoute((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])));
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 9: { QVariantList _r = getRoute((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 10: { int _r = getTimeBtwnStations((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 11: { QVector<Edge> _r = getStationEdgeList((*reinterpret_cast< unsigned short int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVector<Edge>*>(_a[0]) = _r; }  break;
        case 12: { QVariantList _r = getStations();
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 13: { QVariantList _r = getAllEdges();
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 14: { QVariantList _r = searchStations((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 15: { double _r = getXmlHeight();
            if (_a[0]) *reinterpret_cast< double*>(_a[0]) = _r; }  break;
        case 16: { double _r = getXmlWidth();
            if (_a[0]) *reinterpret_cast< double*>(_a[0]) = _r; }  break;
        case 17: { double _r = getXmlFontSize();
            if (_a[0]) *reinterpret_cast< double*>(_a[0]) = _r; }  break;
        case 18: { int _r = getStationIdByName((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 19: { int _r = isTransition((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 20: { QVariantMap _r = getEdge((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 21: { QVariantMap _r = getCircle((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 22: { QString _r = getMapDir();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 23: { QString _r = getMapPastelDir();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        default: ;
        }
        _id -= 24;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
