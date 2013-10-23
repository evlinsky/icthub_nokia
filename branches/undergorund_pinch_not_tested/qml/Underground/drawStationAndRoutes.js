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
    var zoom = map.paintedWidth/main.width
    for (var i=0; i<lines.length; ++i) {
        lines[i].visible = false;
        lines[i].destroy();
    }
    lines = new Array;
    for(var j =  1; j < route.length ; j++ ){
        var edge = route[j]
        if(edge.x3 != -1){
            lineOrX1 = edge.x1*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
            lineOrY1 = edge.y1*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
            lineOrX2 = edge.x3*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
            lineOrY2 = edge.y3*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
            var line = lineComponent.createObject(map);
            line.x1 = lineOrX1 * zoom;
            line.x2 = lineOrX2 * zoom;
            line.y1 = lineOrY1 * zoom;
            line.y2 = lineOrY2 * zoom;
            line.oldX1 = lineOrX1;
            line.oldY1 = lineOrY1;
            line.oldX2 = lineOrX2;
            line.oldY2 = lineOrY2;
            line.penWidth = mapModel.getLinePen() * zoom;
            line.orPen =  mapModel.getLinePen() ;
            lines.push(line);
            if(edge.x4 != -1){
                lineOrX1 = edge.x3*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
                lineOrY1 = edge.y3*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
                lineOrX2 = edge.x4*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
                lineOrY2 = edge.y4*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
                line = lineComponent.createObject(map);
                line.x1 = lineOrX1 * zoom;
                line.x2 = lineOrX2 * zoom;
                line.y1 = lineOrY1 * zoom;
                line.y2 = lineOrY2 * zoom;
                line.oldX1 = lineOrX1;
                line.oldY1 = lineOrY1;
                line.oldX2 = lineOrX2;
                line.oldY2 = lineOrY2;
                line.penWidth = mapModel.getLinePen() * zoom;
                line.orPen =  mapModel.getLinePen() ;
                lines.push(line);
                lineOrX1 = edge.x4*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
                lineOrY1 = edge.y4*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
                lineOrX2 = edge.x2*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
                lineOrY2 = edge.y2*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
                var line = lineComponent.createObject(map);
                line.x1 = lineOrX1 * zoom;
                line.x2 = lineOrX2 * zoom;
                line.y1 = lineOrY1 * zoom;
                line.y2 = lineOrY2 * zoom;
                line.oldX1 = lineOrX1;
                line.oldY1 = lineOrY1;
                line.oldX2 = lineOrX2;
                line.oldY2 = lineOrY2;
                line.penWidth = mapModel.getLinePen() * zoom;
                line.orPen =  mapModel.getLinePen() ;
                lines.push(line);
            }else{
                lineOrX1 = edge.x3*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
                lineOrY1 = edge.y3*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
                lineOrX2 = edge.x2*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
                lineOrY2 = edge.y2*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
                var line = lineComponent.createObject(map);
                line.x1 = lineOrX1 * zoom;
                line.x2 = lineOrX2 * zoom;
                line.y1 = lineOrY1 * zoom;
                line.y2 = lineOrY2 * zoom;
                line.oldX1 = lineOrX1;
                line.oldY1 = lineOrY1;
                line.oldX2 = lineOrX2;
                line.oldY2 = lineOrY2;
                line.penWidth = mapModel.getLinePen() * zoom;
                line.orPen =  mapModel.getLinePen() ;
                lines.push(line);
            }
        }
        else{
            lineOrX1 = edge.x1*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
            lineOrY1 = edge.y1*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
            lineOrX2 = edge.x2*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
            lineOrY2 = edge.y2*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
            var line = lineComponent.createObject(map);
            line.x1 = lineOrX1 * zoom;
            line.x2 = lineOrX2 * zoom;
            line.y1 = lineOrY1 * zoom;
            line.y2 = lineOrY2 * zoom;
            line.oldX1 = lineOrX1;
            line.oldY1 = lineOrY1;
            line.oldX2 = lineOrX2;
            line.oldY2 = lineOrY2;
            line.penWidth = mapModel.getLinePen() * zoom;
            line.orPen =  mapModel.getLinePen() ;
            lines.push(line);
        }
    }
}

