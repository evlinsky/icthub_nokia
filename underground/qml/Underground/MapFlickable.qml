import QtQuick 1.1
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
        //console.log(contentX)
        mainWidget.x = contentX
    }
    onContentYChanged: {
        mainWidget.y = contentY
    }

    onMovementStarted: {
       // console.log("moving " + contentX)
    }


    //contentY: upFields.height
    //onContentYChanged: //console.log(contentY)

    //property string imageSource:  "Icons/spb0.svg"
    function mouseOff(){
        mouse.enabled = false
    }
    function mouseOn(){
        mouse.enabled = true
    }
    function recount1() {
    }
    function recount2() {

    }
    //MapImage {id: map}

    PinchArea {
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
            onPinchStarted: {
                map.mouseOff()
                mainWidget.fast = true
                slider.forceHandleXChange = true
                //console.log("started")
            }

            onPinchUpdated:
            {
                //map.contentX +=-mapToItem(main.parent,pinch.previousCenter.x,pinch.previousCenter.y).x+mapToItem(main.parent,pinch.center.x,pinch.center.y).x;
                //map.contentY +=-mapToItem(main.parent,pinch.previousCenter.x,pinch.previousCenter.y).y+mapToItem(main.parent,pinch.center.x,pinch.center.y).y;
                if (pinch.scale>1)
                    slider.value2 -= (pinch.previousScale-pinch.scale)*slider.maximum/3;
                else
                    slider.value2 -= 5*(pinch.previousScale-pinch.scale)*slider.maximum/3;
                //console.log(pinch.scale)
                //mainWidget.rotation+=pinch.previousAngle-pinch.angle;
            }
            onPinchFinished: {
                mainWidget.fast = false
                slider.forceHandleXChange = false
                mainWidget.scale = mainWidget.scale
                map.mouseOn()
            }
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
                    /*onDoubleClicked: {
                        main.clearWay();
                        if(dirChooser.visible){
                            dirChooser.hide()
                            return
                        }
                    }*/

                    //        }
                    onClicked: {
                        //console.log(mouseX+" "+mouseY)
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
                                /*clickedStation = mapModel.getNearestClickedStation(x, y);
                                x = clickedStation["x"]
                                y = clickedStation["y"]

                                ////console.log(zoom)
                                x*=zoom;
                                y*=zoom;

                                ////console.log(x+" "+y)
                                //cityChooser.hide()
                                dirChooser.show(x, y,
                                                clickedStation["fullName"], clickedStation["stationColor"])*/
                            }
                            else{
                                dirChooser.hide()
                            }
                        }
                    }
                }
    }
}
