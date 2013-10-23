import Qt 4.7
import QtMultimediaKit 1.1
import "view.js" as View

Rectangle {
    id: screen;    focus: true
    width: 640;    height: 360
    color: "lightgrey"

//  Component.onCompleted: View.startGame( "game A" );

    Rectangle{
            id: background            
            opacity:  1
            width: parent.width ; height: parent.height
            anchors { horizontalCenter: parent.horizontalCenter; verticalCenter: parent.verticalCenter }
            Image { id: bckgr; source: "img/background.png" }


            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    ( stateContainer.state == "fullscreen" ) ? stateContainer.state = "emulator" : stateContainer.state = "fullscreen";
                    View.setMode( stateContainer.state );
                }
            }

        }

    Rectangle{ id: button1; x: 5; y: 199; width: 75; height: 80; color:  "transparent"
            MouseArea { anchors.fill: parent; onClicked: View.onButtonPressed( 1 ); }
    }

    Rectangle{ id: button3; x: 5; y: 280; width: 75; height: 80; color:  "transparent"
            MouseArea { anchors.fill: parent; onClicked: View.onButtonPressed( 3 ); }
    }

    Rectangle{ id: button2; x: 560; y: 199; width: 75; height: 80; color:  "transparent"
            MouseArea { anchors.fill: parent; onClicked: View.onButtonPressed( 2 ); }
    }

    Rectangle{ id: button4; x: 560; y: 280; width: 75; height: 80; color:  "transparent"
            MouseArea { anchors.fill: parent; onClicked: View.onButtonPressed( 4 ); }
    }

    Rectangle{ id: bGameA;  x: 565; y: 20; width: 65; height: 40; color:  "transparent"
            MouseArea { anchors.fill: parent; onClicked: View.startGame( "game A" ); }
    }

    Rectangle{ id: bGameB; x: 565; y: 65;  width: 65; height: 40; color:  "transparent"
            MouseArea { anchors.fill: parent; onClicked: View.startGame( "game B" ); }
    }

    Rectangle{ id: bQuit; x: 565; y: 110;  width: 65; height: 40; color:  "transparent"
            MouseArea { anchors.fill: parent; onClicked: Qt.quit( ); }
    }

    Rectangle{ id: bPause; x: 10; y: 20; width: 65; height: 40; color:  "transparent"
            MouseArea { anchors.fill: parent; onClicked: View.gamePause( ); }
    }

    Rectangle{ id: bSound; x: 10; y: 65; width: 65; height: 40; color:  "transparent"
            MouseArea { anchors.fill: parent; onClicked: View.changeSoundMode( ); }
    }

    Image { id: leftPlayer; opacity: 0;  x: 245; y: 148; source: "img/emulator/left_wolf.png"  }
    Image { id: rightPlayer; opacity: 0; x: 316; y: 156; source: "img/emulator/right_wolf.png" }

    Image { id: gameAlabel; opacity: 0; x: 120; y: 298; source: "img/emulator/gameA.png" }
    Image { id: gameBlabel; opacity: 0; x: 470; y: 298; source: "img/emulator/gameB.png" }

    // Baskets
    Image { id: luBasket; opacity: 0;   x: 200; y: 148; source: "img/emulator/left_wolf_upper_hand.png" }
    Image { id: ldBasket; opacity: 0;   x: 195; y: 214; source: "img/emulator/left_wolf_lower_hand.png" }
    Image { id: ruBasket; opacity: 0;   x: 383; y: 160; source: "img/emulator/right_wolf_upper_hand.png" }
    Image { id: rdBasket; opacity: 0;   x: 375; y: 219; source: "img/emulator/right_wolf_lower_hand.png" }

    // Feeder0
    Image { id: f0Pos1; opacity: 0;  x: 131; y: 121; source: "img/emulator/feeder/egg1_1.png" }
    Image { id: f0Pos2; opacity: 0;  x: 146; y: 130; source: "img/emulator/feeder/egg1_2.png" }
    Image { id: f0Pos3; opacity: 0;  x: 160; y: 141; source: "img/emulator/feeder/egg1_3.png" }
    Image { id: f0Pos4; opacity: 0;  x: 177; y: 150; source: "img/emulator/feeder/egg1_4.png" }
    Image { id: f0Pos5; opacity: 0;  x: 192; y: 163; source: "img/emulator/feeder/egg1_5.png" }

    // Feeder1
    Image { id: f1Pos1; opacity: 0;  x: 494; y: 122; source: "img/emulator/feeder/egg3_1.png" }
    Image { id: f1Pos2; opacity: 0;  x: 480; y: 129; source: "img/emulator/feeder/egg3_2.png" }
    Image { id: f1Pos3; opacity: 0;  x: 463; y: 141; source: "img/emulator/feeder/egg3_3.png" }
    Image { id: f1Pos4; opacity: 0;  x: 445; y: 153; source: "img/emulator/feeder/egg3_4.png" }
    Image { id: f1Pos5; opacity: 0;  x: 431; y: 163; source: "img/emulator/feeder/egg3_5.png" }

    // Feeder2
    Image { id: f2Pos1; opacity: 0; x: 127; y: 188; source: "img/emulator/feeder/egg2_1.png" }
    Image { id: f2Pos2; opacity: 0; x: 144; y: 195; source: "img/emulator/feeder/egg2_2.png" }
    Image { id: f2Pos3; opacity: 0; x: 157; y: 206; source: "img/emulator/feeder/egg2_3.png" }
    Image { id: f2Pos4; opacity: 0; x: 177; y: 216; source: "img/emulator/feeder/egg2_4.png" }
    Image { id: f2Pos5; opacity: 0; x: 193; y: 228; source: "img/emulator/feeder/egg2_5.png" }

    // Feeder3
    Image { id: f3Pos1; opacity: 0; x: 492; y: 190; source: "img/emulator/feeder/egg4_1.png" }
    Image { id: f3Pos2; opacity: 0; x: 478; y: 197; source: "img/emulator/feeder/egg4_2.png" }
    Image { id: f3Pos3; opacity: 0; x: 461; y: 206; source: "img/emulator/feeder/egg4_3.png" }
    Image { id: f3Pos4; opacity: 0; x: 443; y: 219; source: "img/emulator/feeder/egg4_4.png" }
    Image { id: f3Pos5; opacity: 0; x: 431; y: 228; source: "img/emulator/feeder/egg4_5.png" }

    // hare
    Image { id: hare; opacity: 0;   x: 165; y: 43; source: "img/emulator/rabbit.png" }
    Image { id: hareLowHand; opacity: 0;   x: 220; y: 94; source: "img/emulator/rabbit_hand_lower.png" }
    Image { id: hareUppHand; opacity: 0;   x: 227; y: 51; source: "img/emulator/rabbit_hand_upper.png" }

    // crash
    Image { id: rightCrash; opacity: 0;   x: 386;  y: 275; source: "img/emulator/right_crash.png" }
    Image { id: leftCrash;  opacity: 0;   x: 177;  y: 275; source: "img/emulator/left_crash.png" }

    //chicken
    Image { id: leftChick1; opacity: 0;   x: 169;  y: 242; source: "img/emulator/chicken/little_chicken_left_1.png" }
    Image { id: leftChick2; opacity: 0;   x: 155;  y: 262; source: "img/emulator/chicken/little_chicken_left_2.png" }
    Image { id: leftChick3; opacity: 0;   x: 131;  y: 263; source: "img/emulator/chicken/little_chicken_left_3.png" }
    Image { id: leftChick4; opacity: 0;   x: 104;  y: 264; source: "img/emulator/chicken/little_chicken_left_4.png" }
    Image { id: rightChick1; opacity: 0;  x: 441;  y: 243; source: "img/emulator/chicken/little_chicken_right_1.png" }
    Image { id: rightChick2; opacity: 0;  x: 466;  y: 266; source: "img/emulator/chicken/little_chicken_right_2.png" }
    Image { id: rightChick3; opacity: 0;  x: 487;  y: 268; source: "img/emulator/chicken/little_chicken_right_3.png" }
    Image { id: rightChick4; opacity: 0;  x: 515;  y: 267; source: "img/emulator/chicken/little_chicken_right_4.png" }

    // score
    Image { id: scoreH; opacity: 0;  x: 341;  y: 55; source: "img/emulator/h_8.png" }
    Image { id: scoreM; opacity: 0;  x: 391;  y: 55; source: "img/emulator/h_8.png" }
    Image { id: scoreL; opacity: 0;  x: 431;  y: 55; source: "img/emulator/h_8.png" }

    // penalty
    Penalty { id: lost1; opacity: 0;  x: 400;  y: 112; animationTarget: lost1 }
    Penalty { id: lost2; opacity: 0;  x: 366;  y: 112; animationTarget: lost2 }
    Penalty { id: lost3; opacity: 0;  x: 332;  y: 112; animationTarget: lost3 }


    Timer {
        id: timer
        interval: 10; running: false; repeat: true
        onTriggered: { View.onTimer( ) }
    }

    Rectangle{
        id: stateContainer
        state: "emulator"
        states: State {
                    name: "fullscreen";

                    PropertyChanges {
                        target: background;
                        rotation: 360;
                    }
                    PropertyChanges { target: bckgr; source: "img/fullScreen.png" }
                    PropertyChanges { target: gameAlabel; x: 40;  y: 335; source: "img/fullscreen/gameA.png" }
                    PropertyChanges { target: gameBlabel; x: 528; y: 335; source: "img/fullscreen/gameB.png" }

                    PropertyChanges { target: scoreH; x: 355; y: 3; source: "img/fullscreen/h_8.png" }
                    PropertyChanges { target: scoreM; x: 425; y: 3; source: "img/fullscreen/h_8.png" }
                    PropertyChanges { target: scoreL; x: 480; y: 3; source: "img/fullscreen/h_8.png" }

                    PropertyChanges { target: lost1; x: 435;  y: 77; source: "img/fullscreen/lost_chicken.png" }
                    PropertyChanges { target: lost2; x: 387;  y: 77; source: "img/fullscreen/lost_chicken.png" }
                    PropertyChanges { target: lost3; x: 339;  y: 77; source: "img/fullscreen/lost_chicken.png" }

                    PropertyChanges { target: button1; width: 135; height: 115; x: 0; y: 5 }
                    PropertyChanges { target: button2; width: 135; height: 115; x: 505; y: 5 }
                    PropertyChanges { target: button3; width: 135; height: 120; x: 0; y: 120 }
                    PropertyChanges { target: button4; width: 135; height: 120; x: 505; y: 120 }

                    PropertyChanges { target: bGameA; opacity: 0; width: 0; height: 0; }
                    PropertyChanges { target: bGameB; opacity: 0; width: 0; height: 0; }
                    PropertyChanges { target: bPause; opacity: 0; width: 0; height: 0; }
                    PropertyChanges { target: bSound; opacity: 0; width: 0; height: 0; }

                    PropertyChanges { target: hare; x: 105; y: 2; source: "img/fullscreen/rabbit.png" }
                    PropertyChanges { target: hareLowHand; x: 180; y: 63; source: "img/fullscreen/rabbit_hand_lower.png" }

                    PropertyChanges { target: leftPlayer; x: 216; y: 131; source: "img/fullscreen/left_wolf.png" }
                    PropertyChanges { target: rightPlayer; x: 317; y: 141; source: "img/fullscreen/right_wolf.png" }
                    PropertyChanges { target: luBasket; x: 154; y: 127; source: "img/fullscreen/left_wolf_upper_hand.png" }
                    PropertyChanges { target: ldBasket; x: 148; y: 219; source: "img/fullscreen/left_wolf_lower_hand.png" }
                    PropertyChanges { target: ruBasket; x: 408; y: 145; source: "img/fullscreen/right_wolf_upper_hand.png" }
                    PropertyChanges { target: rdBasket; x: 397; y: 227; source: "img/fullscreen/right_wolf_lower_hand.png" }

                    PropertyChanges { target: leftCrash;  x: 120; y: 309; source: "img/fullscreen/left_crash.png" }
                    PropertyChanges { target: rightCrash; x: 415; y: 309; source: "img/fullscreen/right_crash.png" }

                    PropertyChanges { target: f0Pos1; x: 54;  y: 90; source: "img/fullscreen/feeder/egg1_1.png" }
                    PropertyChanges { target: f0Pos2; x: 77;  y: 100; source: "img/fullscreen/feeder/egg1_2.png" }
                    PropertyChanges { target: f0Pos3; x: 97;  y: 118; source: "img/fullscreen/feeder/egg1_3.png" }
                    PropertyChanges { target: f0Pos4; x: 119; y: 130; source: "img/fullscreen/feeder/egg1_4.png" }
                    PropertyChanges { target: f0Pos5; x: 140; y: 147; source: "img/fullscreen/feeder/egg1_5.png" }

                    PropertyChanges { target: f1Pos1; x: 565; y: 91; source: "img/fullscreen/feeder/egg3_1.png" }
                    PropertyChanges { target: f1Pos2; x: 544; y: 100; source: "img/fullscreen/feeder/egg3_2.png" }
                    PropertyChanges { target: f1Pos3; x: 519; y: 115; source: "img/fullscreen/feeder/egg3_3.png" }
                    PropertyChanges { target: f1Pos4; x: 497; y: 134; source: "img/fullscreen/feeder/egg3_4.png" }
                    PropertyChanges { target: f1Pos5; x: 478; y: 148; source: "img/fullscreen/feeder/egg3_5.png" }

                    PropertyChanges { target: f2Pos1; x: 52; y: 182;  source: "img/fullscreen/feeder/egg2_1.png" }
                    PropertyChanges { target: f2Pos2; x: 75; y: 194;  source: "img/fullscreen/feeder/egg2_2.png" }
                    PropertyChanges { target: f2Pos3; x: 94; y: 211;  source: "img/fullscreen/feeder/egg2_3.png" }
                    PropertyChanges { target: f2Pos4; x: 120; y: 222; source: "img/fullscreen/feeder/egg2_4.png" }
                    PropertyChanges { target: f2Pos5; x: 142; y: 238; source: "img/fullscreen/feeder/egg2_5.png" }

                    PropertyChanges { target: f3Pos1; x: 564; y: 184; source: "img/fullscreen/feeder/egg4_1.png" }
                    PropertyChanges { target: f3Pos2; x: 542; y: 195; source: "img/fullscreen/feeder/egg4_2.png" }
                    PropertyChanges { target: f3Pos3; x: 519; y: 209; source: "img/fullscreen/feeder/egg4_3.png" }
                    PropertyChanges { target: f3Pos4; x: 495; y: 227; source: "img/fullscreen/feeder/egg4_4.png" }
                    PropertyChanges { target: f3Pos5; x: 475; y: 241; source: "img/fullscreen/feeder/egg4_5.png" }

                    PropertyChanges { target: leftChick1;  x: 107;  y: 255; source: "img/fullscreen/chicken/little_chicken_left_1.png" }
                    PropertyChanges { target: leftChick2;  x: 89;   y: 290; source: "img/fullscreen/chicken/little_chicken_left_2.png" }
                    PropertyChanges { target: leftChick3;  x: 57;   y: 289; source: "img/fullscreen/chicken/little_chicken_left_3.png" }
                    PropertyChanges { target: leftChick4;  x: 18;   y: 291; source: "img/fullscreen/chicken/little_chicken_left_4.png" }
                    PropertyChanges { target: rightChick1; x: 492;  y: 261; source: "img/fullscreen/chicken/little_chicken_right_1.png" }
                    PropertyChanges { target: rightChick2; x: 526;  y: 293; source: "img/fullscreen/chicken/little_chicken_right_2.png" }
                    PropertyChanges { target: rightChick3; x: 556;  y: 295; source: "img/fullscreen/chicken/little_chicken_right_3.png" }
                    PropertyChanges { target: rightChick4; x: 595;  y: 293; source: "img/fullscreen/chicken/little_chicken_right_4.png" }
                }
                State {
                    name: "emulator"
                    PropertyChanges { target: background; anchors { horizontalCenter: parent.horizontalCenter; verticalCenter: parent.verticalCenter; }
                    }
                }

        transitions: Transition {
                        from: "emulator"; to: "fullscreen"; reversible: true
                        ParallelAnimation {
                        NumberAnimation { properties: "y,rotation"; duration: 500; easing.type: Easing.InOutQuad }
                        }
                     }
    }

    Audio { id: beepSound1; source: "wav/beep1.wav";   muted: false; volume: 0.4 }
    Audio { id: beepSound2; source: "wav/beep2.wav";   muted: false; volume: 0.4 }
    Audio { id: beepSound3; source: "wav/beep3.wav";   muted: false; volume: 0.4 }
    Audio { id: beepSound4; source: "wav/beep4.wav";   muted: false; volume: 0.4 }
    Audio { id: catchSound; source: "wav/catch.wav";   muted: false; volume: 0.5 }
    Audio { id: crashSoundp; source: "wav/beep11.wav"; muted: false; volume: 0.4 }
}


