import QtQuick 1.0
//import CustomComponents 1.0
//import QtMobility.location 1.1


Flickable {
    id: flickable

    flickableDirection: Flickable.HorizontalAndVerticalFlick

    height: main.height-upFields.height
    anchors.top: upFields.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: parent.bottom

    contentWidth: map.width; contentHeight: map.height

    //property string imageSource:  "Icons/spb0.svg"
    function recount1() {
        map.oldWidth = map.width
        map.oldHeight = map.height
        map.oldX = map.x

        map.source="Icons/spb"+slider.value+".svg"

        map.recounting = true
    }
    function recount2() {
        var newHeight = map.height
        var newWidth = map.width

        map.recounting=false
//        if(Math.abs(map.newX - map.x) < 1)
//            map.newX = 0
//        if(Math.abs(map.newY - map.y) < 1)
//            map.newY = 0

//        if(map.newX == 0)
//            map.x -= (map.width - oldWidth) / 2
//        else
//            map.x = map.newX

//        if(map.newY == 0)
//            map.y -= (map.height - oldHeight) / 2
//        else
//            map.y = map.newY

        if (map.oldWidth<newWidth) {
            flickable.contentX += (map.width - map.oldWidth) / 2
            flickable.contentY += (map.height - map.oldHeight) / 2
        }
    }
    Image {
        id: map

        source: "Icons/spb0.svg"
        //width: main.width; height: main.height
        //fillMode: Image.PreserveAspectFit
        visible: true
        //smooth: true


        asynchronous: true

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

        property int oldHeight: 0
        property int oldWidth: 0
        property int oldX: 0


        property bool recounting: false

        onRecountingChanged: {
            if ((status==Image.Ready)&&(recounting==true))
                recount2()
        }

        onStatusChanged: {
            if ((status==Image.Ready)&&(recounting==true))
                recount2()
        }



        function setX(){
            newX = 0;
        }
        function setY(){
            newY = 0;
        }

        /*Behavior on x {
            enabled: animationEnabled
            NumberAnimation { duration: 500 }
        }
        Behavior on y {
            enabled: animationEnabled
            NumberAnimation { duration: 500 }
        }*/



        /*MouseArea {
            id: mouse
            anchors.fill: parent
            drag.target: map

            onReleased: {
                dragMap();
            }

            onClicked: {
                cityChooser.hide()
                dirChooser.hide()
                console.log(gps.position.coordinate.latitude);
            }
        }*/

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
}
