import QtQuick 1.0
import "drawStationAndRoutes.js" as StationMap
import "viewMap.js" as ViewScripts

Rectangle {
    id: main
    state:  "mainWin"
    property string timeInRoute : routeTime.text;


    Text {
        id: routeTime
        x: 0
        y: 0
        z: 2
        visible: false
        function start(){
            //timer.start();
        }
        Timer {
            id: timer
            interval: 200
            running: false; repeat: false
            onTriggered:{
                //anim.start();
            }
        }

        text: "00"
        anchors{
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter

        }
        //NumberAnimation on opacity {id:anim;running:false; from: 1; to:0 ; duration: 2000}
        color:  "gray";
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 75
    }

    MapFlickable {id: map

        //PropertyAnimation on opacity {id:hide;running:false;from: 1 ; to: 0;duration:500}
        //PropertyAnimation on opacity {id:show;running:false;from: 0 ; to: 1;duration:500}
        Loader {
            id: loader0
            sourceComponent: imageComponent0
            z: 1
            property bool setCity: false
            /*onWidthChanged: {
                if (status == setCity) {
                    map.sourceSizeWidth = width
                    map.sourceSizeHeight = height
                    setCity = false
                    //console.log("changed1")
                    //console.log(map.sourceSizeWidth)
                }
            }*/
            onHeightChanged: {
                if (status == setCity) {
                    map.sourceSizeWidth = width
                    map.sourceSizeHeight = height
                    setCity = false
                    //console.log("changed2")
                    //console.log("loader0.width:" + loader0.width)
                    //console.log("loader1.width:" + loader1.width)
                    //console.log("loader2.width:" + loader2.width)
                }
            }
            onStatusChanged: {
                console.log(status)
                if (status == Loader.Null)
                    sourceComponent = imageComponent0
                if ((loader0.status == Loader.Ready)&&(loader1.status == Loader.Ready)&&(loader2.status == Loader.Ready)
                        &&(loaderPastel0.status == Loader.Ready)&&(loaderPastel1.status == Loader.Ready)&&
                        (loaderPastel2.status == Loader.Ready))
                    busy.on = false
            }
            onProgressChanged: {
                if(progress == 1 && z == 1 && status != Loader.Null)
                    var i//show.start();
            }
        }
        Loader {
            id: loader1

            sourceComponent: imageComponent1
            z: -1
            x: loader2.width+1
            onStatusChanged: {
                if (status == Loader.Null)
                    sourceComponent = imageComponent1
                if ((loader0.status == Loader.Ready)&&(loader1.status == Loader.Ready)&&(loader2.status == Loader.Ready)
                        &&(loaderPastel0.status == Loader.Ready)&&(loaderPastel1.status == Loader.Ready)&&
                        (loaderPastel2.status == Loader.Ready))
                    busy.on = false
            }
            onProgressChanged: {
                if(progress == 1 && z == 1 && status != Loader.Null)
                    var i//show.start();
            }
        }
        Loader {
            id: loader2
            x: loader2.width+1
            sourceComponent: imageComponent2
            z: -1
            onStatusChanged: {
                if (status == Loader.Null)
                    sourceComponent = imageComponent2
                if ((loader0.status == Loader.Ready)&&(loader1.status == Loader.Ready)&&(loader2.status == Loader.Ready)
                        &&(loaderPastel0.status == Loader.Ready)&&(loaderPastel1.status == Loader.Ready)&&
                        (loaderPastel2.status == Loader.Ready))
                    busy.on = false
            }
            onProgressChanged: {
                if(progress == 1 && z == 1 && status != Loader.Null)
                   var i//show.start();
            }
        }
        Loader {
            id: loaderPastel0
            x: loader2.width+1

            sourceComponent: pastelImageComponent0
            z: -1
            onStatusChanged: {
                if (status == Loader.Null)
                    sourceComponent = pastelImageComponent0
                if ((loader0.status == Loader.Ready)&&(loader1.status == Loader.Ready)&&(loader2.status == Loader.Ready)
                        &&(loaderPastel0.status == Loader.Ready)&&(loaderPastel1.status == Loader.Ready)&&
                        (loaderPastel2.status == Loader.Ready))
                    busy.on = false
            }
            onProgressChanged: {
                if(progress == 1 && z == 1 && status != Loader.Null)
                    var i//show.start();
            }
        }
        Loader {
            id: loaderPastel1
            x: loader2.width+1

            sourceComponent: pastelImageComponent1
            z: -1
            onStatusChanged: {
                if (status == Loader.Null)
                    sourceComponent = pastelImageComponent1
                if ((loader0.status == Loader.Ready)&&(loader1.status == Loader.Ready)&&(loader2.status == Loader.Ready)
                        &&(loaderPastel0.status == Loader.Ready)&&(loaderPastel1.status == Loader.Ready)&&
                        (loaderPastel2.status == Loader.Ready))
                    busy.on = false
            }
            onProgressChanged: {
                if(progress == 1 && z == 1 && status != Loader.Null)
                    var i//show.start();
            }
        }
        Loader {
            id: loaderPastel2
            x: loader2.width+1

            sourceComponent: pastelImageComponent2
            z: -1
            onStatusChanged: {
                if (status == Loader.Null)
                    sourceComponent = pastelImageComponent2
                if ((loader0.status == Loader.Ready)&&(loader1.status == Loader.Ready)&&(loader2.status == Loader.Ready)
                        &&(loaderPastel0.status == Loader.Ready)&&(loaderPastel1.status == Loader.Ready)&&
                        (loaderPastel2.status == Loader.Ready))
                    busy.on = false
            }
            onProgressChanged: {
                if(progress == 1 && z == 1 && status != Loader.Null)
                    var i//show.start();
            }
        }

        /*MapImage {
            id: mapImage3
            z:-1
            property bool shown: false
        }*/

        Rectangle {
            id: whiteRect
            color: "white"
            x: loader2.width + 1
            y: 0
            width: loader2.width
            height: loader2.height
            z: 0
        }
        /*Rectangle {
            //PropertyAnimation on opacity {id:hide;running:false;from: 0 ; to: 1;duration:500}
            //PropertyAnimation on opacity {id:show;running:false;from: 1 ; to: 0;duration:500}
            id: routeBackground
            color: "white"
            anchors.fill: parent
            opacity: 0
            visible: true
            z: 4
        }*/
        Item {
            id: routeRect
            anchors.fill: parent
            z: 3
            visible: false
        }

        /*PinchArea {

        }*/

        DirChooser{
            id: dirChooser
            visible: false
        }
    }

    property string source0
    property string source1
    property string source2
    property string sourcePastel0
    property string sourcePastel1
    property string sourcePastel2
    property double opacity0
    property double opacity1
    property double opacity2
    Component {
        id: imageComponent0
        MapImage {
            source: source0
        }
    }
    Component {
        id: imageComponent1
        MapImage {
            source: source1
        }
    }
    Component {
        id: imageComponent2
        MapImage {
            source: source2
        }
    }
    Component {
        id: pastelImageComponent0
        MapImage {
            source: sourcePastel0
        }
    }
    Component {
        id: pastelImageComponent1
        MapImage {
            source: sourcePastel1
        }
    }
    Component {
        id: pastelImageComponent2
        MapImage {
            source: sourcePastel2
        }
    }



    Timer{
        running: true
        repeat: false
        interval: 500
        onTriggered:{
            //StationMap.destroyStations();
            ViewScripts.createStationList();
            source0 = mapModel.getMapDir()+"0.jpg"
            source1 = mapModel.getMapDir()+"1.jpg"
            source2 = mapModel.getMapDir()+"2.jpg"
            sourcePastel0 = mapModel.getMapPastelDir()+"0.jpg"
            sourcePastel1 = mapModel.getMapPastelDir()+"1.jpg"
            sourcePastel2 = mapModel.getMapPastelDir()+"2.jpg"

            loader0.setCity = true

            //map.sourceSizeWidth = loader0.width
            //map.sourceSizeHeight = loader0.height

            //mapImage0.shown=true
            //mapImage0.source = "Icons/moscow_v3_1.jpg"
            //mapImage1.source = "Icons/moscow_v3_2.jpg"
            //mapImage2.source = "Icons/moscow_v3_3.jpg"
            //mapImage3.source = "Icons/moscow_v3_2.jpg"

//            mapImage0.source = mapModel.getMapDir()+"0.jpg";
//            mapImage1.source = mapModel.getMapDir()+"1.jpg";
//            mapImage2.source = mapModel.getMapDir()+"2.jpg";
//            mapImage3.source = mapModel.getMapDir()+"3.jpg";
            //mapImage0.x = 0
            //map.children[0] = mapImage0;
            //map.boundsBehavior = Flickable.DragAndOvershootBounds;
            ////console.log(mapImage0.objectName + " parent: " + mapImage0.parent.objectName)
            ////console.log(map.objectName + " child 0: " + map.children[0].objectName)
            //StationMap.fill();
            //StationMap.showEdges(mapModel.getAllEdges())
        }
    }



    Gps {
        id: gps
        onLatitudeChanged: {
            if ((latitude>-100)&&(longitude>-100)) {
                t.text="latitude:"+latitude+"\nlongitude:"+longitude
                gps.getClosestStation()
            }
        }
        onLongitudeChanged: {
            if ((latitude>-100)&&(longitude>-100)) {
                t.text="latitude:"+latitude+"\nlongitude:"+longitude
                gps.getClosestStation()
            }
        }
        onClosestStationChanged: {
            var circleComponent = Qt.createComponent("ClosestStationCircle.qml");
            var circle = circleComponent.createObject(map);
            var zoom = map.paintedWidth/main.width
            circle.originalX = mapModel.getMapStationById(gps.closestStation+1)["x"]*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2-circle.height/2
            circle.originalY = mapModel.getMapStationById(gps.closestStation+1)["y"]*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2-circle.height/2

            ////console.log(mapModel.getMapStationById(gps.closestStation+1)["x"])

            t.text=stationListModel.get(gps.closestStation)["fullName"]
        }
    }

    //gps text
    Text {
        visible: false
        id: t
        y:200
        text: "searching"
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
            if (main.state == "mainWin")
                map.recount1()
            if (main.state == "routeMap")
                map.recount2()
        }
    }

    /*Rectangle {
        anchors.centerIn: parent
        color: "black"
        width: 100
        height: 100
    }*/

    /*Rectangle {
        color: "red"
        anchors.centerIn: parent
        width: busy.width
        height: busy.height

    }*/
    Image {
        id: busy
        //asynchronous: true

        property bool on: false

        source: "Icons/busy.png"; visible: busy.on
        NumberAnimation on rotation { running: busy.on; from: 0; to: 360; loops: Animation.Infinite; duration: 1200 }
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
            PropertyChanges {target: routeRect; visible: true}
            //PropertyChanges {target: routeBackground; visible: true}
            PropertyChanges {target: routeList; visible: false}
            PropertyChanges {target: stationListView; visible: false}
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



    Timer{
        id:changeSourceToPastel
        interval: 500
        repeat: false
        running: false
        property variant route;
        onTriggered: {
            loader0.sourceComponent = undefined
            loader1.sourceComponent = undefined
            loader2.sourceComponent = undefined
            source0 = mapModel.getMapPastelDir()+"0.jpg";
            source1 = mapModel.getMapPastelDir()+"1.jpg";
            source2 = mapModel.getMapPastelDir()+"2.jpg";
            StationMap.showWay(route);
            showStarter.start()
        }
    }
    Timer{
        id:changeSourceToColor
        interval: 500
        repeat: false
        running: false
        onTriggered: {
            StationMap.clearWay();
            loader0.sourceComponent = undefined
            loader1.sourceComponent = undefined
            loader2.sourceComponent = undefined
            source0 = mapModel.getMapDir()+"0.jpg";
            source1 = mapModel.getMapDir()+"1.jpg";
            source2 = mapModel.getMapDir()+"2.jpg";
            showStarter.start()
        }
    }
    Timer{
        id:showStarter
        interval: 2000
        repeat: false
        running: false
        onTriggered: {
            show.start()
        }
    }
    function showRouteold(route){
        //source0 = mapModel.getMapPastelDir()+"0.jpg";
        //source1 = mapModel.getMapPastelDir()+"1.jpg";
        //source2 = mapModel.getMapPastelDir()+"2.jpg";
        loader0.opacity = 0.75
        loader1.opacity = 0.75
        loader2.opacity = 0.75
        StationMap.showWay(route);
    }

    function showPastel() {
        loader0.z = -1
        loader0.x = loader2.width + 1
        loader1.z = -1
        loader1.x = loader2.width + 1
        loader2.z = -1
        loader2.x = loader2.width + 1
        if (slider.value == 0) {
            loaderPastel0.z = 1
            loaderPastel0.x = 0
        }
        if (slider.value == 1) {
            loaderPastel1.z = 1
            loaderPastel1.x = 0
        }
        if (slider.value == 2) {
            loaderPastel2.z = 1
            loaderPastel2.x = 0
        }
    }

    function showRoute(route){
        if(main.state != "routeMap"){
            //hide.start()
            showPastel()
            StationMap.showWay(route);
            //changeSourceToPastel.start();
            //changeSourceToPastel.route = route;
        }else{
            StationMap.showWay(route);
        }
    }
    function clearWayold(){
        StationMap.clearWay();
        loader0.opacity = 1
        loader1.opacity = 1
        loader2.opacity = 1
        //opacity0 = 1
        //opacity1 = 1
        //opacity2 = 1
        //source0 = mapModel.getMapDir()+"0.jpg";
        //source1 = mapModel.getMapDir()+"1.jpg";
        //source2 = mapModel.getMapDir()+"2.jpg";
    }

    function hidePastel() {
        loaderPastel0.z = -1
        loaderPastel0.x = loader2.width + 1
        loaderPastel1.z = -1
        loaderPastel1.x = loader2.width + 1
        loaderPastel2.z = -1
        loaderPastel2.x = loader2.width + 1
        if (slider.value == 0) {
            loader0.z = 1
            loader0.x = 0
        }
        if (slider.value == 1) {
            loader1.z = 1
            loader1.x = 0
        }
        if (slider.value == 2) {
            loader2.z = 1
            loader2.x = 0
        }
    }

    function clearWay(){
        if(main.state != "mainWin"){
            hidePastel()
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
        slider.value = 0;
        if (main.state == "routeMap")
            hidePastel()
        main.state="mainWin"

        mapModel.setCity(City);
        StationMap.clearWay();

        busy.on = true

        loader0.sourceComponent = undefined
        loader1.sourceComponent = undefined
        loader2.sourceComponent = undefined
        loaderPastel0.sourceComponent = undefined
        loaderPastel1.sourceComponent = undefined
        loaderPastel2.sourceComponent = undefined

        source0 = mapModel.getMapDir()+"0.jpg";
        source1 = mapModel.getMapDir()+"1.jpg";
        source2 = mapModel.getMapDir()+"2.jpg";
        sourcePastel0 = mapModel.getMapPastelDir()+"0.jpg";
        sourcePastel1 = mapModel.getMapPastelDir()+"1.jpg";
        sourcePastel2 = mapModel.getMapPastelDir()+"2.jpg";


        ViewScripts.createStationList();

        loader0.setCity = true


        ////console.log(mapModel.getMapDir())

        //mapImage.source = mapModel.getMapDir()+"0.png";
        //map.sourceSize.height = 1275;
        //map.sourceSize.width = 1335;
        //map.sourceSizeWidth =
        upFields.station2Text=""
        upFields.station2CircleColor="white"
        upFields.station2CircleVisible=false
        upFields.station1Text=""
        upFields.station1CircleColor="white"
        upFields.station1CircleVisible=false

        //setCity1.start();

        //mapImage.loadingNewCity = true;



        modalityOff()


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
            //StationMap.destroyStations();
            //ViewScripts.createStationList();
            //StationMap.fill();
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

