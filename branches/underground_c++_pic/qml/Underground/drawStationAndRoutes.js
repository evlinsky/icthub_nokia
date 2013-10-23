var stationComponent = Qt.createComponent("Station.qml");
var circleComponent = Qt.createComponent("Circle.qml");
var lineComponent = Qt.createComponent("Line.qml");
var circleTransComponent = Qt.createComponent("TransitionCircle.qml");
var stations = new Array;
var lines = new Array;
var circles = new Array

var constWidth = 480
var constHeight = 596.16

var station;
var timeout = 0;

function sortNumber(a,b)
{
    return a.id - b.id;
}
function showEdges(route){
    var linex1,linex2,liney1,liney2,lineOrX1,lineOrY1,lineOrX2,lineOrY2;
    var zoom = map.sourceSizeWidth/main.width
    for (var i=0; i<lines.length; ++i) {
        lines[i].visible = false;
        lines[i].destroy();
    }
    lines = new Array;
    for(var j =  1; j < route.length ; j++ ){
        var edge = route[j]
        if(edge.x3 != -1){
            lineOrX1 = edge.x1  +((main.width)-(map.sourceSizeWidth/zoom))/2;
            lineOrY1 = edge.y1   +((main.height)-(map.sourceSizeHeight/zoom))/2;
            lineOrX2 = edge.x3  +((main.width)-(map.sourceSizeWidth/zoom))/2;
            lineOrY2 = edge.y3   +((main.height)-(map.sourceSizeHeight/zoom))/2;
            var line = lineComponent.createObject(mapImage);
            line.x1 = lineOrX1 * zoom;
            line.x2 = lineOrX2 * zoom;
            line.y1 = lineOrY1 * zoom;
            line.y2 = lineOrY2 * zoom;
            line.oldX1 = lineOrX1;
            line.oldY1 = lineOrY1;
            line.oldX2 = lineOrX2;
            line.oldY2 = lineOrY2;
            line.penWidth = mapModel.getFont() * zoom;
            line.orPen =  mapModel.getFont();
            lines.push(line);
            if(edge.x4 != -1){
                lineOrX1 = edge.x3  +((main.width)-(map.sourceSizeWidth/zoom))/2;
                lineOrY1 = edge.y3   +((main.height)-(map.sourceSizeHeight/zoom))/2;
                lineOrX2 = edge.x4  +((main.width)-(map.sourceSizeWidth/zoom))/2;
                lineOrY2 = edge.y4   +((main.height)-(map.sourceSizeHeight/zoom))/2;
                line = lineComponent.createObject(mapImage);
                line.x1 = lineOrX1 * zoom;
                line.x2 = lineOrX2 * zoom;
                line.y1 = lineOrY1 * zoom;
                line.y2 = lineOrY2 * zoom;
                line.oldX1 = lineOrX1;
                line.oldY1 = lineOrY1;
                line.oldX2 = lineOrX2;
                line.oldY2 = lineOrY2;
                line.penWidth = mapModel.getFont() * zoom;
                line.orPen =  mapModel.getFont();
                lines.push(line);
                lineOrX1 = edge.x4  +((main.width)-(map.sourceSizeWidth/zoom))/2;
                lineOrY1 = edge.y4   +((main.height)-(map.sourceSizeHeight/zoom))/2;
                lineOrX2 = edge.x2  +((main.width)-(map.sourceSizeWidth/zoom))/2;
                lineOrY2 = edge.y2   +((main.height)-(map.sourceSizeHeight/zoom))/2;
                var line = lineComponent.createObject(mapImage);
                line.x1 = lineOrX1 * zoom;
                line.x2 = lineOrX2 * zoom;
                line.y1 = lineOrY1 * zoom;
                line.y2 = lineOrY2 * zoom;
                line.oldX1 = lineOrX1;
                line.oldY1 = lineOrY1;
                line.oldX2 = lineOrX2;
                line.oldY2 = lineOrY2;
                line.penWidth = mapModel.getFont() * zoom;
                line.orPen =  mapModel.getFont();
                lines.push(line);
            }else{
                lineOrX1 = edge.x3  +((main.width)-(map.sourceSizeWidth/zoom))/2;
                lineOrY1 = edge.y3   +((main.height)-(map.sourceSizeHeight/zoom))/2;
                lineOrX2 = edge.x2  +((main.width)-(map.sourceSizeWidth/zoom))/2;
                lineOrY2 = edge.y2   +((main.height)-(map.sourceSizeHeight/zoom))/2;
                var line = lineComponent.createObject(mapImage);
                line.x1 = lineOrX1 * zoom;
                line.x2 = lineOrX2 * zoom;
                line.y1 = lineOrY1 * zoom;
                line.y2 = lineOrY2 * zoom;
                line.oldX1 = lineOrX1;
                line.oldY1 = lineOrY1;
                line.oldX2 = lineOrX2;
                line.oldY2 = lineOrY2;
                line.penWidth = mapModel.getFont() * zoom;
                line.orPen =  mapModel.getFont();
                lines.push(line);
            }
        }
        else{
            lineOrX1 = edge.x1  +((main.width)-(map.sourceSizeWidth/zoom))/2;
            lineOrY1 = edge.y1   +((main.height)-(map.sourceSizeHeight/zoom))/2;
            lineOrX2 = edge.x2  +((main.width)-(map.sourceSizeWidth/zoom))/2;
            lineOrY2 = edge.y2   +((main.height)-(map.sourceSizeHeight/zoom))/2;
            var line = lineComponent.createObject(mapImage);
            line.x1 = lineOrX1 * zoom;
            line.x2 = lineOrX2 * zoom;
            line.y1 = lineOrY1 * zoom;
            line.y2 = lineOrY2 * zoom;
            line.oldX1 = lineOrX1;
            line.oldY1 = lineOrY1;
            line.oldX2 = lineOrX2;
            line.oldY2 = lineOrY2;
            line.penWidth = mapModel.getFont() * zoom;
            line.orPen =  mapModel.getFont();
            lines.push(line);
        }
    }
}

