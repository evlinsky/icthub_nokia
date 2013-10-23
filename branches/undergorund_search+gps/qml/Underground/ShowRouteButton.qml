import QtQuick 1.0

Image {
    id: showRouteButton
    visible: false
    x: parent.width - 55
    y: parent.y + upFields.height
    source: "Icons/list.png"
    opacity: 1.0

    MouseArea {
        anchors.fill: parent
        onClicked: {
            main.state = "routeList"
        }
    }
}
