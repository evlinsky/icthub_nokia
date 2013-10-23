Qt.include("model.js")

var crashTimer, speedTimer;
var sound = true;
var started, side, iterator;
var chicken, crashed;
var mode = "emulator"

function startGame( aGameType )
{
    started = true;
    crashTimer = 0;
    chicken = false;
    crashed = false;
    initModel( aGameType );
    speedTimer = getSpeedCoeff( );
    timer.running = true;

    if ( aGameType == "game A" )
    { gameAlabel.opacity = 1; gameBlabel.opacity = 0; }
    else { gameAlabel.opacity = 0; gameBlabel.opacity = 1; }

    scoreL.source = "img/" + mode + "/h_0.png";
    scoreL.opacity = 1;
    scoreM.opacity = 0;
    scoreH.opacity = 0;

    lost1.opacity = 0;
    lost2.opacity = 0;
    lost3.opacity = 0;

    penalty = 0;
    reDrawPenalty(penalty);
    chickenEscape( );
    chickenEscape( );
    chickenEscape( );
    chickenEscape( );
    chickenEscape( );
    rightCrash.opacity = 0;
    leftCrash.opacity = 0;
    crashed = false;
}

function onTimer( )
{
    if ( crashed ){
        if ( chicken ){
            if(!--crashTimer){
                chickenEscape( );
                crashTimer = 35;                
            }
        }
        else{
            if(!--crashTimer){
                for ( var f = 0; f < 4; f++ )
                    reDrawFeeder( f );
                rightCrash.opacity = 0;
                leftCrash.opacity = 0;
                crashed = false;
            }
        }
    }else if ( !speedTimer-- ){
        tick();        
        speedTimer = getSpeedCoeff( );
   }
}

function onButtonPressed( aKey )
{
    setPlayerPosition( aKey - 1 );
    switch ( aKey )
    {
        case 1: movePlayerToLftUp( );  break;
        case 2: movePlayerToRhtUp( );  break;
        case 3: movePlayerToLftDwn( ); break;
        case 4: movePlayerToRhtDwn( ); break;        
    }
}

function movePlayerToLftUp( )
{
    leftPlayer.opacity = 1;     rightPlayer.opacity = 0;
    luBasket.opacity = 1;       ruBasket.opacity = 0;
    ldBasket.opacity = 0;       rdBasket.opacity = 0;
}

function movePlayerToRhtUp( )
{
    leftPlayer.opacity = 0;     rightPlayer.opacity = 1;
    luBasket.opacity = 0;       ruBasket.opacity = 1;
    ldBasket.opacity = 0;       rdBasket.opacity = 0;
}

function movePlayerToLftDwn( )
{
    leftPlayer.opacity = 1;     rightPlayer.opacity = 0;
    luBasket.opacity = 0;       ruBasket.opacity = 0;
    ldBasket.opacity = 1;       rdBasket.opacity = 0;
}

function movePlayerToRhtDwn( )
{
    leftPlayer.opacity = 0;     rightPlayer.opacity = 1;
    luBasket.opacity = 0;       ruBasket.opacity = 0;
    ldBasket.opacity = 0;       rdBasket.opacity = 1;
}

function gamePause( )
{
    if ( started )
    timer.running ? timer.running = false : timer.running = true;
}

function reDrawFeeder( aFeedNum )
{
    var local;
    switch ( aFeedNum )
    {
        case 0:
            local = feeders[aFeedNum].reverse( );
            f0Pos1.opacity = local[0].toString( );
            f0Pos2.opacity = local[1].toString( );
            f0Pos3.opacity = local[2].toString( );
            f0Pos4.opacity = local[3].toString( );
            f0Pos5.opacity = local[4].toString( );
            feeders[aFeedNum].reverse( );
            break;
        case 1:
            local = feeders[aFeedNum];
            f1Pos1.opacity = local[4].toString( );
            f1Pos2.opacity = local[3].toString( );
            f1Pos3.opacity = local[2].toString( );
            f1Pos4.opacity = local[1].toString( );
            f1Pos5.opacity = local[0].toString( );
            break;
        case 2:
            local = feeders[aFeedNum].reverse( );
            f2Pos1.opacity = local[0].toString( );
            f2Pos2.opacity = local[1].toString( );
            f2Pos3.opacity = local[2].toString( );
            f2Pos4.opacity = local[3].toString( );
            f2Pos5.opacity = local[4].toString( );
            feeders[aFeedNum].reverse( );
            break;
        case 3:
            local = feeders[aFeedNum];
            f3Pos1.opacity = local[4].toString( );
            f3Pos2.opacity = local[3].toString( );
            f3Pos3.opacity = local[2].toString( );
            f3Pos4.opacity = local[1].toString( );
            f3Pos5.opacity = local[0].toString( );
            break;
    }
}