function showWayOld(route) {
    var zoom = map.sourceSizeWidth/main.width

    var linex1,linex2,liney1,liney2,lineOrX1,lineOrY1,lineOrX2,lineOrY2;
    for (var i=0; i<lines.length; ++i) {
        lines[i].destroy();
    }
    lines = new Array;
    for (i=0; i<stations.length; ++i) {
        stations[i].stationColor = stationListModel.get(i).stationColor;
        stations[i].bold = false;
    }
    timeout = 0
    for(j =  1; j < route.length ; j++ ){
        lineOrX1 = route[j-1].x  +((main.width)-(map.sourceSizeWidth/zoom))/2;
        lineOrY1 = (route[j-1].y   +((main.height)-(map.sourceSizeHeight/zoom))/2);
        lineOrX2 = route[j].x  +((main.width)-(map.sourceSizeWidth/zoom))/2;
        lineOrY2 = route[j].y   +((main.height)-(map.sourceSizeHeight/zoom))/2;
        var line = lineComponent.createObject(mapImage);

        line.x1 = lineOrX1 * zoom;
        line.x2 = lineOrX2 * zoom;
        line.y1 = lineOrY1 * zoom;
        line.y2 = lineOrY2 * zoom;
        line.oldX1 = lineOrX1;
        line.oldY1 = lineOrY1;
        line.oldX2 = lineOrX2;
        line.oldY2 = lineOrY2;
        line.penWidth = mapModel.getFont() * zoom;
        line.orPen =  mapModel.getFont();
        lines.push(line);




    }

}
function showWay(route) {
    var MaxY=0,MaxX=0,MinY=9999,MinX=9999;
    var zoom = mainWidget.getCoef()
    //map.sourceSizeWidth/main.width
    route.reverse();

    var linex1,linex2,liney1,liney2,lineOrX1,lineOrY1,lineOrX2,lineOrY2,color;
    for (var i=0; i<lines.length; ++i) {
        lines[i].destroy();
    }
    for (i=0; i<circles.length; ++i) {
        circles[i].visible = false;
        //circles[i].stop()
        circles[i].destroy();
    }
    circles = new Array;
    lines = new Array;
    //    for (i=0; i<stations.length; ++i) {
    //        stations[i].stationColor = stationListModel.get(i).stationColor;
    //        stations[i].opacity = 0.2;
    //    }
    //    for(var j =  0; j < route.length ; j++ ){
    //        for (i=0; i<stations.length; ++i)   {
    //            if(stations[i].fullName == route[j].fullName){
    //                stations[i].opacity = 1;
    //            }
    //        }
    //    }
    ////console.log("route length"+route.length)
    for (i=0; i<stations.length; ++i) {
        stations[i].update();
    }

    for(var j =  1; j < route.length ; j++ ){
        /*for (i=0; i<stations.length; ++i){
            if(stations[i].fullName == route[j].fullName){
                color = stationListModel.get(i).stationColor;
            }
        }*/


        ////console.log(j)
        if(route[route.length-1].fullName == route[0].fullName){
            return
        }

        stations[(mapModel.getStationIdByName(route[j-1].fullName) - 1)].opacity = 1;
        stations[(mapModel.getStationIdByName(route[j].fullName) - 1)].opacity = 1;
        color = stationListModel.get(mapModel.getStationIdByName(route[j-1].fullName) - 1).stationColor;
        var color2 = stationListModel.get(mapModel.getStationIdByName(route[j].fullName) - 1).stationColor;
        ////console.log(color)
        var edge = mapModel.getEdge(route[j-1].id,route[j].id)
        //console.log(map.sourceSizeWidth + " " + zoom + " " + mapModel.getXmlWidth())
        //console.log(map.sourceSizeHeight + " " + zoom + " " + mapModel.getXmlHeight())
        lineOrX1 = edge.x1
        lineOrY1 = edge.y1
        lineOrX2 = edge.x2
        lineOrY2 = edge.y2
        var isTrans1 = mapModel.isTransition(route[j-1].id);
        var isTrans2 = mapModel.isTransition(route[j].id);
        var center1  = mapModel.getCircle(route[j-1].id);
        var center2  = mapModel.getCircle(route[j].id);
        var byLegs = edge.byLegs

        if (j==1 && !isTrans1) {
            var circle = circleComponent.createObject(mainWidget);
            circle.oldsize = mapModel.getFont() * 1.5
            circle.radius = circle.height = circle.width = circle.oldsize * zoom
            circle.xold = lineOrX1
            circle.yold = lineOrY1
            circle.x = circle.xold* zoom  - circle.oldsize* zoom/2;
            circle.y = circle.yold* zoom  - circle.oldsize* zoom/2;
            circle.oldColor = color;

            circles.push(circle)
        }
        if (j==1 && isTrans1 && center1.x != -1) {
            circle = circleComponent.createObject(mainWidget);
            circle.oldsize = mapModel.getFont() * 1.5
            circle.radius = circle.height = circle.width = circle.oldsize * zoom
            circle.xold = center1.x
            circle.yold = center1.y
            circle.x = circle.xold* zoom - circle.oldsize* zoom/2;
            circle.y = circle.yold * zoom- circle.oldsize* zoom/2;
            circle.oldColor = color;

            circles.push(circle)
        }
        if(!isTrans2){
            circle = circleComponent.createObject(mainWidget);
            circle.oldsize = mapModel.getFont() * 1.5
            circle.radius = circle.height = circle.width = circle.oldsize * zoom
            circle.xold = lineOrX2
            circle.yold = lineOrY2
            circle.x = circle.xold * zoom - circle.oldsize*zoom/2;
            circle.y = circle.yold * zoom - circle.oldsize*zoom/2;
            circle.oldColor = color2;
            circles.push(circle)
        }else if(center2.x != -1){
            circle = circleComponent.createObject(mainWidget);
            circle.oldsize = mapModel.getFont() * 1.5
            circle.radius = circle.height = circle.width = circle.oldsize * zoom
            circle.xold = center2.x
            circle.yold = center2.y
            circle.x = circle.xold * zoom - circle.oldsize*zoom/2;
            circle.y = circle.yold * zoom - circle.oldsize*zoom/2;
            circle.oldColor = color2;
            circles.push(circle)
        }

        if(j + 1 == route.length && !isTrans2){
            color = stationListModel.get(mapModel.getStationIdByName(route[j].fullName) - 1).stationColor;
            circle = circleComponent.createObject(mainWidget);
            circle.oldsize = mapModel.getFont() *  1.5
            circle.radius = circle.height = circle.width = circle.oldsize * zoom
            circle.xold = lineOrX2
            circle.yold = lineOrY2
            circle.x = circle.xold * zoom - circle.oldsize*zoom/2;
            circle.y = circle.yold * zoom - circle.oldsize*zoom/2;
            circle.oldColor = color2;


            //circle.color = color;
            //circle.oldsize = 5

            circles.push(circle)
        }


        /*if(edge.byLegs || isTrans){
            var tran = circleTransComponent.createObject(mapImage);


            if(isTrans && !edge.byLegs){
                edge = mapModel.getEdge(route[j-1].id,isTrans)
                tran.rotate = false;
            }

            tran.oldsize = mapModel.getFont()*10/4;
            tran.xold = edge.x3  +((main.width)-(map.sourceSizeWidth/zoom))/2
            tran.yold = edge.y3   +((main.height)-(map.sourceSizeHeight/zoom))/2
            tran.x = tran.xold * zoom - tran.oldsize*zoom/2
            tran.y = tran.yold * zoom - tran.oldsize*zoom/2
            tran.height = tran.width = tran.radius = tran.oldsize * zoom;
            tran.stationColor1 = stationListModel.get(route[j].id -1).stationColor
            tran.stationColor2 = stationListModel.get(route[j-1].id - 1).stationColor
            tran.border.color = tran.stationColor1
            tran.start(500)

            circles.push(tran);
        }*/
        if(byLegs){
            //    j++;
        }
    }
    for(j =  1; j < route.length ; j++ ){
        edge = mapModel.getEdge(route[j-1].id,route[j].id)
        if(!edge.byLegs){
            if(edge.x3 != -1){
                lineOrX1 = edge.x1
                lineOrY1 = edge.y1
                lineOrX2 = edge.x3
                lineOrY2 = edge.y3
                var line = lineComponent.createObject(mainWidget);
                line.x1 = lineOrX1 * zoom;
                line.x2 = lineOrX2 * zoom;
                line.y1 = lineOrY1 * zoom;
                line.y2 = lineOrY2 * zoom;
                line.color = stationListModel.get(route[j-1].id - 1).stationColor
                line.oldX1 = lineOrX1;
                line.oldY1 = lineOrY1;
                line.oldX2 = lineOrX2;
                line.oldY2 = lineOrY2;
                line.penWidth = mapModel.getFont()*0.6 * zoom;
                line.orPen =  mapModel.getFont() *0.6;
                lines.push(line);
                if(edge.x4 != -1){
                    lineOrX1 = edge.x3
                    lineOrY1 = edge.y3
                    lineOrX2 = edge.x4
                    lineOrY2 = edge.y4
                    line = lineComponent.createObject(mainWidget);
                    line.x1 = lineOrX1 * zoom;
                    line.x2 = lineOrX2 * zoom;
                    line.y1 = lineOrY1 * zoom;
                    line.y2 = lineOrY2 * zoom;
                    line.color = stationListModel.get(route[j-1].id - 1).stationColor
                    line.oldX1 = lineOrX1;
                    line.oldY1 = lineOrY1;
                    line.oldX2 = lineOrX2;
                    line.oldY2 = lineOrY2;
                    line.penWidth = mapModel.getFont()*0.6 * zoom;
                    line.orPen =  mapModel.getFont() *0.6;
                    lines.push(line);
                    lineOrX1 = edge.x4
                    lineOrY1 = edge.y4
                    lineOrX2 = edge.x2
                    lineOrY2 = edge.y2
                    var line = lineComponent.createObject(mainWidget);
                    line.x1 = lineOrX1 * zoom;
                    line.x2 = lineOrX2 * zoom;
                    line.y1 = lineOrY1 * zoom;
                    line.y2 = lineOrY2 * zoom;
                    line.color = stationListModel.get(route[j-1].id - 1).stationColor
                    line.oldX1 = lineOrX1;
                    line.oldY1 = lineOrY1;
                    line.oldX2 = lineOrX2;
                    line.oldY2 = lineOrY2;
                    line.penWidth = mapModel.getFont()*0.6 * zoom;
                    line.orPen =  mapModel.getFont() *0.6;
                    lines.push(line);
                }else{
                    lineOrX1 = edge.x3
                    lineOrY1 = edge.y3
                    lineOrX2 = edge.x2
                    lineOrY2 = edge.y2mainWid
                    var line = lineComponent.createObject(mainWidget);

                    line.x1 = lineOrX1 * zoom;
                    line.x2 = lineOrX2 * zoom;
                    line.y1 = lineOrY1 * zoom;
                    line.y2 = lineOrY2 * zoom;
                    line.color = stationListModel.get(route[j-1].id - 1).stationColor
                    line.oldX1 = lineOrX1;
                    line.oldY1 = lineOrY1;
                    line.oldX2 = lineOrX2;
                    line.oldY2 = lineOrY2;
                    line.penWidth = mapModel.getFont()*0.6 * zoom;
                    line.orPen =  mapModel.getFont() *0.6;
                    lines.push(line);
                }
            }
            else{
                lineOrX1 = edge.x1
                lineOrY1 = edge.y1
                lineOrX2 = edge.x2
                lineOrY2 = edge.y2
                var line = lineComponent.createObject(mainWidget);

                //console.log(lineOrX1 + " " + lineOrY1 + " " + lineOrX2 + " " + lineOrY2)
                //console.log(mainWidget.height + " " + mainWidget.width)
                line.x1 = lineOrX1 * zoom;
                line.x2 = lineOrX2 * zoom;
                line.y1 = lineOrY1 * zoom;
                line.y2 = lineOrY2 * zoom;
                line.color = stationListModel.get(route[j-1].id - 1).stationColor
                line.oldX1 = lineOrX1;
                line.oldY1 = lineOrY1;
                line.oldX2 = lineOrX2;
                line.oldY2 = lineOrY2;
                line.penWidth = mapModel.getFont()*0.6 * zoom;
                line.orPen =  mapModel.getFont() *0.6;
                lines.push(line);
            }




        }
        MaxX = Math.max(MaxX,lineOrX1);
        MaxY = Math.max(MaxY,lineOrY1);
        MinX = Math.min(MinX,lineOrX1);
        MinY = Math.min(MinY,lineOrY1);
        MaxX = Math.max(MaxX,lineOrX2);
        MaxY = Math.max(MaxY,lineOrY2);
        MinX = Math.min(MinX,lineOrX2);
        MinY = Math.min(MinY,lineOrY2);
    }
    if(route.length > 1){
        zoomToWay(MaxX,MinX,MaxY,MinY);
    }

}
function zoomToWay(x1,x2,y1,y2){
    //console.log(x1 + ":" + y1 + " " + x2 + ":" + y2 + " " + map.width)
    var xrange = Math.abs(x1-x2);
    var yrange = Math.abs(y1-y2);
    var zoom = mainWidget.getCoef()
    var xzoom = ((xrange*zoom)/mainWidget.scale)/map.width
    var yzoom = ((yrange*zoom)/mainWidget.scale)/map.height
    //console.log(xzoom + ":" + yzoom + ":" + zoom)
    var xCenter = ((x1+x2)/2)*zoom/mainWidget.scale
    var yCenter = ((y1+y2)/2)*zoom/mainWidget.scale
    //console.log("Scale:" + mainWidget.scale)
    slider.value2 = Math.min(1/xzoom,1/yzoom)
    //console.log("Scale:" + mainWidget.scale)
    map.contentX = (xCenter*mainWidget.scale - map.width/2)
    map.contentY = (yCenter*mainWidget.scale - map.height/2)
    //console.log(xCenter + ":" + yCenter)
    //console.log(map.contentX + ":" + map.contentY)

    //    if(xrange > 5000 || yrange > 5000){
    //        xrange = 3;
    //        yrange = 3;
    //        x1 = x2 = y1 = y2 = 0
    //    }

    //    var xzoom = (main.width-60)/xrange
    //    var yzoom = (main.height-180)/yrange
    //    var zoom = Math.min(xzoom,yzoom)
    //    zoom=((Math.min(xzoom,yzoom))*2-1)
    //    if(zoom > 4)
    //        zoom = 4
    //    slider.value2 = zoom
    //    mapImage.tempX1 = x1
    //    mapImage.tempX2 = x2
    //    mapImage.tempY1 = y1
    //    mapImage.tempY2 = y2

    //    mapImage.changing=true

}
function changeXYToWay() {

    //    mapImage.tempX = (-1)*((mapImage.tempX1 + mapImage.tempX2)/2)/main.width*map.sourceSizeWidth - 25 + (main.width)/2;
    //    mapImage.tempY = (-1)*((mapImage.tempY1 + mapImage.tempY2)/2)/main.height*map.sourceSizeHeight - 25 + (main.height)/2;

    //    if(mapImage.tempX > 0){
    //        mapImage.tempX = 0
    //    }
    //    if(mapImage.tempY > 100){
    //        mapImage.tempY = 100
    //    }

    //    mapImage.x = mapImage.tempX
    //    mapImage.y = mapImage.tempY
    //    mapImage.changing=false
}

