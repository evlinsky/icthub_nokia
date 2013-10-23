import QtQuick 1.0
import "viewMap.js" as ViewScripts
import "drawStationAndRoutes.js" as DrawStationAndRoutes

Item {
    id: thisChooser
    z: 150

    property string myStationName: "Station"
    property string myStationColor: "black"
    opacity: 0.0
    width: stationLabel.width

    Rectangle {
        id: stationLabel
        color: "#CCD7E3"
        x: 0
        y: 0
        radius: 10

        width: stationCircle.width + stationName.width + 13
        height: stationCircle.height + stationCircle.y + 5

        Rectangle {
            id: stationCircle
            x: 5; y: 5;
            width: 20;
            height: 20;
            radius: 20
            smooth: true
            color: thisChooser.myStationColor
        }

        Text {
            id: stationName
            x: stationCircle.width + stationCircle.x + 3
            anchors.verticalCenter: stationCircle.verticalCenter
            color:  "black"
            text: thisChooser.myStationName
        }
     }


    Image {
        id: fromImage
        x: stationLabel.x + stationLabel.width / 2 - width - 2
        y: stationLabel.y + stationLabel.height + 2
        source: "Icons/from_station.png"
        MouseArea {
           anchors.fill: parent
           onClicked: {
                ViewScripts.stationChoice(myStationName, 1, myStationColor)
                thisChooser.hide()
           }
        }
    }

    Image {
        id: toImage
        x: stationLabel.x + stationLabel.width / 2 + 2
        y: stationLabel.y + stationLabel.height + 2
        source: "Icons/to_station.png"
        MouseArea {
            id: toImageArea
            anchors.fill: parent
            onClicked: {
                ViewScripts.stationChoice(myStationName, 2, myStationColor)
                thisChooser.hide()
            }
        }
    }

    function show(x, y, stationName, stationColor) {
        main.modaliltyOn()        
        thisChooser.state = "visible"
        thisChooser.x = x
        if (map.x + x + fromImage.width + toImage.width > main.width){
            thisChooser.x = main.width - toImage.width - fromImage.width - 10 - map.x
        }
        thisChooser.y = y
        thisChooser.myStationName = stationName
        thisChooser.myStationColor = stationColor
        thisChooser.visible = true
        //DrawStationAndRoutes.zoomToWay(x, y, x + thisChooser.width, y + thisChooser.height)

    }

    function hide() {
        if (thisChooser.visible == true) {
            thisChooser.state = "invisible"
            thisChooser.visible = false
            main.modalityOff()
        }
    }

    states: [
        State {
            name: "visible"
            PropertyChanges { target: thisChooser; opacity: 1.0}
         },

        State {
            name: "invisible"
            PropertyChanges { target: thisChooser; opacity: 0.0}

        }
    ]
    transitions: Transition {
        PropertyAnimation { properties: "opacity"; duration: 1000 }
    }
}
