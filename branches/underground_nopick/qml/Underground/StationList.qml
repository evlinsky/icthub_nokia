import QtQuick 1.0
import "viewMap.js" as ViewScripts

ListView {
    id: stationListView

    x: parent.x
    height: parent.height-upFields.height
    width: parent.width
    y: upFields.height


    model: stationListModel
    visible: false
    delegate: Row {
            Rectangle {
                id: stationListText
                width: stationListView.width
                height: 70
                gradient: Gradient {
                    GradientStop { position: 1.0; color: "#27408B" }
                    GradientStop { position: 0.5; color: "#3A5FCD" }
                    GradientStop { position: 0.0; color: "#27408B" }
                }
                Rectangle{
                    x: 5
                    y: 5
                    radius: 10
                    width: parent.width-10
                    height: parent.height-10
                    gradient: Gradient {
                        GradientStop { position: 1.0; color: "#ffffff" }
                        GradientStop { position: 0.0; color: "#ebebeb" }
                    }
                    smooth: true
                }
                Rectangle {
                    x: 25; y: (parent.height-height)/2; width: 25; height: 25; radius: 25
                    color: stationColor
                    smooth: true
                }

                Text { x: 65; width: parent.width-x; height: parent.height
                    verticalAlignment: Text.AlignVCenter; text: fullName; wrapMode: Text.WordWrap}
                MouseArea {
                    id: stationList
                    anchors.fill: parent
                    onClicked: {
                        ViewScripts.stationChoice(fullName, 0, stationColor);
                    }
                }
            }
        }
}
