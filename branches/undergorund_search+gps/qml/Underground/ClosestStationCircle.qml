import QtQuick 1.0

Rectangle {
    property real originalX: 0
    property real originalY: 0

    property real zoom: map.sourceSizeWidth/loader0.width

    x: originalX * zoom
    y: originalY * zoom

    width: 30 * zoom
    height: 30 * zoom
    radius: 15 * zoom
    color: "blue"
    opacity: 0.5
    z:20
}
