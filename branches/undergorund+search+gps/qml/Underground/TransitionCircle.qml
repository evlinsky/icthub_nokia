import QtQuick 1.0


Rectangle {
    //smooth: false;
    width:5;
    height:5;
    radius:5;
    z:2;

    property color stationColor1
    property color stationColor2

    gradient: Gradient{
        GradientStop { position: 1.0; color: stationColor1 }
        GradientStop { position: 0.5; color: "transparent" }
        GradientStop { position: 0.0; color: stationColor2 }
    }



    property int xold;
    property int yold;
    property int oldsize;
    property int bordWidth : 4;
    property bool rotate: true;



    function start(timeOut){
        timer.interval = timeOut
        timer.start()
    }
    function stop(){
        //anim.stop();
    }

    Timer {
        id: timer
        running: false; repeat: false
    }
    property real zoom: map.sourceSizeWidth/loader0.width
    onZoomChanged: {
        x = xold * zoom - oldsize*zoom/2;
        y = yold * zoom - oldsize*zoom/2;
        height = width = radius = oldsize * zoom;
    }
}
