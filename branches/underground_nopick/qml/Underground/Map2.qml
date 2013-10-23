import QtQuick 1.0
//import CustomComponents 1.0

Flickable {
    id: map
    width: parent.width; height: parent.height
    property int paintedWidth: 360
    property int paintedHeight: 447
    property variant img: image
    contentWidth: image.width; contentHeight: image.height
    Image{
        id:image
        source: "Icons/spb.svg"
        //width: 500; height: 621
        //width: parent.width; height: parent.height
        //fillMode: Image.PreserveAspectFit
        visible: true
        smooth: true
        //property int paintedWidth: 447
        //property int paintedHeight: 360
    }


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





}
