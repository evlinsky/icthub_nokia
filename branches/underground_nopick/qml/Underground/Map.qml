import QtQuick 1.0
//import CustomComponents 1.0

Rectangle {
    id: map

    //source: "Icons/spb.svg"
    //width: 500; height: 621
    width: parent.width; height: parent.height
    //fillMode: Image.PreserveAspectFit
    visible: true
    smooth: true
    property int paintedWidth: 500
    property int paintedHeight: 621


    //asynchronous: true

    property int newX: 0
    property int newY: 0
    property int tempX: 0
    property int tempY: 0
    property int tempX1: 0
    property int tempX2: 0
    property int tempY1: 0
    property int tempY2: 0
    property bool changing: false
    property bool animationEnabled: false



    function setX(){
        newX = 0;
    }
    function setY(){
        newY = 0;
    }

    /*Behavior on x {
        enabled: animationEnabled
        NumberAnimation { duration: 500 }
    }
    Behavior on y {
        enabled: animationEnabled
        NumberAnimation { duration: 500 }
    }
    onAnimationEnabledChanged: {
        if(animationEnabled){
            timer.start();
        }
    }

    Timer {
        id: timer
        interval: 500
        running: false; repeat: false
        onTriggered: {
            animationEnabled = false
        }
    }*/



    MouseArea {
        id: mouse
        anchors.fill: parent
        drag.target: map

        onReleased: {
            dragMap();
        }

        onClicked: {
            cityChooser.hide()
            dirChooser.hide()
        }
    }

    function dragMap() {
        map.animationEnabled=true;
        if (map.x > 0)
            map.x = 0;
        if (map.x < main.width - map.width - (map.paintedWidth-map.width)/2) {
            if (map.paintedWidth>=main.width)
                map.x = main.width - map.width - (map.paintedWidth-map.width)/2;
            else
                map.x = 0;
        }
        if (map.y > (map.paintedHeight-map.height)/2+upFields.height+10) {
            if (map.paintedHeight>=main.height-upFields.height)
                map.y = (map.paintedHeight-map.height)/2+upFields.height+10;
            else
                map.y = 0;
        }
        if (map.y < main.height - map.height - (map.paintedHeight-map.height)/2 - showRouteButton.height) {
            if (map.paintedHeight>=main.height-upFields.height)
                map.y = main.height - map.height - (map.paintedHeight-map.height)/2 - showRouteButton.height;
            else
                map.y = 0;
        }
        map.animationEnabled=false;
    }

    function recount() {
        var oldWidth = map.width;
        var oldHeight = map.height
        var oldX = map.x



        map.height = main.height * (1+slider.value/2)
        map.width = main.width * (1+slider.value/2)

        if(Math.abs(map.newX - map.x) < 1)
            map.newX = 0
        if(Math.abs(map.newY - map.y) < 1)
            map.newY = 0

        if(map.newX == 0)
        {
            map.x -= (map.width - oldWidth) / 2
        }
        else
            map.x = map.newX
        if(map.newY == 0)
            map.y -= (map.height - oldHeight) / 2
        else
            map.y = map.newY

        dragMap();
    }

}
