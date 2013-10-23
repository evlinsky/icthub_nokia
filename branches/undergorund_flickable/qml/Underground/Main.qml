import QtQuick 1.0
//import Qt 4.7
//import QtMobility.location 1.1

import "drawStationAndRoutes.js" as StationMap
import "viewMap.js" as ViewScripts

Rectangle {
    id: main
    state:  "mainWin"
    //color:"black"

    Text {
        id: routeTime
        x: 0
        y: 0
        z: 2
        visible: false
        function start(){
            timer.start();
        }
        Timer {
            id: timer
            interval: 200
            running: false; repeat: false
            onTriggered:{
                anim.start();
            }
        }

        text: "00"
        anchors{
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter

        }
        NumberAnimation on opacity {id:anim;running:false; from: 1; to:0 ; duration: 2000}
        color:  "gray";
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 75
    }

    Gps {id: gps}

    Map {id: map
            /*onPaintedGeometryChanged:
                if ((stationListModel.count == 0)&&(map.paintedHeight != 0)) {

                    ViewScripts.createStationList();
                    StationMap.fill()
                    //StationMap.showEdges(mapModel.getAllEdges())
                }*/
            DirChooser{
                id: dirChooser
                visible: false
            }
        }

    Slider {
        id: slider;
        property real prevScale: 1
        anchors {
            bottom: parent.bottom; bottomMargin: 5
            left: parent.left; leftMargin: 5
            right: parent.right; rightMargin: 50
        }
        onValueChanged: {
            map.recount1()
            //console.log(map.paintedWidth)
        }
    }

    Image {
        anchors.left:  slider.right
        anchors.top:  slider.top
        source: "Icons/city_chooser.png"
        opacity:  0.7

        MouseArea {
           anchors.fill: parent
           onClicked: {
               cityChooser.show()
           }
        }
    }

    CityChooser{
        id: cityChooser
        visible: false
    }
    //routeMap
    ShowRouteButton{id:showRouteButton}

    //stationList
    StationList{id: stationListView}
    ListModel {id: stationListModel}

    //routeList
    RouteList{id: routeList}
    ListModel {id: routeListModel}
    UpFields {id:upFields}

    states: [
        State {
            name: "stationList1"
            //PropertyChanges { target: map; visible: false}
            PropertyChanges { target: stationListView; visible: true}
            PropertyChanges { target: upFields; stationList1Selected: true}
            PropertyChanges { target: slider; visible: false}
            PropertyChanges { target: map; visible: false}
        },

        State {
            name: "stationList2"
            //PropertyChanges { target: map; visible: false}
            PropertyChanges { target: stationListView; visible: true}
            PropertyChanges { target: upFields; stationList2Selected: true}
            PropertyChanges { target: slider; visible: false}
            PropertyChanges { target:stationListView; }
            PropertyChanges { target: map; visible: false}
        },
        State {
            name: "routeList"
            PropertyChanges { target: map; visible: false}
            PropertyChanges { target: routeList; visible: true}
            PropertyChanges { target: slider; visible: false}
            //PropertyChanges { target: routeListView; visible: true}
        },
        State {
            name: "routeMap"
            PropertyChanges {target: routeList; visible: false}
            PropertyChanges {target: stationListView; visible: false}
            PropertyChanges {target: map; visible: true}
            PropertyChanges {target: showRouteButton; visible: true}
        }

    ]

    function showRoute(route){
        StationMap.showWay(route);
    }

    function clearWay(){
        StationMap.clearWay();
    }

    function reloadMap(){
        ViewScripts.reloadMap();
        map.source = mapModel.getMapDir();

        upFields.station2Text=""
        main.state="mainWin"
        upFields.station2CircleColor = "white"
        upFields.station2CircleVisible=false
        upFields.station1Text=""
        upFields.station1CircleColor="white"
        upFields.station1CircleVisible=false
        StationMap.clearWay();
        slider.value = 0;
    }

    function setCity(City){

        slider.value = 0;
        mapModel.setCity(City);
        StationMap.clearWay();
        map.source = mapModel.getMapDir();
        //map.sourceSize.height = 1275;
        //map.sourceSize.width = 1335;
        upFields.station2Text=""
        main.state="mainWin"
        upFields.station2CircleColor="white"
        upFields.station2CircleVisible=false
        upFields.station1Text=""
        upFields.station1CircleColor="white"
        upFields.station1CircleVisible=false

        setCity1.start();
        //ViewScripts.createStationList();
        //StationMap.fill();
        //StationMap.showEdges(mapModel.getAllEdges())
    }
    Timer{
        id:setCity1
        running: false;
        repeat: false
        interval: 500
        onTriggered:{
            StationMap.destroyStations();
            ViewScripts.createStationList();
            StationMap.fill();
            //StationMap.showEdges(mapModel.getAllEdges())
        }
    }

    function modaliltyOn(){
        slider.mouseOff()
        upFields.mouseOff()
    }

    function modalityOff(){
       slider.mouseOn()
       upFields.mouseOn()
    }
}

