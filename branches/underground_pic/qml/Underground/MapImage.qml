import QtQuick 1.0
import "drawStationAndRoutes.js" as StationMap
import "viewMap.js" as ViewScripts
Image {
    //width: main.width; height: main.height
    fillMode: Image.PreserveAspectFit
    //width: main.width
    //height: main.height
    //width: sourceSize.width
    //height:  sourceSize.height
    visible: true
    //smooth: true

    anchors.centerIn: parent

    property bool ready: false
    property string newSource

    property double initialZoom: main.width / mapImage.sourceSize.width
    width: mapImage.sourceSize.width
    height: mapImage.sourceSize.height
    scale: initialZoom


    asynchronous: true

    function updateSource(arg){
        newSource = arg
        changeSource.start()
    }


    /*SequentialAnimation on opacity{
            id: changeSource
            running: false
            NumberAnimation {to: 0; duration: 500 }
            ScriptAction{script: {source = newSource}}
            ScriptAction{script: {map.recounting = true}}
            //NumberAnimation {to: 1; duration: 500 }
    }
    SequentialAnimation on opacity{
            id: opacityToOne
            running: false
            NumberAnimation {to: 1; duration: 500 }
    }
*/

    //Component.onCompleted: (flickable.contentY=upFields.height)



    onStatusChanged: {
    /*    if ((status == Image.Ready) && (opacity == 0)){
            //opacityToOne.start();
        }

        if ((status==Image.Ready)&&(loadingNewCity==true)) {
            mapImage.widthWZoom = mapImage.paintedWidth
            mapImage.heightWZoom = mapImage.paintedHeight
            loadingNewCity=false
            ViewScripts.createStationList();
            //StationMap.fill();
        }
        if ((status==Image.Ready)&&(map.recounting==true))
            map.recount2()
            */
    }




    function setX(){
        flickable.newX = 0;
    }
    function setY(){
        flickable.newY = 0;
    }


    /*Behavior on x {
        enabled: animationEnabled
        NumberAnimation { duration: 500 }
    }
    Behavior on y {
        enabled: animationEnabled
        NumberAnimation { duration: 500 }
    }*/



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
        //        }
        onClicked: {
            //station.originalY = (stationListModel.get(i).Y)*mapImage.paintedHeight/mapModel.getXmlHeight()+(main.height-mapImage.paintedHeight)/2;
            console.log(mouseX+" "+mouseY)

            ////console.log(heightWZoom)

            var zoom=map.contentWidth/loader0.width
            var x=(mouseX/zoom)*mapModel.getXmlWidth()/loader0.width;
            var y=(mouseY/zoom)*mapModel.getXmlHeight()/loader0.height;

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
            var clickedStation = mapModel.getClickedStation(x, y);
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


                x = clickedStation["x"]*loader0.width/mapModel.getXmlWidth()
                y = clickedStation["y"]*loader0.height/mapModel.getXmlHeight()

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
                    x = clickedStation["x"]*loader0.width/mapModel.getXmlWidth()
                    y = clickedStation["y"]*loader0.height/mapModel.getXmlHeight()

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

    //        function dragMap() {
    //            map.animationEnabled=true;
    //            if (map.x > 0)
    //                map.x = 0;
    //            if (map.x < main.width - map.width - (map.paintedWidth-map.width)/2) {
    //                if (map.paintedWidth>=main.width)
    //                    map.x = main.width - map.width - (map.paintedWidth-map.width)/2;
    //                else
    //                    map.x = 0;
    //            }
    //            if (map.y > (map.paintedHeight-map.height)/2+upFields.height+10) {
    //                if (map.paintedHeight>=main.height-upFields.height)
    //                    map.y = (map.paintedHeight-map.height)/2+upFields.height+10;
    //                else
    //                    map.y = 0;
    //            }
    //            if (map.y < main.height - map.height - (map.paintedHeight-map.height)/2 - showRouteButton.height) {
    //                if (map.paintedHeight>=main.height-upFields.height)
    //                    map.y = main.height - map.height - (map.paintedHeight-map.height)/2 - showRouteButton.height;
    //                else
    //                    map.y = 0;
    //            }
    //            map.animationEnabled=false;
    //       }


}
