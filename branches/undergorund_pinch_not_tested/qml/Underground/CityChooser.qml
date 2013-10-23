import QtQuick 1.0

Rectangle {
    id: thisCityChooser
    z: 150
    opacity: 0.0
    radius: 14
    width: parent.width/480*400
    height: 100
    visible:  false




    anchors {
        top: parent.top; topMargin: 165
        left: parent.left; leftMargin: 25
        right: parent.right; rightMargin: 25
    }


    gradient: Gradient {
        GradientStop { position: 0.0; color: "#66387680" }
        GradientStop { position: 1.0; color: "#6600005f" }
    }


    Rectangle {
        id: rectangle1
        radius: 100
        x: 25
        y: 57
        width: 260
        height: 30
        //smooth: true
        border.color: "darkgray"
        gradient: Gradient {
            GradientStop { position: 1.0; color: "#27408B" }
            GradientStop { position: 0.5; color: "#66387680" }
            GradientStop { position: 0.0; color: "#4876FF" }
        }

        Text {
            id: text2
            x: 55
            y: 8
            text: "Saint Petersburg"
            color: "white"
            anchors{
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter

            }

            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 12
        }

        MouseArea {
            id: mouse_area1
            x: 0
            y: 0
            z: 3
            width: 200
            height: 30
            onClicked: {
                main.setCity(0);
                thisCityChooser.visible = false;
                slider.value2=0;
            }
        }
    }

    Rectangle {
        id: rectangle2
        radius: 100
        x: 25
        y: 12
        width: 260
        height: 30
        //smooth: true
        border.color: "darkgray"
        gradient: Gradient {
            GradientStop { position: 1.0; color: "#27408B" }
            GradientStop { position: 0.5; color: "#66387680" }
            GradientStop { position: 0.0; color: "#4876FF" }
        }

        Text {
            id: text1
            x: 78
            y: 8
            text: "Moscow"
            color: "white"
            font.pixelSize: 12
            anchors{
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter

            }
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
        }

        MouseArea {
            id: mouse_area2
            x: 0
            y: 0
            z: 3
            width: 200
            height: 30
            onClicked: {
                main.setCity(1);
                thisCityChooser.visible = false;
                slider.value2=0;
            }
        }
    }

    states: [
        State {
            name: "visible"
            PropertyChanges { target: thisCityChooser; opacity: 1.0}
         },

        State {
            name: "invisible"
            PropertyChanges { target: thisCityChooser; opacity: 0.0}

        }
    ]

    transitions: Transition {
        PropertyAnimation { properties: "opacity"; duration: 1000 }
    }

    function show() {
        main.modaliltyOn()
        thisCityChooser.state = "visible"
        thisCityChooser.visible = true
    }

    function hide() {
        if (thisCityChooser.visible == true) {
            thisCityChooser.state = "invisible"
            thisCityChooser.visible = false
            main.modalityOff()
        }
    }
}
