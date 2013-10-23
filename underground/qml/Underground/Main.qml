    import QtQuick 1.0
import "drawStationAndRoutes.js" as StationMap
import "viewMap.js" as ViewScripts

Item {
    id: main
    state:  "mainWin"
    property string timeInRoute : routeTime.text;
    property bool initialization: true
    property double coef: width/360
    width: 100
    height: 100

    //rotation: 270

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

    /*onStateChanged: {
        if (((state == "routeList")||(state == "routeMap"))&&(show == true)) {
            mainWidget.showRoute = true;
            //console.log("show")
            show = false;
        }
    }*/

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

            onRepaintChanged: {
                routeAnimationRect.visible = false
            }

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
    /*Rectangle {
        id: routeAnimationRect
        anchors.fill: main
        visible: true
        opacity: 0
        NumberAnimation on opacity{
            running: false
            id: routeAnimation;
            from: 0.0
            to: 0.7;
            duration: 1000
        }
    }*/



    Timer{
        running: true
        repeat: false
        interval: 500
        onTriggered:{
            //StationMap.destroyStations();
            if (main.width>main.height) {
                main.rotation = 270
                var a = main.width
                main.width = main.height
                main.height = a
                main.y = -(main.height - main.width)/2
                main.x = (main.height - main.width)/2

            }

            console.log(a)

            mainWidget.penWidth = mapModel.getFont()*0.6;
            mainWidget.circleSize = mapModel.getFont()*1.5;
            mainWidget.xmlWidth = mapModel.getXmlWidth();
            mainWidget.xmlHeight = mapModel.getXmlHeight();
            mainWidget.allEdges = mapModel.getAllEdges();
            mainWidget.allStations = mapModel.getStations();
            mainWidget.rects = mapModel.getRects();
            mainWidget.paintEnabled = true;
            ViewScripts.createStationList();
            //StationMap.fill();
            //StationMap.update();
            main.initialization = false;
            setCity(1)
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
        mainWidget.routeEdges = mapModel.getRouteEdges(route);
        mainWidget.routeStations = mapModel.getRouteStations(route);
        //console.log("start")
        //routeAnimation.start()
        mainWidget.showRoute = true;

        //show = true;
        //mainWidget.createFastRoutePixmap();
    }



    function clearWay(){
        mainWidget.showRoute = false;
        //mainWidget.opacity = 1
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

    property bool fastDisabled: false

    function setCity(City){

        //if (main.state == "routeMap")
            //hidePastel()
        main.state="mainWin"
        mapModel.setCity(City);

        StationMap.clearWay();



        if (City == 1)
            mainWidget.firstScale = 3.5
        if (City == 0)
            mainWidget.firstScale = 1.5
        mainWidget.penWidth = mapModel.getFont()*0.6;
        mainWidget.circleSize = mapModel.getFont()*1.5;
        mainWidget.xmlWidth = mapModel.getXmlWidth();
        mainWidget.xmlHeight = mapModel.getXmlHeight();



        mainWidget.rects = mapModel.getRects();
        mainWidget.allEdges = mapModel.getAllEdges();
        mainWidget.allStations = mapModel.getStations();
        mainWidget.showRoute = false;

        //StationMap.destroyStations();
        ViewScripts.createStationList();
        //StationMap.fill();
        //StationMap.update()
        //console.log("mainWidget.scale:"+mainWidget.scale)
        fastDisabled = true
        if(City == 1){
            slider.maximum = 7.5
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
        fastDisabled = false

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
        //map.mouseOff();

    }

    function modalityOff(){
       slider.mouseOn()
       upFields.mouseOn()
       //map.mouseOn()
    }
}

