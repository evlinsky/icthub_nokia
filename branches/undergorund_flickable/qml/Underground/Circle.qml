import QtQuick 1.0


Rectangle {
    width:5;
    height:5;
    radius:5;
    z:2;
    property int xold;
    property int yold;
    property int oldsize;
    property real zoom: map.paintedWidth/main.width


    gradient: Gradient{
        GradientStop { position: 1.0; color: "black" }
        GradientStop { position: 0.5; color: "gray" }
        GradientStop { position: 0.0; color: "black" }
    }



    Timer {
        id: timer
        running: false; repeat: false
        onTriggered: anim.start();
    }

    SequentialAnimation on opacity{
        id:anim;
        running: false;
        loops: Animation.Infinite;
        NumberAnimation { from: 0; to:1 ; duration: 2000}
        NumberAnimation { from: 1; to:0 ; duration: 2000}
    }


    onZoomChanged: {
        x = xold * zoom - oldsize*zoom/2;
        y = yold * zoom - oldsize*zoom/2;
        height = width = radius = oldsize * zoom;
    }
    function start(timeOut){
        timer.interval = timeOut
        timer.start()
    }
    function stop(){
        anim.stop();
    }
}
