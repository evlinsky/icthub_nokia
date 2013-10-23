/****************************************************************************
** Meta object code from reading C++ file 'mainwidget.h'
**
** Created: Sun Sep 11 22:59:03 2011
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "mainwidget.h"
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mainwidget.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_MainWidget[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
      14,   59, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       8,       // signalCount

 // signals: signature, parameters, type, tag, flags
      12,   11,   11,   11, 0x05,
      23,   11,   11,   11, 0x05,
      34,   11,   11,   11, 0x05,
      49,   11,   11,   11, 0x05,
      65,   11,   11,   11, 0x05,
      80,   11,   11,   11, 0x05,
      97,   11,   11,   11, 0x05,
     115,   11,   11,   11, 0x05,

 // methods: signature, parameters, type, tag, flags
     143,   11,  136,   11, 0x02,

 // properties: name, type, flags
     153,  136, 0x06495103,
     165,  159, (QMetaType::QReal << 24) | 0x00495103,
     177,  173, 0x02495103,
     179,  173, 0x02495103,
     181,  173, 0x02495103,
     187,  173, 0x02495103,
     194,  173, 0x02495103,
     203,  173, 0x02095103,
     226,  213, 0x09095103,
     235,  213, 0x09095103,
     247,  173, 0x02495103,
     259,  173, 0x02095103,
     272,  173, 0x02095103,
     281,  173, 0x02095103,

 // properties: notify_signal_id
       4,
       5,
       0,
       1,
       2,
       3,
       6,
       0,
       0,
       0,
       7,
       0,
       0,
       0,

       0        // eod
};

static const char qt_meta_stringdata_MainWidget[] = {
    "MainWidget\0\0xChanged()\0yChanged()\0"
    "widthChanged()\0heightChanged()\0"
    "scaleChanged()\0opacityChanged()\0"
    "xmlWidthChanged()\0parentWidthChanged()\0"
    "double\0getCoef()\0scale\0qreal\0opacity\0"
    "int\0x\0y\0width\0height\0xmlWidth\0xmlHeight\0"
    "QVariantList\0allEdges\0allStations\0"
    "parentWidth\0parentHeight\0penWidth\0"
    "circleSize\0"
};

const QMetaObject MainWidget::staticMetaObject = {
    { &QDeclarativeItem::staticMetaObject, qt_meta_stringdata_MainWidget,
      qt_meta_data_MainWidget, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &MainWidget::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *MainWidget::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *MainWidget::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_MainWidget))
        return static_cast<void*>(const_cast< MainWidget*>(this));
    return QDeclarativeItem::qt_metacast(_clname);
}

int MainWidget::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDeclarativeItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: xChanged(); break;
        case 1: yChanged(); break;
        case 2: widthChanged(); break;
        case 3: heightChanged(); break;
        case 4: scaleChanged(); break;
        case 5: opacityChanged(); break;
        case 6: xmlWidthChanged(); break;
        case 7: parentWidthChanged(); break;
        case 8: { double _r = getCoef();
            if (_a[0]) *reinterpret_cast< double*>(_a[0]) = _r; }  break;
        default: ;
        }
        _id -= 9;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< double*>(_v) = scale(); break;
        case 1: *reinterpret_cast< qreal*>(_v) = opacity(); break;
        case 2: *reinterpret_cast< int*>(_v) = x(); break;
        case 3: *reinterpret_cast< int*>(_v) = y(); break;
        case 4: *reinterpret_cast< int*>(_v) = width(); break;
        case 5: *reinterpret_cast< int*>(_v) = height(); break;
        case 6: *reinterpret_cast< int*>(_v) = xmlWidth(); break;
        case 7: *reinterpret_cast< int*>(_v) = xmlHeight(); break;
        case 8: *reinterpret_cast< QVariantList*>(_v) = allEdges(); break;
        case 9: *reinterpret_cast< QVariantList*>(_v) = allStations(); break;
        case 10: *reinterpret_cast< int*>(_v) = parentWidth(); break;
        case 11: *reinterpret_cast< int*>(_v) = parentHeight(); break;
        case 12: *reinterpret_cast< int*>(_v) = penWidth(); break;
        case 13: *reinterpret_cast< int*>(_v) = circleSize(); break;
        }
        _id -= 14;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setScale(*reinterpret_cast< double*>(_v)); break;
        case 1: setOpacity(*reinterpret_cast< qreal*>(_v)); break;
        case 2: setX(*reinterpret_cast< int*>(_v)); break;
        case 3: setY(*reinterpret_cast< int*>(_v)); break;
        case 4: setWidth(*reinterpret_cast< int*>(_v)); break;
        case 5: setHeight(*reinterpret_cast< int*>(_v)); break;
        case 6: setXmlWidth(*reinterpret_cast< int*>(_v)); break;
        case 7: setXmlHeight(*reinterpret_cast< int*>(_v)); break;
        case 8: setAllEdges(*reinterpret_cast< QVariantList*>(_v)); break;
        case 9: setAllStations(*reinterpret_cast< QVariantList*>(_v)); break;
        case 10: setParentWidth(*reinterpret_cast< int*>(_v)); break;
        case 11: setParentHeight(*reinterpret_cast< int*>(_v)); break;
        case 12: setPenWidth(*reinterpret_cast< int*>(_v)); break;
        case 13: setCircleSize(*reinterpret_cast< int*>(_v)); break;
        }
        _id -= 14;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 14;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 14;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 14;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 14;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 14;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 14;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void MainWidget::xChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void MainWidget::yChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void MainWidget::widthChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}

// SIGNAL 3
void MainWidget::heightChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, 0);
}

// SIGNAL 4
void MainWidget::scaleChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, 0);
}

// SIGNAL 5
void MainWidget::opacityChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, 0);
}

// SIGNAL 6
void MainWidget::xmlWidthChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, 0);
}

// SIGNAL 7
void MainWidget::parentWidthChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 7, 0);
}
QT_END_MOC_NAMESPACE
