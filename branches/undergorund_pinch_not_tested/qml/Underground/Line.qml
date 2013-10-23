import QtQuick 1.0;
import CustomComponents 1.0;
Line {
    color: "black";
    penWidth: 1;
    opacity: 0.4;
    property int oldX1;
    property int orPen;
    property int oldX2;
    property int oldY1;
    property int oldY2;

    property real zoom: map.paintedWidth/main.width



    onZoomChanged: {
        x1 = oldX1 * zoom;
        y1 = oldY1 * zoom;
        x2 = oldX2 * zoom;
        y2 = oldY2 * zoom;
        penWidth = orPen * zoom;
    }

}
