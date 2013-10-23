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

        thisChooser.myStationName = stationName
        thisChooser.myStationColor = stationColor

        /*if(x < Math.abs(map.x))
            x = Math.abs(map.x)
        if(y < Math.abs(map.y) + 50)
            y = Math.abs(map.y) + 50
        if(x + getWidth() > Math.abs(map.x) + main.width)
            x = Math.abs(map.x) + main.width - getWidth()
        if(y + getHeight() > Math.abs(map.y) + main.height - 50)
            y = Math.abs(map.y) + main.height - getHeight() - 50*/

//        //console.log("Painted" + mapImage.paintedHeight + " " + mapImage.paintedWidth)
//        //console.log("Map" + mapImage.height + " " + mapImage.width)
//        //console.log("Source size" + mapImage.sourceSize.height + " " + mapImage.sourceSize.width)
//        //console.log("X:Y " + map.contentX + " " + map.contentY)
//        //console.log( x + " " + y)
        ////console.log( x + " + " + stationLabel.width + " > " + main.width + " + " + map.contentX)
        thisChooser.x = x
        if (x + stationLabel.width > main.width + map.contentX){
            thisChooser.x = map.contentX + main.width - stationLabel.width
        }
        if (x < map.contentX){
            thisChooser.x = map.contentX
        }

        thisChooser.y = y
        ////console.log(y + " + " + stationLabel.height + " + " + fromImage.height + ">" + main.height +
          //          " + " + map.contentY + " - " + slider.height)
        ////console.log(slider.y)
        if (y + stationLabel.height + fromImage.height > main.height + map.contentY - slider.height - 70){
            thisChooser.y = main.height + map.contentY - 75 - slider.height - stationLabel.height - fromImage.height
        }
        if(y < map.contentY){
            thisChooser.y = map.contentY
        }

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
    function getHeight(){
        return stationLabel.height
    }
    function getWidth(){
        return stationLabel.width
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
