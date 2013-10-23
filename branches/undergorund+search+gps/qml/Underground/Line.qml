import QtQuick 1.0;
import CustomComponents 1.0;
Line {
    color: "black";
    penWidth: 1;
    property double oldX1;
    property double orPen;
    property double oldX2;
    property double oldY1;
    property double oldY2;

    property real zoom: map.sourceSizeWidth/main.width

    opacity: map.opacity



    onZoomChanged: {
        x1 = oldX1 * zoom;
        y1 = oldY1 * zoom;
        x2 = oldX2 * zoom;
        y2 = oldY2 * zoom;
        penWidth = orPen * zoom;
    }

}
