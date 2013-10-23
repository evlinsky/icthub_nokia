import QtQuick 1.0
//import CustomComponents 1.0

Flickable {
    id: flickable

    objectName: "mapFlickable"
    //boundsBehavior: Flickable.DragAndOvershootBounds;

    //onFlickStarted: //console.log("flicking")
    //onMovementStarted: //console.log("moving")

     flickableDirection: Flickable.HorizontalAndVerticalFlick
    //flickableDirection: Flickable.StopAtBounds

    height: main.height - upFields.height - slider.height
    anchors.top: upFields.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: slider.top
//    height: main.height-upFields.height
//    width: main.width
//    y: upFields.height
//    x: 0

    property int newX: 0
    property int newY: 0
    property int tempX: 0
    property int tempY: 0
    property int tempX1: 0
    property int tempX2: 0
    property int tempY1: 0
    property int tempY2: 0
    property bool changing: false
    property bool animationEnabled: false

    //onPaintedHeightChanged: //console.log(paintedWidth+" "+paintedHeight)
    //onPaintedWidthChanged: //console.log(paintedWidth+" "+paintedHeight)


    property int oldHeight: 0
    property int oldWidth: 0
    property int oldX: 0
    property int oldValue: 0
    property bool recounting: false

    onRecountingChanged: {
      //  if ((mapImage.status==Image.Ready)&&(recounting==true))
        //    recount2()
    }

    //property double zoom: mapImage.sourceSize.width/main.width

    contentWidth: mainWidget.width
    contentHeight: mainWidget.height
    //contentX: -100
    //contentY: mainWidget.y
    /*onContentWidthChanged: {
        contentX = mapImage.width * (1 - mapImage.scale)
    }
    onContentHeightChanged: {
        contentY = mapImage.width * (1 - mapImage.scale)
    }*/
    onContentXChanged: {
        mainWidget.x = contentX
    }
    onContentYChanged: {
        mainWidget.y = contentY
    }

    onMovementStarted: {
        //console.log("moving" + contentWidth)
    }


    //contentY: upFields.height
    //onContentYChanged: //console.log(contentY)

    //property string imageSource:  "Icons/spb0.svg"
    function mouseOff(){
        //mouse.enabled = false
    }
    function mouseOn(){
        //mouse.enabled = true
    }
    function recount1() {
        /*oldWidth = sourceSizeWidth
        oldHeight = sourceSizeHeight
        var oldContentX = contentX
        var oldContentY = contentY
        //oldX = mapImage.x

        //map.children.x = main.width + 1
        //map.children.parent = main
        if (oldValue == 0) {
            loader0.z = -1
            loader0.x = loader2.width+1
        }
        if (oldValue == 1) {
            loader1.z = -1
            loader1.x = loader2.width+1
        }
        if (oldValue == 2) {
            loader2.z = -1
            loader2.x = loader2.width+1
        }
        if (slider.value == 0) {
            sourceSizeWidth = loader0.width
            sourceSizeHeight = loader0.height
            loader0.z = 1
            loader0.x = 0
            //boundsBehavior = Flickable.DragAndOvershootBounds;
        }
        if (slider.value == 1) {
            sourceSizeWidth = loader1.width
            sourceSizeHeight = loader1.height
            loader1.z = 1
            loader1.x = 0
        }
        if (slider.value == 2) {
            sourceSizeWidth = loader2.width
            sourceSizeHeight = loader2.height
            loader2.z = 1
            loader2.x = 0
        }
        oldValue = slider.value

        var newWidth = sourceSizeWidth
        var newHeight = sourceSizeHeight

        contentX = (oldContentX + main.width/2)/oldWidth*newWidth - main.width/2
        contentY = (oldContentY + main.height/2)/oldHeight*newHeight - main.height/2*/
    }
    function recount2() {
        /*oldWidth = sourceSizeWidth
        oldHeight = sourceSizeHeight
        var oldContentX = contentX
        var oldContentY = contentY
        //oldX = mapImage.x

        //map.children.x = main.width + 1
        //map.children.parent = main
        if (oldValue == 0) {
            loaderPastel0.z = -1
            loaderPastel0.x = loader2.width+1
        }
        if (oldValue == 1) {
            loaderPastel2.z = -1
            loaderPastel1.x = loader2.width+1
        }
        if (oldValue == 2) {
            loaderPastel2.z = -1
            loaderPastel2.x = loader2.width+1
        }
        if (slider.value == 0) {
            sourceSizeWidth = loaderPastel0.width
            sourceSizeHeight = loaderPastel0.height
            loaderPastel0.z = 1
            loaderPastel0.x = 0
            //boundsBehavior = Flickable.DragAndOvershootBounds;
        }
        if (slider.value == 1) {
            sourceSizeWidth = loaderPastel1.width
            sourceSizeHeight = loaderPastel1.height
            loaderPastel1.z = 1
            loaderPastel1.x = 0
        }
        if (slider.value == 2) {
            sourceSizeWidth = loaderPastel2.width
            sourceSizeHeight = loaderPastel2.height
            loaderPastel2.z = 1
            loaderPastel2.x = 0
        }
        oldValue = slider.value

        var newWidth = sourceSizeWidth
        var newHeight = sourceSizeHeight

        contentX = (oldContentX + main.width/2)/oldWidth*newWidth - main.width/2
        contentY = (oldContentY + main.height/2)/oldHeight*newHeight - main.height/2*/
    }
    //MapImage {id: map}
    MouseArea {
        id: mouse
        anchors.fill: parent
        //        drag.target: map

        //        onReleased: {
        //            dragMap();
        //        }

        //        onClicked: {
        //            cityChooser.hide()
        //            dirChooser.hide()
        //            //console.log(gps.position.coordinate.latitude);
        onDoubleClicked: {
            main.clearWay();
            if(dirChooser.visible){
                dirChooser.hide()
                return
            }
        }

        //        }
        onClicked: {
            //station.originalY = (stationListModel.get(i).Y)*mapImage.paintedHeight/mapModel.getXmlHeight()+(main.height-mapImage.paintedHeight)/2;
            //console.log(mouseX+" "+mouseY)

            ////console.log(heightWZoom)

            var zoom= mainWidget.zoom
            var x=mouseX
            var y=mouseY

//            //console.log(mouseX+" "+mouseY)
//            //console.log(map.sourceSizeWidth)
            ////console.log()
//            //console.log(zoom)
//            //console.log(map.contentWidth)
//            //console.log(mapImage0.width)
//            //console.log(x+" "+y)

            ////console.log(mapModel.getXmlWidth())


            ////console.log((230-(main.width-mapImage.paintedWidth)/2)*mapModel.getXmlWidth()/mapImage.paintedWidth)
            //x/=zoom
            //y/=zoom
            ////console.log(x+" "+y)
            var clickedStation = mapModel.getClickedStation(x/mainWidget.zoom, y/mainWidget.zoom);
            if(cityChooser.visible){
                cityChooser.hide()
                dirChooser.hide()
                return
            }
            if(dirChooser.visible){
                dirChooser.hide()
                return
            }

            if (clickedStation["fullName"]!="NULL")
            {
                //station.originalX = (stationListModel.get(i).X)*mapImage.paintedWidth/mapModel.getXmlWidth()+(main.width-mapImage.paintedWidth)/2;


                x = clickedStation["x"]
                y = clickedStation["y"]

                ////console.log(zoom)
                x*=zoom;
                y*=zoom;

                ////console.log(x+" "+y)
                //cityChooser.hide()
                dirChooser.show(x, y,
                                clickedStation["fullName"], clickedStation["stationColor"])
            }
            else{
                if(!dirChooser.visible){
                    clickedStation = mapModel.getNearestClickedStation(x, y);
                    x = clickedStation["x"]
                    y = clickedStation["y"]

                    ////console.log(zoom)
                    x*=zoom;
                    y*=zoom;

                    ////console.log(x+" "+y)
                    //cityChooser.hide()
                    dirChooser.show(x, y,
                                    clickedStation["fullName"], clickedStation["stationColor"])
                }
                else{
                    dirChooser.hide()
                }
            }
        }
    }
}
