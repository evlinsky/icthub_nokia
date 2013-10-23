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
            lineOrX1 = edge.x1*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.sourceSizeWidth/zoom))/2;
            lineOrY1 = edge.y1*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.sourceSizeHeight/zoom))/2;
            lineOrX2 = edge.x3*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.sourceSizeWidth/zoom))/2;
            lineOrY2 = edge.y3*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.sourceSizeHeight/zoom))/2;
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
                lineOrX1 = edge.x3*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.sourceSizeWidth/zoom))/2;
                lineOrY1 = edge.y3*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.sourceSizeHeight/zoom))/2;
                lineOrX2 = edge.x4*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.sourceSizeWidth/zoom))/2;
                lineOrY2 = edge.y4*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.sourceSizeHeight/zoom))/2;
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
                lineOrX1 = edge.x4*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.sourceSizeWidth/zoom))/2;
                lineOrY1 = edge.y4*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.sourceSizeHeight/zoom))/2;
                lineOrX2 = edge.x2*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.sourceSizeWidth/zoom))/2;
                lineOrY2 = edge.y2*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.sourceSizeHeight/zoom))/2;
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
                lineOrX1 = edge.x3*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.sourceSizeWidth/zoom))/2;
                lineOrY1 = edge.y3*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.sourceSizeHeight/zoom))/2;
                lineOrX2 = edge.x2*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.sourceSizeWidth/zoom))/2;
                lineOrY2 = edge.y2*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.sourceSizeHeight/zoom))/2;
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
            lineOrX1 = edge.x1*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.sourceSizeWidth/zoom))/2;
            lineOrY1 = edge.y1*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.sourceSizeHeight/zoom))/2;
            lineOrX2 = edge.x2*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.sourceSizeWidth/zoom))/2;
            lineOrY2 = edge.y2*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.sourceSizeHeight/zoom))/2;
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
        lineOrX1 = route[j-1].x*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.sourceSizeWidth/zoom))/2;
        lineOrY1 = (route[j-1].y*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.sourceSizeHeight/zoom))/2);
        lineOrX2 = route[j].x*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.sourceSizeWidth/zoom))/2;
        lineOrY2 = route[j].y*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.sourceSizeHeight/zoom))/2;
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
    var zoom = map.sourceSizeWidth/main.width
    //var zoom = map.sourceSizeHeight/main.height
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
    for(var j =  1; j < route.length ; j++ ){
        /*for (i=0; i<stations.length; ++i){
            if(stations[i].fullName == route[j].fullName){
                color = stationListModel.get(i).stationColor;
            }
        }*/

        ////console.log(j)
        color = stationListModel.get(mapModel.getStationIdByName(route[j-1].fullName) - 1).stationColor;
        var color2 = stationListModel.get(mapModel.getStationIdByName(route[j].fullName) - 1).stationColor;
        ////console.log(color)
        var edge = mapModel.getEdge(route[j-1].id,route[j].id)
        //console.log(map.sourceSizeWidth + " " + zoom + " " + mapModel.getXmlWidth())
        //console.log(map.sourceSizeHeight + " " + zoom + " " + mapModel.getXmlHeight())
        lineOrX1 = edge.x1*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()
        lineOrY1 = edge.y1*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()
        lineOrX2 = edge.x2*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()
        lineOrY2 = edge.y2*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()
        var isTrans1 = mapModel.isTransition(route[j-1].id);
        var isTrans2 = mapModel.isTransition(route[j].id);
        var center1  = mapModel.getCircle(route[j-1].id);
        var center2  = mapModel.getCircle(route[j].id);
        var byLegs = edge.byLegs

        if (j==1 && !isTrans1) {
            var circle = circleComponent.createObject(routeRect);
            circle.oldsize = mapModel.getFont() * 1.4
            circle.radius = circle.height = circle.width = circle.oldsize * zoom
            circle.xold = lineOrX1
            circle.yold = lineOrY1
            circle.x = circle.xold * zoom - circle.oldsize*zoom/2;
            circle.y = circle.yold * zoom - circle.oldsize*zoom/2;
            circle.oldColor = color;

            circles.push(circle)
        }
        if (j==1 && isTrans1 && center1.x != -1) {
            circle = circleComponent.createObject(routeRect);
            circle.oldsize = mapModel.getFont() * 1.4
            circle.radius = circle.height = circle.width = circle.oldsize * zoom
            circle.xold = center1.x*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()
            circle.yold = center1.y*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()
            circle.x = circle.xold * zoom - circle.oldsize*zoom/2;
            circle.y = circle.yold * zoom - circle.oldsize*zoom/2;
            circle.oldColor = color;

            circles.push(circle)
        }
        if(!isTrans2){
            circle = circleComponent.createObject(routeRect);
            circle.oldsize = mapModel.getFont() * 1.4
            circle.radius = circle.height = circle.width = circle.oldsize * zoom
            circle.xold = lineOrX2
            circle.yold = lineOrY2
            circle.x = circle.xold * zoom - circle.oldsize*zoom/2;
            circle.y = circle.yold * zoom - circle.oldsize*zoom/2;
            circle.oldColor = color2;
            circles.push(circle)
        }else if(center2.x != -1){
            circle = circleComponent.createObject(routeRect);
            circle.oldsize = mapModel.getFont() * 1.4
            circle.radius = circle.height = circle.width = circle.oldsize * zoom
            circle.xold = center2.x*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()
            circle.yold = center2.y*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()
            circle.x = circle.xold * zoom - circle.oldsize*zoom/2;
            circle.y = circle.yold * zoom - circle.oldsize*zoom/2;
            circle.oldColor = color2;
            circles.push(circle)
        }

        if(j + 1 == route.length && !isTrans2){
            color = stationListModel.get(mapModel.getStationIdByName(route[j].fullName) - 1).stationColor;
            circle = circleComponent.createObject(routeRect);
            circle.oldsize = mapModel.getFont() * 1.4
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
            tran.xold = edge.x3*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.sourceSizeWidth/zoom))/2
            tran.yold = edge.y3*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.sourceSizeHeight/zoom))/2
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
                lineOrX1 = edge.x1*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()
                lineOrY1 = edge.y1*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()
                lineOrX2 = edge.x3*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()
                lineOrY2 = edge.y3*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()
                var line = lineComponent.createObject(routeRect);
                line.x1 = lineOrX1 * zoom;
                line.x2 = lineOrX2 * zoom;
                line.y1 = lineOrY1 * zoom;
                line.y2 = lineOrY2 * zoom;
                line.color = stationListModel.get(route[j-1].id - 1).stationColor
                line.oldX1 = lineOrX1;
                line.oldY1 = lineOrY1;
                line.oldX2 = lineOrX2;
                line.oldY2 = lineOrY2;
                line.penWidth = mapModel.getFont() * zoom;
                line.orPen =  mapModel.getFont();
                lines.push(line);
                if(edge.x4 != -1){
                    lineOrX1 = edge.x3*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()
                    lineOrY1 = edge.y3*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()
                    lineOrX2 = edge.x4*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()
                    lineOrY2 = edge.y4*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()
                    line = lineComponent.createObject(routeRect);
                    line.x1 = lineOrX1 * zoom;
                    line.x2 = lineOrX2 * zoom;
                    line.y1 = lineOrY1 * zoom;
                    line.y2 = lineOrY2 * zoom;
                    line.color = stationListModel.get(route[j-1].id - 1).stationColor
                    line.oldX1 = lineOrX1;
                    line.oldY1 = lineOrY1;
                    line.oldX2 = lineOrX2;
                    line.oldY2 = lineOrY2;
                    line.penWidth = mapModel.getFont() * zoom;
                    line.orPen =  mapModel.getFont();
                    lines.push(line);
                    lineOrX1 = edge.x4*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()
                    lineOrY1 = edge.y4*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()
                    lineOrX2 = edge.x2*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()
                    lineOrY2 = edge.y2*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()
                    var line = lineComponent.createObject(routeRect);
                    line.x1 = lineOrX1 * zoom;
                    line.x2 = lineOrX2 * zoom;
                    line.y1 = lineOrY1 * zoom;
                    line.y2 = lineOrY2 * zoom;
                    line.color = stationListModel.get(route[j-1].id - 1).stationColor
                    line.oldX1 = lineOrX1;
                    line.oldY1 = lineOrY1;
                    line.oldX2 = lineOrX2;
                    line.oldY2 = lineOrY2;
                    line.penWidth = mapModel.getFont() * zoom;
                    line.orPen =  mapModel.getFont();
                    lines.push(line);
                }else{
                    lineOrX1 = edge.x3*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()
                    lineOrY1 = edge.y3*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()
                    lineOrX2 = edge.x2*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()
                    lineOrY2 = edge.y2*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()
                    var line = lineComponent.createObject(routeRect);

                    line.x1 = lineOrX1 * zoom;
                    line.x2 = lineOrX2 * zoom;
                    line.y1 = lineOrY1 * zoom;
                    line.y2 = lineOrY2 * zoom;
                    line.color = stationListModel.get(route[j-1].id - 1).stationColor
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
                lineOrX1 = edge.x1*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()
                lineOrY1 = edge.y1*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()
                lineOrX2 = edge.x2*(map.sourceSizeWidth/zoom)/mapModel.getXmlWidth()
                lineOrY2 = edge.y2*(map.sourceSizeHeight/zoom)/mapModel.getXmlHeight()
                var line = lineComponent.createObject(routeRect);

                //console.log(lineOrX1 + " " + lineOrY1 + " " + lineOrX2 + " " + lineOrY2)
                //console.log(routeRect.height + " " + routeRect.width)
                line.x1 = lineOrX1 * zoom;
                line.x2 = lineOrX2 * zoom;
                line.y1 = lineOrY1 * zoom;
                line.y2 = lineOrY2 * zoom;
                line.color = stationListModel.get(route[j-1].id - 1).stationColor
                line.oldX1 = lineOrX1;
                line.oldY1 = lineOrY1;
                line.oldX2 = lineOrX2;
                line.oldY2 = lineOrY2;
                line.penWidth = mapModel.getFont() * zoom;
                line.orPen =  mapModel.getFont();
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
        //zoomToWay(MaxX,MinX,MaxY,MinY);
    }

}
function zoomToWay(x1,x2,y1,y2){
//    var xrange = Math.abs(x1-x2);
//    var yrange = Math.abs(y1-y2);
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
    for (var i=0; i<stationListModel.count; ++i) {

        stations[i].visible = false;
        stations[i].destroy();

    }
    stations = new Array;
}

function fill() {
    for (var i=0; i<stationListModel.count; ++i) {
        station = stationComponent.createObject(mapImage);
        station.originalX = (stationListModel.get(i).X)*map.sourceSizeWidth/mapModel.getXmlWidth()
        station.originalY = (stationListModel.get(i).Y)*map.sourceSizeHeight/mapModel.getXmlHeight()
        station.originalWidth = stationListModel.get(i).Width*map.sourceSizeWidth/mapModel.getXmlWidth();
        station.originalHeight = stationListModel.get(i).Height*map.sourceSizeHeight/mapModel.getXmlHeight();
        station.fullName = stationListModel.get(i).fullName
        station.name = stationListModel.get(i).name
        station.stationColor = stationListModel.get(i).stationColor
        station.textColor = station.stationColor
        station.halign = stationListModel.get(i).HAlign;
        station.valign = stationListModel.get(i).VAlign;

        ////console.log(station.originalHeight)

        station.originalFont = mapModel.getFont()*map.sourceSizeWidth/constWidth
        station.originalLetterSpacing = -1*map.sourceSizeWidth/constWidth

        stations.push(station);
    }
}



