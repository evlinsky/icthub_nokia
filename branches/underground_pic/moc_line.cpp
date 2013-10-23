/****************************************************************************
** Meta object code from reading C++ file 'line.h'
**
** Created: Sat Sep 10 00:27:47 2011
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "line.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'line.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Line[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       6,   44, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       6,       // signalCount

 // signals: signature, parameters, type, tag, flags
       6,    5,    5,    5, 0x05,
      18,    5,    5,    5, 0x05,
      30,    5,    5,    5, 0x05,
      42,    5,    5,    5, 0x05,
      54,    5,    5,    5, 0x05,
      69,    5,    5,    5, 0x05,

 // properties: name, type, flags
      91,   87, 0x02495103,
      94,   87, 0x02495103,
      97,   87, 0x02495103,
     100,   87, 0x02495103,
     110,  103, 0x43495103,
     116,   87, 0x02495103,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,
       4,
       5,

       0        // eod
};

static const char qt_meta_stringdata_Line[] = {
    "Line\0\0x1Changed()\0y1Changed()\0x2Changed()\0"
    "y2Changed()\0colorChanged()\0penWidthChanged()\0"
    "int\0x1\0y1\0x2\0y2\0QColor\0color\0penWidth\0"
};

const QMetaObject Line::staticMetaObject = {
    { &QDeclarativeItem::staticMetaObject, qt_meta_stringdata_Line,
      qt_meta_data_Line, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Line::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Line::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Line::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Line))
        return static_cast<void*>(const_cast< Line*>(this));
    return QDeclarativeItem::qt_metacast(_clname);
}

int Line::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDeclarativeItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: x1Changed(); break;
        case 1: y1Changed(); break;
        case 2: x2Changed(); break;
        case 3: y2Changed(); break;
        case 4: colorChanged(); break;
        case 5: penWidthChanged(); break;
        default: ;
        }
        _id -= 6;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = x1(); break;
        case 1: *reinterpret_cast< int*>(_v) = y1(); break;
        case 2: *reinterpret_cast< int*>(_v) = x2(); break;
        case 3: *reinterpret_cast< int*>(_v) = y2(); break;
        case 4: *reinterpret_cast< QColor*>(_v) = color(); break;
        case 5: *reinterpret_cast< int*>(_v) = penWidth(); break;
        }
        _id -= 6;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setX1(*reinterpret_cast< int*>(_v)); break;
        case 1: setY1(*reinterpret_cast< int*>(_v)); break;
        case 2: setX2(*reinterpret_cast< int*>(_v)); break;
        case 3: setY2(*reinterpret_cast< int*>(_v)); break;
        case 4: setColor(*reinterpret_cast< QColor*>(_v)); break;
        case 5: setPenWidth(*reinterpret_cast< int*>(_v)); break;
        }
        _id -= 6;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 6;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void Line::x1Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void Line::y1Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void Line::x2Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}

// SIGNAL 3
void Line::y2Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 3, 0);
}

// SIGNAL 4
void Line::colorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, 0);
}

// SIGNAL 5
void Line::penWidthChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, 0);
}
QT_END_MOC_NAMESPACE
