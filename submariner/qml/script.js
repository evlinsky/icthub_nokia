var startRouteVector, endRouteVector, nextBoat, leftSide, rightSide;
var game, routeIndex, direction, score, weapon;
var interval, currentInt, currNavi;
var soundEnabled = 1;
var hapticEnabled = 1;
var TORPEDO_SIZE = 15;
var SHIP_SPEED = 23500;

function initGame( )
{
    game = 1;   
    timer.running = true;

    if ( direction == "right" )
        { reverseNavigation( ); }

    direction = "left";    

    // fixed points for torpedo-routes (start and end respectively)
    startRouteVector = [ 244, 289, 334, 379, 424, 469, 514, 559, 604, 649, 694, 739 ];
    endRouteVector = [ 200, 253, 306, 359, 412, 465, 518, 571, 624, 677, 730, 783 ];
    nextBoat = 1;
    interval = 80;
    leftSide = 100;
    rightSide = 853;
    currentInt = interval;
    score = 0;
    weapon = 10;
    currNavi = Array( 3 );
    boat1.x = rightSide; boat2.x = rightSide; boat3.x = rightSide;
    scoreTxt.text =  ": "  + score;
    weaponTxt.text = ": "  + weapon;
}

function timerTriggered( )
{
    var localArr = new Array( );
    if ( moveBoat1.running )
        localArr.push( boat1.x );
    if ( moveBoat2.running )
        localArr.push( boat2.x );
    if ( moveBoat3.running )
        localArr.push( boat3.x );

    localArr.sort( );

    if ( direction == "left" ){
        if ( (rightSide - localArr[ localArr.length - 1 ]) > 315 )
            startBoat( );
    }
    else{
        if ( (localArr[0] - leftSide) > 315 )
            startBoat( );
    }
}

function startBoat( )
{
    switch ( nextBoat % 3 )
    {
    case 1:
        if ( moveBoat1.running ) { nextBoat++; startBoat( ); break; }
        if ( direction == "left" )
            { moveBoat1.from = rightSide; moveBoat1.to = leftSide; }
        else { moveBoat1.from = leftSide; moveBoat1.to = rightSide; }
        moveBoat1.duration = SHIP_SPEED;
        moveBoat1.start( );
        break;
    case 2:
        if ( moveBoat2.running ) { nextBoat++; startBoat( ); break; }
        if ( direction == "left" )
            { moveBoat2.from = rightSide; moveBoat2.to = leftSide; }
        else { moveBoat2.from = leftSide; moveBoat2.to = rightSide; }
        moveBoat2.duration = SHIP_SPEED;
        moveBoat2.start( );
        break;
    case 0:
        if ( moveBoat3.running ) { nextBoat++; startBoat( ); break; }
        if ( direction == "left" )
            { moveBoat3.from = rightSide; moveBoat3.to = leftSide; }
        else { moveBoat3.from = leftSide; moveBoat3.to = rightSide; }
        moveBoat3.duration = SHIP_SPEED;
        moveBoat3.start( );
        break;
    }
    nextBoat++;    
}

function setRoute( mX )
{   
   var localRoute;
   weaponTxt.text = ": "  + --weapon;
   localRoute = -1;
   for(var i = 0; i < endRouteVector.length; i++){
       if ( mX < (endRouteVector[i] + TORPEDO_SIZE/2) )
       { localRoute = i; break; }
   }

   switch ( localRoute )
   {
   case -1: // rightmost route
       torpedo.x = startRouteVector[endRouteVector.length-1];
       torpedo.y = endRouteVector[endRouteVector.length-1];
       break;
   case 0:  // leftmost route
       torpedo.x = startRouteVector[0];
       torpedo.y = endRouteVector[0];
       break;
   default: // obtain the nearest route (to the center of periscope)
       if ( (endRouteVector[localRoute] + TORPEDO_SIZE/2 - mX) > (mX - endRouteVector[localRoute-1] + TORPEDO_SIZE/2) ){
           torpedo.x = startRouteVector[localRoute-1];
           torpedo.y = endRouteVector[localRoute-1];
           routeIndex = localRoute-1;
       }
       else { torpedo.x = startRouteVector[localRoute]; torpedo.y = endRouteVector[localRoute]; routeIndex = localRoute; }
       break;
   }
}

