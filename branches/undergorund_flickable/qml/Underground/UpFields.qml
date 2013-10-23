import QtQuick 1.0

Rectangle{
    id: textWindow
    x:0
    y:0
    width: main.width
    height: 70

    color: "#0079C2"


    property bool stationList1Selected: false
    property bool stationList2Selected: false
    property string station1Text
    property string station1CircleColor: "white"
    property bool station1CircleVisible: false
    property string station2Text
    property string station2CircleColor: "white"
    property bool station2CircleVisible: false
    Rectangle {
        x:0
        y:0
        width: parent.width/2
        height: parent.height
        radius: 5

        color: "#27408B"
        visible: stationList1Selected
    }
    Rectangle {
        x:parent.width/2
        y:0
        width: parent.width/2
        height: parent.height
        radius: 5

        color: "#27408B"

        visible: stationList2Selected
    }

    Rectangle {
        id: station1
        x: 10
        y: 10
        width: parent.width/2-x*2
        height: parent.height-y*2
        border.width: 1
        border.color: textWindow.color
        radius: 10
        smooth: true
        gradient: Gradient {
            GradientStop { position: 1.0; color: "#ffffff" }
            GradientStop { position: 0.0; color: "#ebebeb" }
        }
        Text {
            //id: station1Text
            width: parent.width-station1circle.x-station1circle.width-station1Delete.height
            height: parent.height-1
            verticalAlignment: Text.AlignVCenter
            x: station1circle.x+station1circle.width+5
            text: station1Text
            wrapMode: Text.WordWrap
            font.pixelSize: {return 12}
        }
        Rectangle {
            id: station1circle
            x: 5; y: 15; width: 20; height: 20; radius: 20
            smooth: true
            color: station1CircleColor
            visible: station1CircleVisible
        }
    }
    MouseArea{
        id: fromMouse
        height: parent.height
        width: parent.width/2
        onClicked:
        {
            if (main.state!="stationList1")
                main.state = "stationList1"
            else
            {
                if ((station1Text=="")||(station2Text==""))
                    main.state = "mainWin"
                else
                    main.state = "routeMap"
            }
        }
    }
    Rectangle {
        id: station1Delete
        width: 35
        height: 35
        //x: parent.width/2-width-station1.x
        //y: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.right:  station1.right
        anchors.rightMargin: 5

        radius: 10
       // rotation: 90
        smooth: true
        color: "#CCD7E3"

        Image {
            x: parent.width/2-8
            y: parent.height/2-8
            width: 16
            height: 16
            fillMode: Image.PreserveAspectFit
            smooth: true
            source: {
                if (station1Text!="")
                    return "Icons/delete.svg"
                else
                    return "Icons/book_open.png"
            }
        }

        MouseArea{
            id: clearStation1
            anchors.fill: parent
            onClicked: {
                if (station1Text!="") {
                    station1Text=""
                    main.state="mainWin"
                    station1CircleColor="white"
                    station1CircleVisible=false
                    slider.value2=0
                    main.clearWay();
                }
                else {
                    if (main.state!="stationList1")
                        main.state = "stationList1"
                    else
                    {
                        if ((station1Text=="")||(station2Text==""))
                            main.state = "mainWin"
                        else
                            main.state = "routeMap"
                    }
                }
            }
        }
    }

    Rectangle {
        id: station2
        width: parent.width/2-20
        height: parent.height-y*2
        x: parent.width/2+10
        y: 10
        color: "white"
        border.width: 1
        border.color: textWindow.color
        radius: 10
        smooth: true
        gradient: Gradient {
            GradientStop { position: 1.0; color: "#ffffff" }
            GradientStop { position: 0.0; color: "#ebebeb" }
        }

        Rectangle {
            id: station2circle
            x: 5; y: 15; width: 20; height: 20; radius: 20
            smooth: true
            color: station2CircleColor
            visible: station2CircleVisible
        }
        Text {
            //id: station2Text
            width: parent.width-station2circle.x-station2circle.width-station2Delete.height
            height: parent.height-1
            verticalAlignment: Text.AlignVCenter
            x: station2circle.x+station2circle.width+5
            text: station2Text
            wrapMode: Text.WordWrap
            font.pixelSize: {return 12}

        }
    }
    MouseArea{
        id: toMouse
        height: parent.height
        width: parent.width/2
        x: parent.width/2
        onClicked: {
            if (main.state!="stationList2")
                main.state = "stationList2"
            else {
                if ((station1Text=="")||(station2Text==""))
                    main.state = "mainWin"
                else
                    main.state = "routeMap"
            }
        }
    }
    Rectangle {
        id: station2Delete
        width: 35
        height: 35
        //x: parent.width/2-width-station1.x
        //y: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.right:  station2.right
        anchors.rightMargin: 5
        radius: 10
        smooth: true

        color: "#CCD7E3"

        Image {
            x: parent.width/2-8
            y: parent.height/2-8
            width: 16
            height: 16
            fillMode: Image.PreserveAspectFit
            smooth: true
            source: {
                if (station2Text!="")
                    return "Icons/delete.svg"
                else
                    return "Icons/book_open.png"
            }
        }

        MouseArea{
            id: clearStation2
            anchors.fill: parent
            onClicked:
            if (station2Text!="") {
                station2Text=""
                main.state="mainWin"
                station2CircleColor="white"
                station2CircleVisible=false
                slider.value2=0
                main.clearWay();
            }
            else {
                if (main.state!="stationList2")
                    main.state = "stationList2"
                else
                {
                    if ((station1Text=="")||(station2Text==""))
                        main.state = "mainWin"
                    else
                        main.state = "routeMap"
                }
            }
        }
    }

    function mouseOn(){
        fromMouse.enabled = true
        toMouse.enabled = true
        clearStation1 = true
        clearStation2 = true
    }

    function mouseOff(){
        fromMouse.enabled = false
        toMouse.enabled = false
        clearStation1 = false
        clearStation2 = false
    }

}
