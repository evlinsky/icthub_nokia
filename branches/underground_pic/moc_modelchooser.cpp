/****************************************************************************
** Meta object code from reading C++ file 'modelchooser.h'
**
** Created: Sat Sep 10 00:27:45 2011
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "modelchooser.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'modelchooser.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ModelChooser[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
      28,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: signature, parameters, type, tag, flags
      18,   13,   14,   13, 0x02,
      32,   13,   14,   13, 0x02,
      59,   13,   52,   13, 0x02,
      85,   81,   69,   13, 0x02,
     119,   81,   69,   13, 0x02,
     146,   13,   69,   13, 0x02,
     168,   13,   69,   13, 0x02,
     192,  188,   69,   13, 0x02,
     228,  188,  215,   13, 0x02,
     301,  263,  215,   13, 0x02,
     353,  323,  215,   13, 0x22,
     371,   13,  215,   13, 0x02,
     394,  386,   14,   13, 0x02,
     437,  188,  423,   13, 0x02,
     476,   13,  215,   13, 0x02,
     490,   13,  215,   13, 0x02,
     510,  504,  215,   13, 0x02,
     546,  534,   14,   13, 0x02,
     574,   13,   13,   13, 0x02,
     594,   13,  586,   13, 0x02,
     606,   13,  586,   13, 0x02,
     633,  624,   13,   13, 0x02,
     646,   13,   52,   13, 0x02,
     661,   13,   52,   13, 0x02,
     675,  386,   69,   13, 0x02,
     695,  692,   69,   13, 0x02,
     710,   13,   52,   13, 0x02,
     723,  188,   14,   13, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_ModelChooser[] = {
    "ModelChooser\0\0int\0getQuantity()\0"
    "getSearchQuantity()\0double\0getFont()\0"
    "QVariantMap\0x,y\0getNearestClickedStation(int,int)\0"
    "getClickedStation(int,int)\0"
    "getStationNamesList()\0getStationIdsList()\0"
    "_id\0getMapStationById(int)\0QVariantList\0"
    "getStationById(unsigned short int)\0"
    "_StartPositonId,_EndPositonId,legCost\0"
    "getRoute(int,int,int)\0"
    "_StartPositonId,_EndPositonId\0"
    "getRoute(int,int)\0getRoutesNum()\0"
    "id1,id2\0getTimeBtwnStations(int,int)\0"
    "QVector<Edge>\0getStationEdgeList(unsigned short int)\0"
    "getStations()\0getAllEdges()\0input\0"
    "searchStations(QString)\0stationName\0"
    "getStationIdByName(QString)\0reloadMap()\0"
    "QString\0getMapDir()\0getMapPastelDir()\0"
    "newState\0setCity(int)\0getXmlHeight()\0"
    "getXmlWidth()\0getEdge(int,int)\0id\0"
    "getCircle(int)\0getLinePen()\0"
    "isTransition(int)\0"
};

const QMetaObject ModelChooser::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_ModelChooser,
      qt_meta_data_ModelChooser, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ModelChooser::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ModelChooser::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ModelChooser::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ModelChooser))
        return static_cast<void*>(const_cast< ModelChooser*>(this));
    return QObject::qt_metacast(_clname);
}

int ModelChooser::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
        case 2: { double _r = getFont();
            if (_a[0]) *reinterpret_cast< double*>(_a[0]) = _r; }  break;
        case 3: { QVariantMap _r = getNearestClickedStation((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 4: { QVariantMap _r = getClickedStation((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 5: { QVariantMap _r = getStationNamesList();
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 6: { QVariantMap _r = getStationIdsList();
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 7: { QVariantMap _r = getMapStationById((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 8: { QVariantList _r = getStationById((*reinterpret_cast< unsigned short int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 9: { QVariantList _r = getRoute((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])));
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 10: { QVariantList _r = getRoute((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 11: { QVariantList _r = getRoutesNum();
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 12: { int _r = getTimeBtwnStations((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 13: { QVector<Edge> _r = getStationEdgeList((*reinterpret_cast< unsigned short int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVector<Edge>*>(_a[0]) = _r; }  break;
        case 14: { QVariantList _r = getStations();
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 15: { QVariantList _r = getAllEdges();
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 16: { QVariantList _r = searchStations((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 17: { int _r = getStationIdByName((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 18: reloadMap(); break;
        case 19: { QString _r = getMapDir();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 20: { QString _r = getMapPastelDir();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 21: setCity((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 22: { double _r = getXmlHeight();
            if (_a[0]) *reinterpret_cast< double*>(_a[0]) = _r; }  break;
        case 23: { double _r = getXmlWidth();
            if (_a[0]) *reinterpret_cast< double*>(_a[0]) = _r; }  break;
        case 24: { QVariantMap _r = getEdge((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 25: { QVariantMap _r = getCircle((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 26: { double _r = getLinePen();
            if (_a[0]) *reinterpret_cast< double*>(_a[0]) = _r; }  break;
        case 27: { int _r = isTransition((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        default: ;
        }
        _id -= 28;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
