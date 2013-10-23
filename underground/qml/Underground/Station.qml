import QtQuick 1.0
import "viewMap.js" as ViewScripts

Item {
    property real originalX: 0
    property real originalY: 0
    property double originalWidth: 0
    property double originalHeight: 0
    property real originalFont: 0
    property real originalLetterSpacing: -1
    property string fullName
    property string name
    property color stationColor
    property color textColor
    property real textFont
    property real letterSpacing
    property real halign
    property real valign
    property int _id

    property double zoom

    //x: originalX * zoom
    //y: originalY * zoom
    //width: originalWidth * zoom
    //eight: originalHeight * zoom

    function update(){
        zoom = mainWidget.zoom
        x = originalX * zoom
        y = originalY * zoom
        width = originalWidth * zoom
        height = originalHeight * zoom
        textFont = originalFont * zoom
        letterSpacing = originalLetterSpacing * zoom
        opacity = mainWidget.opacity
        _text.font.pixelSize = textFont
        _text.font.letterSpacing = letterSpacing
        _text.color = textColor
         _text.font.family =  fixedFont.name
    }

    /*onZoomChanged: {
        x = originalX * zoom
        y = originalY * zoom
        width = originalWidth * zoom
        height = originalHeight * zoom
        textFont = originalFont * zoom
        letterSpacing = originalLetterSpacing * zoom
    }*/

    /*onDoubleClicked: {
        ViewScripts.reloadMap()
    }

    onClicked: {
        cityChooser.hide()
        dirChooser.show(x, y,fullName, stationColor)
    }*/
    //drag.target: mapz

    //onReleased: map.dragMap();
    /*Rectangle{
        anchors.fill: parent
        color: textColor
        opacity: 0.5
    }*/

    FontLoader { id: fixedFont; name: "Arial"}

    Text {

        id: _text
        anchors.fill: parent

        text: name

        horizontalAlignment: halign
        verticalAlignment: valign
        wrapMode: Text.WordWrap
        font.weight: Font.Normal


        //font.underline: underline

    }
}
