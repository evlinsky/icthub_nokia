import QtQuick 1.0
import "viewMap.js" as ViewScripts

Rectangle {
    width: main.width
    y: upFields.height
    height: main.height-y
    //color: "black"
    visible: false
    ListView {
        id: stationSearchListView

        y: 70
        x: parent.x
        height: parent.height-70//-upFields.height-inputRect.height-15
        width: parent.width


        model: stationSearchListModel
        visible: parent.visible
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
                    visible: !noFound
                }

                Text { x: 65; width: parent.width-x; height: parent.height
                    verticalAlignment: Text.AlignVCenter; text: fullName; wrapMode: Text.WordWrap}
                MouseArea {
                    visible: !noFound
                    anchors.fill: parent
                    onClicked: {
                        ViewScripts.stationChoice(fullName, 0, stationColor);
                        textInput.text=""
                    }
                }
                MouseArea {
                    visible: noFound
                    anchors.fill: parent
                    onClicked: {
                        textInput.text=""
                        main.state="mainWin"
                    }
                }
            }
        }
    }
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
            id: inputRect
            y: 10
            x: 10
            width: parent.width-20
            height: 50
            border.width: 1
            border.color: "black"

            TextInput {
                id: textInput

                x: 5
                y: 5
                height: 40
                width: parent.width-10

                font.pointSize: 10

                activeFocusOnPress: true

                onTextChanged: stationSearch(text)
                /*MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (!textInput.activeFocus) {
                            textInput.forceActiveFocus()
                            textInput.openSoftwareInputPanel();
                        } else {
                            textInput.focus = false;
                        }
                    }
                    onPressAndHold: textInput.closeSoftwareInputPanel();
                }*/
            }
        }

        //color: "black"
    }


    function stationSearch(input) {
        stationSearchListModel.clear()
        var stations = mapModel.searchStations(input);
        var count=mapModel.getSearchQuantity();
        for(var i = 0; i < count; ++i)
        {
            stationSearchListModel.append({fullName:stations[i]["fullName"],
                                    stationColor:stations[i]["stationColor"],
                                    _id:stations[i]["id"],
                                    noFound: false})
        }
        if (count==0)
        {
            stationSearchListModel.append({fullName:"Не найдено",
                                          stationColor:"white",
                                    _id:-1,
                                    noFound: true})
        }
    }
}
