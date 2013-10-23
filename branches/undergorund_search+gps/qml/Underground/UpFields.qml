import QtQuick 1.0
import "viewMap.js" as ViewScripts

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
    property int byLegCost: 0;



    Rectangle{
        id: upperRoute
        x:0
        y:70
        width: main.width - 60
        height: 30
        opacity: 1
        visible:showRouteButton.visible
        //color: "white"
        color: "transparent"
        /*gradient: Gradient{
            GradientStop { position: 1.0; color: "#27408B" }
            GradientStop { position: 0.5; color: "transparent" }
            GradientStop { position: 0.0; color: "#4876FF" }
        }*/
        ListView {
            id: routeListView
            anchors.fill: parent
            anchors.verticalCenter: parent.verticalCenter
            orientation:  ListView.Horizontal
            spacing: -2;
            property string routeNum: "1:";
            property int nRouteNum: 0;
            //cacheBuffer: width
            header: Rectangle {
                x:0
                y:0
                height: 30
                width: 30
                color: "transparent"
                Text {
                    //anchors.fill: parent
                    //horizontalAlignment: Text.AlignHCenter
                    //verticalAlignment: Text.AlignTop
                    color: "#0079C2"
                    font.pixelSize: 20
                    text: routeListView.routeNum
                }
            }
            footer: Rectangle {
                x:0
                y:0
                height: 30
                width: 90
                color: "transparent"
                Text {
                    id: timeText
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignRight
                    //verticalAlignment: Text.AlignTop
                    color: "#0079C2"
                    font.pixelSize: 20
                    text: timeInRoute
                }
            }

            model: routeListModel
            //visible: false
            delegate: Row {
                spacing: -2
                Rectangle {
                    visible: upperRoute.byLeg(index)
                    width: 15; height:15; radius: 15
                    y:6
                    color: Color
                    smooth: true
                }
                Rectangle {
                    visible: upperRoute.oneWay(index)
                    width: 3; height: 10;
                    y: 8
                    color: Color
                    smooth: true
                }
                Rectangle {
                    visible: !upperRoute.byLeg(index)
                    width: 5; height: 10;
                    y: 8
                    color: Color
                    smooth: true
                }
            }
            onMovementStarted: {
                var costs = mapModel.getRoutesNum()
                nRouteNum++;
                if(costs.length == nRouteNum){
                    nRouteNum = 0
                }
                textWindow.byLegCost = costs[nRouteNum]
                routeNum = (nRouteNum+1) + ":"

                if(costs.length > 1)
                    ViewScripts.makeRoute(upFields.station1Text, upFields.station2Text)

            }
        }

        function byLeg(index){
            ////console.log(index)
            if(index + 1 >= routeListModel.count || index === 0)
                return true
            if(routeListModel.get(index).Color != routeListModel.get(index + 1).Color)
                return true
            if(routeListModel.get(index).Color != routeListModel.get(index - 1).Color)
                return true
            return false
        }
        function oneWay(index){
            if(index + 2 > routeListModel.count)
                return false
            if(index > 0)
                if(index + 2 === routeListModel.count && (routeListModel.get(index).Color != routeListModel.get(index - 1).Color))
                    return true
            if(index + 2 < routeListModel.count)
                if(index === 0 && (routeListModel.get(index + 1).Color != routeListModel.get(index + 2).Color))
                    return true
            if(index === 0)
                return false
            if(routeListModel.get(index).Color != routeListModel.get(index - 1).Color)
                if(routeListModel.get(index + 1).Color != routeListModel.get(index + 2).Color)
                    return true;
            return false
        }

    }

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
            //main.color="red"
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
                    main.clearWay();
                    main.state="mainWin"
                    station1CircleColor="white"
                    station1CircleVisible=false
                    //slider.value2=0
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
                    main.clearWay();
                    main.state="mainWin"
                    station2CircleColor="white"
                    station2CircleVisible=false
                    //slider.value2=0
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
