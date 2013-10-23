import QtQuick 1.0
import Qt 4.7
import QtMobility.location 1.1

PositionSource {
    id: positionSource
    updateInterval: 100000000

    active: true

    property real latitude: position.coordinate.latitude
    property real longitude: position.coordinate.longitude
    property int closestStation: 0

       //nmeaSource: "nmealog.txt"

    function getClosestStation() {
        console.log(stationListModel.count)
        var diff;
        var diffLa;
        var diffLo;
        var min=100;
        var num=0;
        for (var i=0; i<stationListModel.count; ++i) {
            diffLa=latitude-stationListModel.get(i)["latitude"]
            diffLo=longitude-stationListModel.get(i)["longitude"]
            diff=Math.sqrt(diffLa*diffLa+diffLo*diffLo)
            if (diff<min){
                min=diff;
                num=i;
            }
        }
        closestStation=num;
    }
}