function clearWay(){
    mainWidget.opacity = 1
    for (var i=0; i<stations.length; ++i) {
        stations[i].textColor = stationListModel.get(i).stationColor;

        stations[i].opacity = 1;
    }
    for (i=0; i<lines.length; ++i) {
        lines[i].visible = false;
        lines[i].destroy();
    }
    for (i=0; i<circles.length; ++i) {
        circles[i].visible = false;
        circles[i].destroy();
    }
    lines = new Array;
    circles = new Array;
    //slider.value = 0;
    //map.newX = 0
    //map.newY = 0
}

function destroyStations(){
    for (var i=0; i<stationListModel.count && i < stations.length; ++i) {

        stations[i].visible = false;
        stations[i].destroy();

    }
    stations = new Array;
}
function update(){
    var zoom = mainWidget.zoom
    for (var i=0;i < stations.length; ++i) {

        stations[i].x = stations[i].originalX * zoom
        stations[i].y = stations[i].originalY * zoom
        stations[i].width = stations[i].originalWidth * zoom
        stations[i].height = stations[i].originalHeight * zoom
        stations[i].textFont = stations[i].originalFont * zoom
        stations[i].letterSpacing = stations[i].originalLetterSpacing * zoom
        stations[i].opacity = mainWidget.opacity

    }
}

function fill() {
    destroyStations()
    for (var i=0; i<stationListModel.count; ++i) {
        station = stationComponent.createObject(mainWidget);
        station.originalX = (stationListModel.get(i).X)
        station.originalY = (stationListModel.get(i).Y)
        station.originalWidth = stationListModel.get(i).Width
        station.originalHeight = stationListModel.get(i).Height
        station.fullName = stationListModel.get(i).fullName
        station.name = stationListModel.get(i).name
        station.stationColor = stationListModel.get(i).stationColor
        station.textColor = station.stationColor
        station.halign = stationListModel.get(i).HAlign;
        station.valign = stationListModel.get(i).VAlign;

        //console.log(station.originalX)
        //console.log(station.originalY)
        //console.log(station.originalWidth)
        //console.log(station.originalHeight)

        station.originalFont = mapModel.getFont()
        station.originalLetterSpacing = -1
        station.update()

        stations.push(station);
    }
}



