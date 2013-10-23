import QtQuick 1.0
import QtMobility.feedback 1.1
import QtMultimediaKit 1.1
import "script.js" as Script

Rectangle {
    id: screen
    width: 640; height: 360

    Component.onCompleted: { Script.initGame( ); Script.startBoat( ); }

    Timer {
            id: timer
            interval: 500; running: false; repeat: true; triggeredOnStart: false
            onTriggered: { Script.timerTriggered( ); }
    }

    Rectangle {
        id: arena
        width: background.width;    height: background.width

        Image { id: background; x: -125; source: "img/background.png" }
        Hit   { id: hit }
        Boat  { id: boat1; x: 853; y: 195; imageToLeft: "img/boat1.png"; imageToRight: "img/boat1_back.png" }
        Boat  { id: boat2; x: 853; y: 197; imageToLeft: "img/boat2.png"; imageToRight: "img/boat2_back.png" }
        Boat  { id: boat3; x: 853; y: 197; imageToLeft: "img/boat3.png"; imageToRight: "img/boat3_back.png";
                onAnimationFinished: Script.continueNavigation( )
            }

        Image { id: stage; x: -125; source: "img/stage.png" }
        Image {
            id: torpedo
            source: "img/torpedo.png"
            x: 590; y: 325
            opacity: 0

            SequentialAnimation{
                id: shot

                ParallelAnimation{
                    NumberAnimation { target: torpedo; property: "y"; from: 304; to: 243; duration: 2600; }
                    NumberAnimation { target: torpedo; property: "x"; from: torpedo.x; to: torpedo.y; duration: 2600; }
                    SequentialAnimation{
                        loops: 8
                        NumberAnimation { target: torpedo; property: "opacity"; from: 0.1; to: 0.7; duration: 163 }
                        NumberAnimation { target: torpedo; property: "opacity"; from: 0.7; to: 0.1; duration: 163 }
                    }
                }
                ScriptAction { script: Script.treatShot( ) }
            }
        }
    }

    Image { id: periscope; source: "img/periscope.png"; }
    QuitMenu { id: message; onDisabled: Script.resumeGame( ); }
    Image {
        id: quitImg; x: 120; y: 330; source: "img/quit.png";
        MouseArea{
            anchors.fill: parent
            onClicked: { Script.pauseGame( ); message.showDialog( ); }
        }
    }
    Image { id: weaponImg; height: 20; width: 40; x: 190; y: 335; source: "img/weapon.png"; }
    Image { id: scoreImg;  height: 20; width: 40; x: 340; y: 335; source: "img/score.png"; }
    Image { id: labelImg;  x: 505; y: 9; source: "img/label.png"; }

    Text { id: scoreTxt;  x: 405; y: 328; color: "yellow"; text: "" }
    Text { id: weaponTxt; x: 250; y: 328; color: "yellow"; text: "" }

    Text { id: hapticTxt; x: 5; y: 5; color: "yellow"; font.pixelSize: 20; text: "вибро" }
    MouseArea {
        id: hapticButton
        width: 55; height: 35; x: 0; y: 0;
        onClicked: { Script.hapticModeChanged( ); }
    }

    Text { id: soundTxt; x: 585; y: 5; color: "yellow"; font.pixelSize: 20; text: "звук" }
    MouseArea {
        id: soundButton
        width: 55; height: 35; x: 585; y: 0;
        onClicked: { Script.soundModeChanged( ); }
    }

    MouseArea{
        x: 0; y: 260; width: 80; height: 100
        onPressed: { rotateArena.to = 125; rotateArena.running = true }
        onReleased: rotateArena.running = false
        }
    MouseArea{
        x: 565; y: 260; width: 80; height: 100
        onPressed: { rotateArena.to = -489; rotateArena.running = true }
        onReleased: rotateArena.running = false
        }

    MouseArea{
        id: redButton
        x: 470; y: 310; width: 60; height: 50
        onPressed: {
            if ( !Script.game )
                { Script.initGame( ); Script.startBoat( ); break; }
            if (!shot.running){
                Script.setRoute(312 - arena.x);
                shot.start();
                if ( Script.hapticEnabled ) shotEffect.running = true;
                }
            }
        }

    PropertyAnimation {
        id: rotateArena
        target: arena
        properties: "x"
        duration: 1000
        }
    PropertyAnimation {
        id: moveBoat1
        target: boat1
        properties: "x"
        duration: Script.getSpeed( );
        }
    PropertyAnimation {
        id: moveBoat2
        target: boat2
        properties: "x"
        duration: Script.getSpeed( );
        }
    PropertyAnimation {
        id: moveBoat3
        target: boat3
        properties: "x"
        duration: Script.getSpeed( );
        }
    HapticsEffect{
            id: shotEffect
            attackIntensity: 0.0
            attackTime: 200
            intensity: 1.0
            duration: 100
            fadeTime: 250
            fadeIntensity: 0.0
        }
    HapticsEffect{
            id: crashEffect
            attackIntensity: 0.0
            attackTime: 200
            intensity: 1.0
            duration: 1000
            fadeTime: 250
            fadeIntensity: 0.0
        }
    SoundEffect { id: crashSound; source: "crash1.wav"  }
}

