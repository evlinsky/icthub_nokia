#ifndef APPTYPES_H
#define APPTYPES_H
#include <QString>

struct Edge
{
    unsigned short int id;
    unsigned short int value;
    unsigned short int idFrom;
    unsigned short int idTo;
    int x1;
    int y1;
    int x2;
    int y2;
    int x3;
    int y3;
    int x4;
    int y4;

    bool byLegs;
};

struct Station
{
    int id;
    QString name;
    QString fullName;
    QString color;
    int x;
    int y;
    int width;
    int height;
    int HAlign;
    int VAlign;
    int line;
    double latitude;
    double longitude;
};

#endif // APPTYPES_H
