import QtQuick 1.0


Rectangle {
    width:5;
    height:5;
    radius:5;
    z:2;
    property double xold;
    property double yold;
    property double oldsize;
    property real zoom: map.sourceSizeWidth/main.width
    property color oldColor;

    /*Rectangle{
        property real zoom:parent.zoom
        color: "white"
        z: -1
        property int oldsize: parent.oldsize + 10
        property int xold:parent.xold;
        property int yold:parent.yold;



        Component.onCompleted:{
            width = oldsize * zoom
            height = oldsize * zoom
            radius = oldsize * zoom
            x  =  - oldsize*zoom/2;
            y  =  - oldsize*zoom/2;
            //console.log("X:Y" + x + ":" + y)

        }

        onZoomChanged: {
            //x =  + oldsize*zoom/2;
            //y =  + oldsize*zoom/2;
            height = width = radius = oldsize * zoom;
            //console.log("X:Y" + x + ":" + y)
        }
    }*/


    gradient: Gradient{
        GradientStop { position: 1.0; color: Qt.darker(oldColor) }
        GradientStop { position: 0.5; color: oldColor}
        GradientStop { position: 0.0; color: Qt.darker(oldColor) }
    }



    Timer {
        id: timer
        running: false; repeat: false
        onTriggered: anim.start();
    }



    onZoomChanged: {
        x = xold * zoom - oldsize*zoom/2;
        y = yold * zoom - oldsize*zoom/2;
        height = width = radius = oldsize * zoom;
    }
}
