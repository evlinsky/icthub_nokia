/****************************************************************************
** Meta object code from reading C++ file 'model.h'
**
** Created: Mon 11. Jul 15:39:10 2011
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../model.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'model.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Model[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
      19,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: signature, parameters, type, tag, flags
      11,    6,    7,    6, 0x02,
      25,    6,    7,    6, 0x02,
      57,    6,   45,    6, 0x02,
      79,    6,   45,    6, 0x02,
     103,   99,   45,    6, 0x02,
     139,   99,  126,    6, 0x02,
     204,  174,  126,    6, 0x02,
     230,  222,    7,    6, 0x02,
     273,   99,  259,    6, 0x02,
     312,    6,  126,    6, 0x02,
     326,    6,  126,    6, 0x02,
     346,  340,  126,    6, 0x02,
     377,    6,  370,    6, 0x02,
     392,    6,  370,    6, 0x02,
     406,    6,    7,    6, 0x02,
     435,  423,    7,    6, 0x02,
     463,   99,    7,    6, 0x02,
     481,  222,   45,    6, 0x02,
     506,    6,  498,    6, 0x02,

       0        // eod
};

static const char qt_meta_stringdata_Model[] = {
    "Model\0\0int\0getQuantity()\0getSearchQuantity()\0"
    "QVariantMap\0getStationNamesList()\0"
    "getStationIdsList()\0_id\0getMapStationById(int)\0"
    "QVariantList\0getStationById(unsigned short int)\0"
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
    "QString\0getMapDir()\0"
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
        case 2: { QVariantMap _r = getStationNamesList();
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 3: { QVariantMap _r = getStationIdsList();
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 4: { QVariantMap _r = getMapStationById((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 5: { QVariantList _r = getStationById((*reinterpret_cast< unsigned short int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 6: { QVariantList _r = getRoute((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 7: { int _r = getTimeBtwnStations((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 8: { QVector<Edge> _r = getStationEdgeList((*reinterpret_cast< unsigned short int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVector<Edge>*>(_a[0]) = _r; }  break;
        case 9: { QVariantList _r = getStations();
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 10: { QVariantList _r = getAllEdges();
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 11: { QVariantList _r = searchStations((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = _r; }  break;
        case 12: { double _r = getXmlHeight();
            if (_a[0]) *reinterpret_cast< double*>(_a[0]) = _r; }  break;
        case 13: { double _r = getXmlWidth();
            if (_a[0]) *reinterpret_cast< double*>(_a[0]) = _r; }  break;
        case 14: { int _r = getXmlFontSize();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 15: { int _r = getStationIdByName((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 16: { int _r = isTransition((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 17: { QVariantMap _r = getEdge((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 18: { QString _r = getMapDir();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        default: ;
        }
        _id -= 19;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
