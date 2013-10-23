import QtQuick 1.0

Rectangle {
    id: routeList
    visible: false
    x: parent.x
    y: parent.y+upFields.height
    width: parent.width
    height: parent.height-y
    property int val: 0

    ListView {
        id: routeListView

        height: parent.height-showMapButton.height-timeTextRect.height
        width: parent.width
        y: timeTextRect.height
        x: 5

        model: routeListModel
        //visible: false
        delegate: Row {

            Rectangle {
                visible: !change
                y: 5; width: 20; height: 20; radius: 20
                color: Color
                smooth: true
            }
            Text {height: 30; text: string; color:Color; visible: !change; verticalAlignment: Text.AlignVCenter}
            Rectangle{
                x:290 ;
                Text { text: time; visible: !change; verticalAlignment: Text.AlignVCenter;
                    font.bold: true}
            }
            Text { text: string; visible: change; color: "red"}
        }
    }


    Rectangle {
        id: timeTextRect
        x: 0; y: 0; width: parent.width-55; height: 50
        color: "white"
        border.width: 2
        border.color: "white"
        Text {
            id: timeText
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "black"
            text: "Общее время: "+val +" мин"
        }
    }


    Image {
        id: showMapButton
        x: parent.width - 55
        y: 0
        source: "Icons/map.png"
        opacity: 1.0

        MouseArea {
            anchors.fill: parent
            onClicked: {
                main.state = "routeMap"
            }
        }
    }
}
