import QtQuick 1.0
import CustomComponents 1.0

MainWidget {
    //width: main.width/2
    //height: main.height/2
    //anchors.centerIn: parent
    //x: 100
    //y: 0
    parentHeight: main.height
    parentWidth: main.width
    property double zoom: (parentWidth * scale / xmlWidth);


}
