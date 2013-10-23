import QtQuick 1.0
import "drawStationAndRoutes.js" as StationMap

Item {
    id: slider; width: parent.width/480*400; height: 50
    property real value: 0.1
    property real value2: 1

    property real maximum: 4
    property real minimum: 1
    property int xMax: width - handle.width - 4



    onXMaxChanged: updatePos();
    onMinimumChanged: updatePos();
    onValue2Changed: updatePos();


    /*Behavior on value {
        NumberAnimation { duration: 500
            onRunningChanged: {
                if (!running)
                    map.animationEnabled=true
                if (running)
                    map.animationEnabled=false
                if ((!running)&&(map.changing))
                    StationMap.changeXYToWay();
            }
        }
        onEnabledChanged: {
            if(enabled == false){
                handle.x = (width-handle.width)*value/4 + 2;
            }
        }
    }*/



    function updatePos() {

        if(value2 > maximum)
            value2 = maximum
        if(value2 < minimum)
            value2 = minimum

       // handle.x = (value2 - minimum)*slider.xMax/(maximum - minimum) + 2   ;
        /*if (value2<=2)
        {
            handle.x = 2;
            value = 0;
        }
        if ((value2>2)&(value2<=3))
        {
            handle.x = (width-handle.width)/2;
            value = 1;
        }
        if (value2>3)
        {
            handle.x = (width-handle.width);
            value = 2;
        }*/
        //        if ((value2>4)&(value2<=5))
        //        {
        //            handle.x = (width-handle.width)/4*3+2;
        //            value = 3;
        //        }
        //        if (value2>4)
        //        {
        //            handle.x=(width-handle.width)+2;
        //            value = 3;
        //        }
        /*if (value2<1.1)
            value2=1.1*/
        //console.log("map.width: "+map.width + " map.height: " + map.height)
        //console.log("value: "+value + " value2: " + value2)
        //console.log("map: "+map.contentX + " " + map.contentY)
        map.contentX = ((map.contentX + map.width/2)*(1 + (value2 -1)/2)/((1 + (value)/2))) - map.width/2
        map.contentY = ((map.contentY + map.height/2)*(1 + (value2 -1)/2)/((1 + (value)/2))) - map.height/2
        if(map.contentX < 0){
            map.contentX = 0
        }
        if(map.contentY < 0){
            map.contentY = 0
        }

        //console.log("map: "+map.contentX + " " + map.contentY)

        value = value2-1
        //console.log("Slider mainWidget.scale:"+mainWidget.scale)

        //console.log(value2)
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
                //console.log("zoom")
                value2 = (maximum - minimum) * (handle.x-2) / slider.xMax + minimum; }
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