function treatShot( )
{
    var edge = [];
    var HIT_X_CORRECTION = 61;
    var HIT_Y_CORRECTION = 95;

    // setting correction for ship edge (shipboard)
    direction == "left" ? edge = [[8,49], [2,57], [4,42]] : edge = [[3,44], [0,56], [2,51]];

    if ( ( (endRouteVector[routeIndex] + TORPEDO_SIZE) > (boat1.x+edge[0][0]) ) && (endRouteVector[routeIndex] < (boat1.x+edge[0][1])) ){
        scoreTxt.text =  ": "  + ++score;
        if ( hapticEnabled ) crashEffect.running = true;
        if ( soundEnabled ) crashSound.play( );
        hit.switchHitOn( endRouteVector[routeIndex] - HIT_X_CORRECTION, HIT_Y_CORRECTION );
        pauseNavigation( );
        reverseNavigation( );
        return;
    }
    if ( ( (endRouteVector[routeIndex] + TORPEDO_SIZE) > (boat2.x+edge[1][0]) ) && (endRouteVector[routeIndex] < (boat2.x+edge[1][1])) ){
        scoreTxt.text =  ": "  + ++score;
        if ( hapticEnabled ) crashEffect.running = true;
        if ( soundEnabled ) crashSound.play( );
        hit.switchHitOn( endRouteVector[routeIndex] - HIT_X_CORRECTION, HIT_Y_CORRECTION );
        pauseNavigation( );
        reverseNavigation( );
        return;
    }
    if ( ( (endRouteVector[routeIndex] + TORPEDO_SIZE) > (boat3.x+edge[2][0])) && (endRouteVector[routeIndex] < (boat3.x+edge[2][1])) ){
        scoreTxt.text =  ": "  + ++score;
        if ( hapticEnabled ) crashEffect.running = true;
        if ( soundEnabled ) crashSound.play( );
        hit.switchHitOn( endRouteVector[routeIndex] - HIT_X_CORRECTION, HIT_Y_CORRECTION );
        pauseNavigation( );
        reverseNavigation( );
        return;
    }

    if ( !weapon ) { pauseNavigation( ); game = 0; }
}

function reverseNavigation( )
{
    var finish;
    var TOTAL_ROUTE_LEN = 753;

    boat1.rotateBoat( );
    boat2.rotateBoat( );
    boat3.rotateBoat( );
    direction == "left" ? finish = rightSide : finish = leftSide;

    if ( currNavi[0] ){
        moveBoat1.from = boat1.x;
        moveBoat1.to = finish;
        moveBoat1.duration = Math.abs(boat1.x-finish)*SHIP_SPEED/TOTAL_ROUTE_LEN;
    }
    if ( currNavi[1] ){
        moveBoat2.from = boat2.x;
        moveBoat2.to = finish;
        moveBoat2.duration = Math.abs(boat2.x-finish)*SHIP_SPEED/TOTAL_ROUTE_LEN;
    }
    if ( currNavi[2] ){
        moveBoat3.from = boat3.x;
        moveBoat3.to = finish;
        moveBoat3.duration = Math.abs(boat3.x-finish)*SHIP_SPEED/TOTAL_ROUTE_LEN;
    }

    direction == "left" ? direction = "right" : direction = "left";
}

function pauseNavigation( )
{
    if ( moveBoat1.running )
        currNavi[0] = 1;
    if ( moveBoat2.running )
        currNavi[1] = 1;
    if ( moveBoat3.running )
        currNavi[2] = 1;

    timer.stop( );
    moveBoat1.stop( );
    moveBoat2.stop( );
    moveBoat3.stop( );
}

function continueNavigation( )
{
    if ( !weapon )
        { hit.switchHitOff( ); game = 0; return; }
    hit.switchHitOff( )
    if ( currNavi[0] ) moveBoat1.start( );
    if ( currNavi[1] ) moveBoat2.start( );
    if ( currNavi[2] ) moveBoat3.start( );
    timer.start( );
}

function soundModeChanged( )
{
    soundEnabled = !soundEnabled;
    if ( soundEnabled ) soundTxt.color = "yellow"; else soundTxt.color = "gray";
}

function hapticModeChanged( )
{
    hapticEnabled = !hapticEnabled;
    if ( hapticEnabled ) hapticTxt.color = "yellow"; else hapticTxt.color = "gray";
}


function getSpeed( )
{
    return SHIP_SPEED;
}

function pauseGame( )
{
    timer.stop( );
    moveBoat1.pause( );
    moveBoat2.pause( );
    moveBoat3.pause( );
}

function resumeGame( )
{
    timer.start( );
    moveBoat1.resume( );
    moveBoat2.resume( );
    moveBoat3.resume( );
}
