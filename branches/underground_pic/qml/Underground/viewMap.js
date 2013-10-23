function getRouteTime(station1, station2, byLegCost){
    var Station1Id = mapModel.getStationIdByName(station1);
    var Station2Id = mapModel.getStationIdByName(station2);
    var route = mapModel.getRoute(Station1Id,Station2Id,upFields.byLegCost);
    var route0 = mapModel.getRoute(Station1Id,Station2Id,100);
    var route1 = mapModel.getRoute(Station1Id,Station2Id,0);
    var route2 = mapModel.getRoute(Station1Id,Station2Id,-3);

    if(route0 === route1)
        //console.log("route0 === route1")
    if(route0 === route2)
        //console.log("route0 === route2")
    if(route2 === route1)
        //console.log("route2 === route1")

    var routeTime = 0
    var tripTime
    for(var i = route.length - 1; i > 0; i --){
        tripTime = mapModel.getTimeBtwnStations(route[i]["id"],route[i-1]["id"]);
        routeTime += tripTime;
    }
    return routeTime;
}

function makeRoute(station1, station2){
    var Station1Id = mapModel.getStationIdByName(station1);
    var Station2Id = mapModel.getStationIdByName(station2);
    var route = mapModel.getRoute(Station1Id,Station2Id,upFields.byLegCost);
    var stationTimes = new Array
    routeListModel.clear();
    routeList.val = 0;
    stationTimes.push(new Date())
    var tripTime
    for(var i = route.length - 1; i > 0; i --){
        tripTime = mapModel.getTimeBtwnStations(route[i]["id"],route[i-1]["id"]);
        routeList.val += tripTime;
        var curTime = new Date()
        curTime.setMinutes(curTime.getMinutes() + routeList.val)
        stationTimes.push(curTime)
    }


    for(i = route.length - 1; i >= 0 ; i --){
         var min = stationTimes[route.length - i - 1].getMinutes();
        routeListModel.append({string: route[i]["fullName"], time: stationTimes[route.length - i - 1].getHours() + ":" + ((min < 10 ? '0' : '') + min), change:false, Color: route[i]["color"]});

    }
    if(route.length == 1){
        routeListModel.append({string: route[0]["fullName"], change:false, Color: route[0]["color"]});
    }


    routeTime.text = routeList.val + "мин";
    routeTime.visible = true
    routeTime.start();
    main.showRoute(route);
    main.state="routeMap";
}

function createStationList() {

    for(var i=0; i < stationListModel.count; i++){
        stationListModel.get(i).visible = false;
    }
    stationListModel.clear();


    var numStations = mapModel.getQuantity();
    var masStations = mapModel.getStations();
    for(i = 0; i < numStations; ++i)
    {
        stationListModel.append({fullName:masStations[i]["fullName"],
                                name:masStations[i]["name"],
                                opacity:1,
                                stationColor:masStations[i]["stationColor"],
                                X:masStations[i]["x"],
                                Y:masStations[i]["y"],
                                Width:masStations[i]["width"],
                                Height:masStations[i]["height"],
                                HAlign:masStations[i]["HAlign"],
                                VAlign:masStations[i]["VAlign"],
                                _id:masStations[i]["id"],
                                latitude:masStations[i]["latitude"],
                                longitude:masStations[i]["longitude"]})
    }

}

function stationChoice(name, id2, stationColor) {
    if ( (main.state == "stationList1") || (id2 == 1) || (main.state == "stationSearch1") ) {
        upFields.station1Text = name
        upFields.station1CircleColor = stationColor
        upFields.station1CircleVisible = true
    }
    if ( (main.state=="stationList2") || (id2==2)  || (main.state == "stationSearch2")) {
        upFields.station2Text = name
        upFields.station2CircleColor = stationColor
        upFields.station2CircleVisible = true
    }
    main.state= "mainWin"
    if ( (upFields.station1Text != "") && (upFields.station2Text!="") )
        makeRoute(upFields.station1Text, upFields.station2Text);
}

function reloadMap(){
    mapModel.reloadMap();
}
