import QtQuick 1.0

Image {

    function showDialog(  ){
        state = "enabled";
    }

    function hideDialog(  ){
        state = "disabled";
        disabled( )
    }

    signal disabled

    id: dialog;
    opacity: 0
    x: 180;        y: 50

    source: "img/quit_menu.png"


    MouseArea{
        id: noReply
        width: 0; height: 0
        x: 0; y: 0;
        onClicked: hideDialog( )
    }

    MouseArea{
        id: yesReply
        width: 0; height: 0
        x: Math.round(parent.width/2); y: 0
        onClicked: Qt.quit( )
    }

    states: State {
        name: "enabled";
        PropertyChanges { target: noReply; width: Math.round(parent.width/2)-1; height: parent.height; }
        PropertyChanges { target: yesReply; width: Math.round(parent.width/2); height: parent.height; }
        PropertyChanges { target: dialog; opacity: 1 }
    }
    State {
        name: "disabled";
        PropertyChanges { target: noReply; width: 0; height: 0; }
        PropertyChanges { target: yesReply; width: 0; height: 0; }
        PropertyChanges { target: dialog; opacity: 0 }
    }
}