function reDrawScore( aNum )
{
    var tmp;

    if ( aNum )
        catchSound.play( );

    tmp = Math.floor( (aNum % 1000)/100 );
    if ( tmp ){
        scoreH.opacity = 1;
        scoreH.source = makeDigtSource( mode, tmp );
        tmp = Math.floor( (aNum % 100)/10 );
        scoreM.source = makeDigtSource( mode, tmp );
        tmp = aNum % 10;
        scoreL.source = makeDigtSource( mode, tmp );
    } else {
        tmp = Math.floor( (aNum % 100)/10 );
        if ( tmp ){
            scoreM.opacity = 1;
            scoreM.source = makeDigtSource( mode, tmp );
            tmp = aNum % 10;
            scoreL.source = makeDigtSource( mode, tmp );
        } else{
            tmp = aNum % 10;
            scoreL.source = makeDigtSource( mode, tmp );
        }
    }
}

function makeDigtSource( aMode, aNum )
{
    if(isNaN(aNum)){
        aNum = 0;
    }
   return "img/" + aMode + "/h_" + aNum + ".png";
}

function reDrawPenalty( aNum )
{
    switch ( aNum ){
    case 0: lost1.animationRunning = false;lost2.animationRunning = false; lost3.animationRunning = false; break;
    case 1: lost1.animationRunning = true; break;
    case 2: lost1.animationRunning = false; lost1.opacity = 1; break;
    case 3: lost1.animationRunning = false; lost1.opacity = 1; lost2.animationRunning = true; break;
    case 4: lost2.animationRunning = false; lost2.opacity = 1; break;
    case 5: lost2.animationRunning = false; lost2.opacity = 1; lost3.animationRunning = true; break;
    case 6: lost3.animationRunning = false; lost3.opacity = 1; break;
    }
}

function drawChicken( aPosition )
{
    drawCrash( aPosition );
    crashTimer = 35;
    iterator = 4;
    chicken = true;
    ( aPosition % 2) ? side = "right" : side = "left";
}

function drawCrash( aPosition )
{
    crashSoundp.play( );
    crashed = true;
    crashTimer = 85;
    ( aPosition % 2) ? rightCrash.opacity = 1 : leftCrash.opacity = 1;
    feeders[aPosition][0] = 0;
    reDrawFeeder( aPosition );
}

function chickenEscape( )
{
    switch ( iterator ){
    case 4:
        ( side == "left" ) ? leftChick1.opacity = 1 : rightChick1.opacity = 1;
        iterator--;
        break;
    case 3:
        leftChick1.opacity = 0;
        rightChick1.opacity = 0;
        ( side == "left" ) ? leftChick2.opacity = 1 : rightChick2.opacity = 1;
        iterator--;
        break;
    case 2:
        leftChick2.opacity = 0;
        rightChick2.opacity = 0;
        ( side == "left" ) ? leftChick3.opacity = 1 : rightChick3.opacity = 1;
        iterator--;
        break;
    case 1:
        leftChick3.opacity = 0;
        rightChick3.opacity = 0;
        ( side == "left" ) ? leftChick4.opacity = 1 : rightChick4.opacity = 1;
        iterator--;
        break;
    case 0:
        leftChick4.opacity = 0;
        rightChick4.opacity = 0;
        chicken = false;
        break;
    }
}

function drawHare( aHare )
{
    if ( aHare )
        { hare.opacity = 1; hareLowHand.opacity = 1; }
    else { hare.opacity = 0; hareLowHand.opacity = 0; }
}

function showMenu ( aIsHide )
{
    menuView.opacity = aIsHide;
}

function getSound( )
{
    return sound;
}

function gameOver( )
{
    started = false;
    timer.running = false;
    cleanFeeders( );
    for(var k = 0; k<4; k++)
        reDrawFeeder( k );
}

function setMode( aString )
{
    mode = aString;
    reDrawScore( score );
}

function changeSoundMode( )
{
    beepSound1.muted = !beepSound1.muted;
    beepSound2.muted = !beepSound2.muted;
    beepSound3.muted = !beepSound3.muted;
    beepSound4.muted = !beepSound4.muted;
    catchSound.muted = !catchSound.muted;
    crashSoundp.muted = !crashSoundp.muted;

}

function playBeep( aFeeder )
{
    switch ( aFeeder ){
        case 0: beepSound1.play( ); break;
        case 1: beepSound2.play( ); break;
        case 2: beepSound3.play( ); break;
        case 3: beepSound4.play( ); break;
    }
}
