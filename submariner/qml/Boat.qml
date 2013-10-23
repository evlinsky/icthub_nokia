import QtQuick 1.0


Rectangle{

    //id: boat
    color: "transparent"

    property alias imageToLeft: frontImage.source
    property alias imageToRight: backImage.source

    signal animationFinished

    function rotateBoat( ) {
        flip.flipped = !flip.flipped;
        }

    Flipable {
        id: flip
        property bool flipped: false

        width: front.width; height: front.height

        front: Image { id: frontImage; smooth: true }
        back: Image { id: backImage; smooth: true }

        transform: Rotation {
            id: rotation;
            origin.x: flip.width / 2; origin.y: flip.height / 2
            axis.x: 0; axis.y: 1; axis.z: 0
            angle: 0
        }

        states: State {
            name: "back"; when: flip.flipped
            PropertyChanges { target: rotation; angle: 180 }
        }

        transitions: Transition {
            SequentialAnimation{
                NumberAnimation { target: rotation; property: "angle"; duration: 2200 }
                ScriptAction { script: animationFinished( ); }
            }
        }
    }
}
