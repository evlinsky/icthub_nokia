import QtQuick 1.0
import Qt.labs.gestures 1.0


GestureArea {
    anchors.fill: parent
    focus: true

    // Only some of the many gesture properties are shown. See Gesture documentation.

    /*onTap:
        //console.log("tap pos = (",gesture.position.x,",",gesture.position.y,")")
    onTapAndHold:
        //console.log("tap and hold pos = (",gesture.position.x,",",gesture.position.y,")")
    onPan:
        //console.log("pan delta = (",gesture.delta.x,",",gesture.delta.y,") acceleration = ",gesture.acceleration)
    */
    onPinch:{
        routeTime.text = "Pinch!!";
        //routeTime.visible = true
        routeTime.start();
        if (gesture.scaleFactor>0)
            slider.value2++;
        else
            slider.value2--;
    }
        //slider.value2 = gesture.scaleFactor
        ////console.log("pinch center = (",gesture.centerPoint.x,",",gesture.centerPoint.y,") rotation =",gesture.rotationAngle," scale =",gesture.scaleFactor)
    /*onSwipe:
        //console.log("swipe angle=",gesture.swipeAngle)
    onGesture:
        //console.log("gesture hot spot = (",gesture.hotSpot.x,",",gesture.hotSpot.y,")")
    */
}
