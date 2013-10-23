import QtQuick 1.0
import "drawStationAndRoutes.js" as StationMap
import "viewMap.js" as ViewScripts

Item {

    id: main
    state:  "mainWin"
    property string timeInRoute : routeTime.text;
    property bool initialization: true

    /*PinchArea {
            id:pinchArea
            anchors.fill: parent
            enabled: true

            property int xpoint
            property int ypoint
            property int pinchscale
            property int pinchrotation

            pinch.dragAxis: Pinch.XandYAxis
            pinch.minimumScale: slider.minimum
            pinch.maximumScale: slider.maximum
            onPinchUpdated:
            {
                console.log("zzz")
                map.contentX +=-mapToItem(main.parent,pinch.previousCenter.x,pinch.previousCenter.y).x+mapToItem(main.parent,pinch.center.x,pinch.center.y).x;
                map.contentY +=-mapToItem(main.parent,pinch.previousCenter.x,pinch.previousCenter.y).y+mapToItem(main.parent,pinch.center.x,pinch.center.y).y;
                slider.value2 -= pinch.previousScale-pinch.scale;
                //mainWidget.rotation+=pinch.previousAngle-pinch.angle;
            }
        }*/


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

    MapFlickable {id: map

        /*Behavior on contentX{
             PropertyAnimation{}
        }
        Behavior on contentY{
             PropertyAnimation{}
        }*/

        //PropertyAnimation on opacity {id:hide;running:false;from: 1 ; to: 0;duration:500}
        //PropertyAnimation on opacity {id:show;running:false;from: 0 ; to: 1;duration:500}


        MainWidget {
            id: mainWidget

            /*Behavior on scale{
                  PropertyAnimation{}
            }*/

            onWidthChanged: {
                //console.log(width)
                map.contentWidth = width
            }
            onHeightChanged: map.contentHeight = height

            //onZoomChanged: StationMap.update()
        }

        Item {
            id: gpsRect
            anchors.fill: parent
            z: 2
            visible: true
        }

        //onMovementStarted: mainWidget.x = 100

        /*PinchArea {
                anchors.fill: parent
                enabled: true
                property double startScale
                property double finishScale
                onPinchStarted: {
                    startScale = pinch.scale
                }
                onPinchFinished: {
                    finishScale = pinch.scale
                    if(pinch.scale > 1 && slider.value < 3)
                        slider.value++
                    if(pinch.scale < 1 && slider.value > 0)
                        slider.value--
                }
            }*/

        DirChooser{
            id: dirChooser
            visible: false
        }
    }



    Timer{
        running: true
        repeat: false
        interval: 500
        onTriggered:{
            //StationMap.destroyStations();

            mainWidget.penWidth = mapModel.getFont()*0.6;
            mainWidget.circleSize = mapModel.getFont()*1.5;
            mainWidget.xmlWidth = mapModel.getXmlWidth();
            mainWidget.xmlHeight = mapModel.getXmlHeight();
            mainWidget.allEdges = mapModel.getAllEdges();
            mainWidget.allStations = mapModel.getStations();
            mainWidget.imageUrl = mapModel.getMapDir();
            mainWidget.paintEnabled = true;
            ViewScripts.createStationList();
            //StationMap.fill();
            //StationMap.update();
            main.initialization = false;
        }
    }



    Gps {
        id: gps
        Component.onCompleted: {
            var circleComponent = Qt.createComponent("ClosestStationCircle.qml");
            circle = circleComponent.createObject(gpsRect);
            circle.visible = false
        }

        property variant circle
        onLatitudeChanged: {
            if ((latitude>-100)&&(longitude>-100)) {
                //t.text="latitude:"+latitude+"\nlongitude:"+longitude
                gps.getClosestStation()
            }
        }
        onLongitudeChanged: {
            if ((latitude>-100)&&(longitude>-100)) {
                //t.text="latitude:"+latitude+"\nlongitude:"+longitude
                gps.getClosestStation()
            }
        }
        onClosestStationChanged: {
            console.log(closestStation)
            if (closestStation != -1)
                circle.visible = true
            var zoom = mainWidget.zoom
            circle.originalX = mapModel.getMapStationById(gps.closestStation+1)["x"]-circle.height/2
            circle.originalY = mapModel.getMapStationById(gps.closestStation+1)["y"]-circle.height/2

            ////console.log(mapModel.getMapStationById(gps.closestStation+1)["x"])
            //loader0.sourceComponent = undefined

            //t.text=stationListModel.get(gps.closestStation)["fullName"]
            //console.log(circle.originalX+" "+circle.originalY)
        }
    }

    //gps text
    Text {
        visible: false
        id: t
        y:200
        text: "zzz"
    }

    Slider {
        id: slider;
        property real prevScale: 1
        anchors {
            bottom: parent.bottom; bottomMargin: 5
            left: parent.left; leftMargin: 50
            right: parent.right; rightMargin: 50
        }
        onValueChanged: {
            //if (!main.initialization)
               // mainWidget.paintEnabled = false;
            //console.log(mainWidget.paintEnabled)
            mainWidget.scale = 1 + value/2;
            //mainWidget.paintEnabled = true;
        }
    }







    QuitMenu { id: message; }

    Image {
        anchors.right:  slider.left
        anchors.top:  slider.top
        source: "Icons/quit.png";
        opacity:  0.7

        MouseArea {
           anchors.fill: parent
           onClicked: {
               message.showDialog( );
           }
        }
    }

    Image {
        id: busy
        anchors.centerIn: parent
        visible: false

        source: "Icons/busy.png"
        NumberAnimation on rotation { running: true; from: 0; to: 360; loops: Animation.Infinite; duration: 1200 }
    }

    Image {

        anchors.left:  slider.right
        anchors.top:  slider.top
        source: "Icons/city_chooser.png"
        opacity:  0.7

        MouseArea {
           anchors.fill: parent
           onClicked: {
               //console.log("City chooser")
               dirChooser.hide();
               cityChooser.show();
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

    //search
    StationSearch{id: stationSearch}
    ListModel {id: stationSearchListModel}


    //routeList
    RouteList{id: routeList}
    ListModel {id: routeListModel}
    UpFields {id:upFields}

    states: [
        State {
            name: "stationList1"
            //PropertyChanges { target: map; visible: false}
            PropertyChanges { target: stationListView; visible: true; }
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
            //PropertyChanges {target: routeRect; visible: true}
            //PropertyChanges {target: routeBackground; visible: true}
            //PropertyChanges {target: routeList; visible: false}
            PropertyChanges {target: stationListView; visible: false}
            //PropertyChanges {target: mainWidget; opacity:0.5}
            PropertyChanges {target: map; visible: true}
            PropertyChanges {target: showRouteButton; visible: true}
        },
        State {
            name: "stationSearch1"
            PropertyChanges {target: map; visible: false}
            PropertyChanges {target: stationListView; visible: false}
            PropertyChanges {target: stationSearch; visible: true}
        },
        State {
            name: "stationSearch2"
            PropertyChanges {target: map; visible: false}
            PropertyChanges {target: stationListView; visible: false}
            PropertyChanges {target: stationSearch; visible: true}
        }

    ]




    function showRoute(route){
        if(main.state != "routeMap"){
            //hide.start()
            //showPastel()
            mainWidget.opacity = 0.3
            StationMap.showWay(route);
            //changeSourceToPastel.start();
            //changeSourceToPastel.route = route;
        }else{
            StationMap.showWay(route);
        }
    }



    function clearWay(){
        mainWidget.opacity = 1
        if(main.state != "mainWin"){
            StationMap.clearWay();
        }else{
            StationMap.clearWay();
        }

    }

    function reloadMap(){
        ViewScripts.reloadMap();
        mapImage.source = mapModel.getMapDir();

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

        //if (main.state == "routeMap")
            //hidePastel()
        main.state="mainWin"
        mapModel.setCity(City);

        StationMap.clearWay();


        mainWidget.penWidth = mapModel.getFont()*0.6;
        mainWidget.circleSize = mapModel.getFont()*1.5;
        mainWidget.xmlWidth = mapModel.getXmlWidth();
        mainWidget.xmlHeight = mapModel.getXmlHeight();
        mainWidget.imageUrl = mapModel.getMapDir();




        mainWidget.allEdges = mapModel.getAllEdges();
        mainWidget.allStations = mapModel.getStations();

        //StationMap.destroyStations();
        ViewScripts.createStationList();
        //StationMap.fill();
        StationMap.update()
        //console.log("mainWidget.scale:"+mainWidget.scale)
        if(City == 1){
            slider.maximum = 10
            slider.minimum = 3
            slider.value2 = 3
            slider.reset()
        }else{
            mainWidget.scale = 1.0;
            slider.maximum= 4
            slider.minimum= 1
            slider.value2= 1.1
            slider.reset()
        }

        //console.log("mainWidget.scale:"+mainWidget.scale)


        upFields.station2Text=""
        upFields.station2CircleColor="white"
        upFields.station2CircleVisible=false
        upFields.station1Text=""
        upFields.station1CircleColor="white"
        upFields.station1CircleVisible=false


        modalityOff()
        busy.visible = false

    }
    Timer{
        id:setCity1
        running: false;
        repeat: false
        interval: 500
        onTriggered:{
            //StationMap.destroyStations();
            //ViewScripts.createStationList();
            StationMap.fill();
            StationMap.update()
            //StationMap.showEdges(mapModel.getAllEdges())
        }
    }

    function modaliltyOn(){
        slider.mouseOff()
        upFields.mouseOff()
        map.mouseOff();

    }

    function modalityOff(){
       slider.mouseOn()
       upFields.mouseOn()
       map.mouseOn()
    }
}

