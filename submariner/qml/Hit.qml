import QtQuick 1.0

Rectangle {
    property int explosX
    property int explosY

    function switchHitOn( XPos , YPos ){
        state = "enabled";
        explosX = XPos; explosY = YPos;
    }

    function switchHitOff( ){
        state = "disabled";
    }

    width: parent.width;    height: parent.width
    color: "black"
    opacity:  0

    Image {
        id: explos;
        opacity: 0
        x: explosX; y: explosY;
        source: "img/hit.png"
    }

    states: State {
        name: "enabled";
        PropertyChanges { target: explos.parent; opacity: 0.7 }
        PropertyChanges { target: explos; opacity: 1 }
    }
    State {
            name: "disabled";
            PropertyChanges { target: explos.parent; opacity: 0 }
            PropertyChanges { target: explos; opacity: 0 }
    }
}
