import QtQuick 1.0

Image {

    property alias animationTarget: a.target
    property alias animationRunning: blink.running

    source: "img/emulator/lost_chicken.png";

    SequentialAnimation{
        id: blink
        loops: Animation.Infinite
        running: false

        NumberAnimation { id: a; property: "opacity"; from: 1; to: 0; duration: 5 }
        PauseAnimation  { duration: 450 }
        NumberAnimation { target: a.target; property: "opacity"; from: 0; to: 1; duration: 5 }
        PauseAnimation  { duration: 650 }
    }

}

