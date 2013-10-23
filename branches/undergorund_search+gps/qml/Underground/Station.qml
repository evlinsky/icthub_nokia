import QtQuick 1.0
import "viewMap.js" as ViewScripts

MouseArea {
    property real originalX: 0
    property real originalY: 0
    property real originalWidth: 0
    property real originalHeight: 0
    property real originalFont: 0
    property real originalLetterSpacing: -1
    property string fullName
    property string name
    property color stationColor
    property color textColor
    property real textFont: originalFont * zoom
    property real letterSpacing: originalLetterSpacing * zoom
    property real halign
    property real valign
    property int _id

    property real zoom: mapImage.paintedWidth/main.width

    x: originalX * zoom
    y: originalY * zoom
    width: originalWidth * zoom
    height: originalHeight * zoom

    enabled: false

    onDoubleClicked: {
        ViewScripts.reloadMap()
    }

//    onClicked: {
//        cityChooser.hide()
//        ////console.log("X:Y - " + x + ":" + y)

//        dirChooser.show(x, y,fullName, stationColor)
//    }
    //drag.target: map

    //onReleased: map.dragMap();
//    Rectangle{
//        anchors.fill: parent
//        color: textColor
//        opacity: 0.5
//    }

    /*Text {
          FontLoader { id: fixedFont; name: "Arial"}
        anchors.fill: parent
        color: textColor
        text: name
        font.pixelSize: textFont
        font.letterSpacing: letterSpacing
        horizontalAlignment: halign
        verticalAlignment: valign
        wrapMode: Text.WordWrap
        font.weight: Font.Light
        font.family: fixedFont.name
        //font.underline: underline

    }*/
}