function showWayOld(route) {
    var zoom = map.paintedWidth/main.width

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
        lineOrX1 = route[j-1].x*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
        lineOrY1 = (route[j-1].y*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2);
        lineOrX2 = route[j].x*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
        lineOrY2 = route[j].y*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
        var line = lineComponent.createObject(map);

        line.x1 = lineOrX1 * zoom;
        line.x2 = lineOrX2 * zoom;
        line.y1 = lineOrY1 * zoom;
        line.y2 = lineOrY2 * zoom;
        line.oldX1 = lineOrX1;
        line.oldY1 = lineOrY1;
        line.oldX2 = lineOrX2;
        line.oldY2 = lineOrY2;
        line.penWidth = mapModel.getLinePen() * zoom;
        line.orPen =  mapModel.getLinePen() ;
        lines.push(line);




    }

}
function showWay(route) {
    var MaxY=0,MaxX=0,MinY=9999,MinX=9999;
    var zoom = map.paintedWidth/main.width
    route.reverse();

    var linex1,linex2,liney1,liney2,lineOrX1,lineOrY1,lineOrX2,lineOrY2,color;
    for (var i=0; i<lines.length; ++i) {
        lines[i].destroy();
    }
    for (i=0; i<circles.length; ++i) {
        circles[i].visible = false;
        circles[i].stop()
        circles[i].destroy();
    }
    circles = new Array;
    lines = new Array;
    for (i=0; i<stations.length; ++i) {
        stations[i].stationColor = stationListModel.get(i).stationColor;
        stations[i].opacity = 0.2;
    }
    for(var j =  0; j < route.length ; j++ ){
        for (i=0; i<stations.length; ++i)   {
            if(stations[i].fullName == route[j].fullName){
                stations[i].opacity = 1;
            }
        }
    }
    for(j =  1; j < route.length ; j++ ){
        for (i=0; i<stations.length; ++i){
            if(stations[i].fullName == route[j].fullName){
                color = stationListModel.get(i).stationColor;
            }
        }
        var edge = mapModel.getEdge(route[j-1].id,route[j].id)
        lineOrX1 = edge.x1*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
        lineOrY1 = edge.y1*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
        lineOrX2 = edge.x2*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
        lineOrY2 = edge.y2*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
        var isTrans = mapModel.isTransition(route[j-1].id);
        var byLegs = edge.byLegs
        if(edge.byLegs || isTrans){
            var tran = circleTransComponent.createObject(map);


            if(isTrans && !edge.byLegs){
                edge = mapModel.getEdge(route[j-1].id,isTrans)
                tran.rotate = false;
            }

            tran.oldsize = mapModel.getFont()*10/4;
            tran.xold = edge.x3*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2
            tran.yold = edge.y3*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2
            tran.x = tran.xold * zoom - tran.oldsize*zoom/2
            tran.y = tran.yold * zoom - tran.oldsize*zoom/2
            tran.height = tran.width = tran.radius = tran.oldsize * zoom;
            tran.stationColor1 = stationListModel.get(route[j].id -1).stationColor
            tran.stationColor2 = stationListModel.get(route[j-1].id - 1).stationColor
            tran.border.color = tran.stationColor1
            tran.start(500)

            circles.push(tran);
        }
        if(byLegs){
            j++;
        }








    }
    for(j =  1; j < route.length ; j++ ){
        edge = mapModel.getEdge(route[j-1].id,route[j].id)
        if(!edge.byLegs){
            if(edge.x3 != -1){
                lineOrX1 = edge.x1*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
                lineOrY1 = edge.y1*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
                lineOrX2 = edge.x3*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
                lineOrY2 = edge.y3*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
                var line = lineComponent.createObject(map);
                line.x1 = lineOrX1 * zoom;
                line.x2 = lineOrX2 * zoom;
                line.y1 = lineOrY1 * zoom;
                line.y2 = lineOrY2 * zoom;
                line.color = stationListModel.get(route[j-1].id - 1).stationColor
                line.oldX1 = lineOrX1;
                line.oldY1 = lineOrY1;
                line.oldX2 = lineOrX2;
                line.oldY2 = lineOrY2;
                line.penWidth = mapModel.getLinePen() * zoom;
                line.orPen =  mapModel.getLinePen() ;
                lines.push(line);
                if(edge.x4 != -1){
                    lineOrX1 = edge.x3*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
                    lineOrY1 = edge.y3*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
                    lineOrX2 = edge.x4*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
                    lineOrY2 = edge.y4*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
                    line = lineComponent.createObject(map);
                    line.x1 = lineOrX1 * zoom;
                    line.x2 = lineOrX2 * zoom;
                    line.y1 = lineOrY1 * zoom;
                    line.y2 = lineOrY2 * zoom;
                    line.color = stationListModel.get(route[j-1].id - 1).stationColor
                    line.oldX1 = lineOrX1;
                    line.oldY1 = lineOrY1;
                    line.oldX2 = lineOrX2;
                    line.oldY2 = lineOrY2;
                    line.penWidth = mapModel.getLinePen() * zoom;
                    line.orPen =  mapModel.getLinePen() ;
                    lines.push(line);
                    lineOrX1 = edge.x4*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
                    lineOrY1 = edge.y4*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
                    lineOrX2 = edge.x2*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
                    lineOrY2 = edge.y2*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
                    var line = lineComponent.createObject(map);
                    line.x1 = lineOrX1 * zoom;
                    line.x2 = lineOrX2 * zoom;
                    line.y1 = lineOrY1 * zoom;
                    line.y2 = lineOrY2 * zoom;
                    line.color = stationListModel.get(route[j-1].id - 1).stationColor
                    line.oldX1 = lineOrX1;
                    line.oldY1 = lineOrY1;
                    line.oldX2 = lineOrX2;
                    line.oldY2 = lineOrY2;
                    line.penWidth = mapModel.getLinePen() * zoom;
                    line.orPen =  mapModel.getLinePen() ;
                    lines.push(line);
                }else{
                    lineOrX1 = edge.x3*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
                    lineOrY1 = edge.y3*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
                    lineOrX2 = edge.x2*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
                    lineOrY2 = edge.y2*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
                    var line = lineComponent.createObject(map);

                    line.x1 = lineOrX1 * zoom;
                    line.x2 = lineOrX2 * zoom;
                    line.y1 = lineOrY1 * zoom;
                    line.y2 = lineOrY2 * zoom;
                    line.color = stationListModel.get(route[j-1].id - 1).stationColor
                    line.oldX1 = lineOrX1;
                    line.oldY1 = lineOrY1;
                    line.oldX2 = lineOrX2;
                    line.oldY2 = lineOrY2;
                    line.penWidth = mapModel.getLinePen() * zoom;
                    line.orPen =  mapModel.getLinePen() ;
                    lines.push(line);
                }
            }
            else{
                lineOrX1 = edge.x1*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
                lineOrY1 = edge.y1*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
                lineOrX2 = edge.x2*(map.paintedWidth/zoom)/mapModel.getXmlWidth()+((main.width)-(map.paintedWidth/zoom))/2;
                lineOrY2 = edge.y2*(map.paintedHeight/zoom)/mapModel.getXmlHeight()+((main.height)-(map.paintedHeight/zoom))/2;
                var line = lineComponent.createObject(map);


                line.x1 = lineOrX1 * zoom;
                line.x2 = lineOrX2 * zoom;
                line.y1 = lineOrY1 * zoom;
                line.y2 = lineOrY2 * zoom;
                line.color = stationListModel.get(route[j-1].id - 1).stationColor
                line.oldX1 = lineOrX1;
                line.oldY1 = lineOrY1;
                line.oldX2 = lineOrX2;
                line.oldY2 = lineOrY2;
                line.penWidth = mapModel.getLinePen() * zoom;
                line.orPen =  mapModel.getLinePen() ;
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
    var xrange = Math.abs(x1-x2);
    var yrange = Math.abs(y1-y2);
    if(xrange > 5000 || yrange > 5000){
        xrange = 3;
        yrange = 3;
        x1 = x2 = y1 = y2 = 0
    }

    var xzoom = (main.width-60)/xrange
    var yzoom = (main.height-180)/yrange
    var zoom = Math.min(xzoom,yzoom)
    zoom=((Math.min(xzoom,yzoom))*2-1)
    if(zoom > 4)
        zoom = 4
    slider.value2 = zoom
    map.tempX1 = x1
    map.tempX2 = x2
    map.tempY1 = y1
    map.tempY2 = y2

    map.changing=true

}
function changeXYToWay() {

    map.tempX = (-1)*((map.tempX1 + map.tempX2)/2)/main.width*map.paintedWidth - 25 + (main.width)/2;
    map.tempY = (-1)*((map.tempY1 + map.tempY2)/2)/main.height*map.paintedHeight - 25 + (main.height)/2;

    if(map.tempX > 0){
        map.tempX = 0
    }
    if(map.tempY > 100){
        map.tempY = 100
    }

    map.x = map.tempX
    map.y = map.tempY
    map.changing=false
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
        circles[i].stop()
        circles[i].destroy();
    }
    lines = new Array;
    circles = new Array;
    slider.value = 0;
    map.newX = 0
    map.newY = 0
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
        station = stationComponent.createObject(map);
        station.originalX = (stationListModel.get(i).X)*map.paintedWidth/constWidth+(main.width-map.paintedWidth)/2;
        station.originalY = (stationListModel.get(i).Y)*map.paintedHeight/constHeight+(main.height-map.paintedHeight)/2;
        station.originalWidth = stationListModel.get(i).Width*map.paintedWidth/constWidth;
        station.originalHeight = stationListModel.get(i).Height*map.paintedHeight/constHeight;
        station.fullName = stationListModel.get(i).fullName
        station.name = stationListModel.get(i).name
        station.stationColor = stationListModel.get(i).stationColor
        station.textColor = station.stationColor
        station.halign = stationListModel.get(i).HAlign;
        station.valign = stationListModel.get(i).VAlign;

        station.originalFont = mapModel.getFont()*map.paintedWidth/constWidth
        station.originalLetterSpacing = -1*map.paintedWidth/constWidth

         stations.push(station);
    }
}



