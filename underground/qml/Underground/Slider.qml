import QtQuick 1.0
import "drawStationAndRoutes.js" as StationMap

Item {
    id: slider; width: parent.width/480*400; height: 50
    property real value: 0.1
    property real value2: 1

    property real maximum: 4
    property real minimum: 1
    property int xMax: width - handle.width - 4

    property bool forceHandleXChange: false



    onXMaxChanged: updatePos();
    onMinimumChanged: updatePos();
    onValue2Changed: updatePos();

    onValueChanged: {
        mainWidget.scale = 1 + value/2;
    }


    function updatePos() {

        if(value2 > maximum)
            value2 = maximum
        if(value2 < minimum)
            value2 = minimum

        if (forceHandleXChange)
            handle.x = (value2 - minimum) * slider.xMax / (maximum - minimum)

        map.contentX = ((map.contentX + map.width/2)*(1 + (value2 -1)/2)/((1 + (value)/2))) - map.width/2
        map.contentY = ((map.contentY + map.height/2)*(1 + (value2 -1)/2)/((1 + (value)/2))) - map.height/2
        if(map.contentX < 0){
            map.contentX = 0
        }
        if(map.contentY < 0){
            map.contentY = 0
        }

        value = value2-1
    }

    Rectangle {
        smooth: true
        anchors.fill: parent
        radius: 12
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#66387680" }
            GradientStop { position: 1.0; color: "#6600005f" }
        }
    }

    Rectangle {
        id: handle;
        border.color: "#436EEE"; border.width: 2;
        onXChanged: {
            if ((!fastDisabled)&&(!forceHandleXChange)) {
                mainWidget.fast = true;
                value2 = (maximum - minimum) * (handle.x-2) / slider.xMax + minimum;
            }
        }

        x:2; y: 2; width: 70; height: slider.height-4; radius: 12
        gradient: Gradient{
            GradientStop { position: 1.0; color: "#27408B" }
            GradientStop { position: 0.0; color: "#4876FF" }
        }
        Image {
            smooth: true
            source: "Icons/searchtool.svg"
            width: parent.width; height: parent.height
            //y: textWindow.height/2
            fillMode: Image.PreserveAspectFit
            visible: true
        }

        MouseArea {
            id: mouse
            anchors.fill: parent; drag.target: parent
            drag.axis: Drag.XAxis; drag.minimumX: 2; drag.maximumX: slider.xMax+2
            onReleased: {
                mainWidget.fast = false;
                //console.log("onReleased")
                /*value2 = (maximum - minimum) * (handle.x-2) / slider.xMax + minimum;
                mainWidget.scale = 1 + (value2-1)/2
                */
                mainWidget.scale = mainWidget.scale
            }
            enabled: {return !map.moving}
        }
        MouseArea {
            anchors.fill: parent
            enabled: {return !mouse.enabled}
        }
    }
    function reset(){
        handle.x = 2
    }

    function mouseOff(){
        //console.log("modality off")
        mouse.enabled = false
    }

    function mouseOn(){
        //console.log("modality on")
        mouse.enabled = true
    }

}
