import QtQuick 1.0
//import CustomComponents 1.0

Flickable {
    id: flickable

    objectName: "mapFlickable"
    //boundsBehavior: Flickable.DragAndOvershootBounds;

    //onFlickStarted: //console.log("flicking")
    //onMovementStarted: //console.log("moving")

    flickableDirection: Flickable.HorizontalAndVerticalFlick

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

    property double sourceSizeHeight
    property double sourceSizeWidth


    property int oldHeight: 0
    property int oldWidth: 0
    property int oldX: 0
    property int oldValue: 0
    property bool recounting: false

    onRecountingChanged: {
        if ((mapImage.status==Image.Ready)&&(recounting==true))
            recount2()
    }

    contentWidth: sourceSizeWidth; contentHeight: sourceSizeHeight
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
        oldWidth = sourceSizeWidth
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
        contentY = (oldContentY + main.height/2)/oldHeight*newHeight - main.height/2
    }
    function recount2() {
        oldWidth = sourceSizeWidth
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
        contentY = (oldContentY + main.height/2)/oldHeight*newHeight - main.height/2
    }
    //MapImage {id: map}
}
