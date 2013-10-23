var game, gType, score, penalty, dropPenaltyFlag200, dropPenaltyFlag500;
var playerPos, currFeeder, showHare;
var speedCoeff, hareTimeOut;
var feeders, feedIterator;
// feeders[][4] - first egg position on the feeder (where egg appears)
// feeders[][4] - last egg position on the feeder


function initModel( aGame )
{
    game = true;
    if ( aGame == "game A" ) gType = "game A";
    else gType = "game B";
    score = 0;
    penalty = 0;
    feedIterator = 0;
    speedCoeff = 50;
    dropPenaltyFlag200 = true;
    dropPenaltyFlag500 = true;

    feeders = new Array(4);
    for (var i = 0; i < 4; i++)
    {
        feeders[i] = new Array(5);
        for (var k = 0; k < 5; k++)
            feeders[i][k] = 0;
        reDrawFeeder( i );
    }

    showHare = true;
    hareTimeOut = 70;
    currFeeder = Math.floor( Math.random( ) * (4 - 1 + 1) );
    playerPos = Math.floor( Math.random( ) * (4 - 1 + 1) );

    switch ( playerPos )
    {
        case 0: movePlayerToLftUp( ); break;
        case 1: movePlayerToRhtUp( ); break;
        case 2: movePlayerToLftDwn( ); break;
        case 3: movePlayerToRhtDwn( ); break;
    }
}

function tick( )
{
    currFeeder = getNextFeeder( );
    getNextHare( );
    drawHare( showHare );
    var egg = iterateCurrFeeder( );

    if ( egg ) {
        if ( playerPos == currFeeder ) {
            score++;
            if ( !(score % 5) )
                speedCoeff--;
            reDrawFeeder( currFeeder );
            reDrawScore( score );
        }
        else {
            ( showHare ) ? penalty++ : ( penalty = penalty + 2 );

            if ( penalty >= 6 )
                gameOver();

            ( showHare ) ?  drawChicken( currFeeder ) : drawCrash( currFeeder );
            cleanFeeders( );
            currFeeder = Math.floor( Math.random( ) * (4 - 1 + 1) );
            reDrawPenalty( penalty );
        }
    }
    else if ( egg == 0 )    { reDrawFeeder( currFeeder ); }
    else if ( egg == null ) { tick( ); }

    if ( (score == 200) && (dropPenaltyFlag200) ){ penalty = 0; dropPenaltyFlag200 = false; }
    if ( (score == 500) && (dropPenaltyFlag500) ){ penalty = 0; dropPenaltyFlag500 = false; }
}

function iterateCurrFeeder( )
{
    var egg = null;
    var p = eggProb( );
    var appear = Math.random( );

    if ( array_sum( feeders[currFeeder] ) ) {
        egg = feeders[currFeeder][0];
        if ( egg )
            feeders[currFeeder][0] = 0;
        else {
            for ( var j = 0; j < 4; j++ )
                feeders[currFeeder][j] = feeders[currFeeder][j+1];
            playBeep( currFeeder );
            ( appear >= p ) ? feeders[currFeeder][4] = 0 : feeders[currFeeder][4] = 1;
        }
    }
    else {
        ( appear >= p ) ? feeders[currFeeder][4] = 0 : feeders[currFeeder][4] = 1;
        if ( feeders[currFeeder][4] ) {
            egg = 0;
            playBeep( currFeeder );
        }
        else { egg = null; }
    }

    return egg;
}

function eggProb( )
{
    var tmpSum;
    var occupFeedNum  = 0;
    var prob = 0;

    for ( var h = 0; h < 4; h++ )
    {
        if ( array_sum( feeders[h] ) )
            { occupFeedNum += 1; }
    }

    tmpSum = array_sum(feeders[currFeeder]);

    // only one feeder may be occupied before score reaches value of 5
    if ( score < 5)
        ( occupFeedNum > 0 ) ?  prob = 0 : prob = 0.1;
    else if ( score < 10 )
        ( (occupFeedNum >= 2) && (!tmpSum) ) ?  prob = 0 : prob = 0.09;
    else if ( gType == "game A" )
        ( (occupFeedNum >= 3) && (!tmpSum) ) ?  prob = 0 : prob = 0.09;
    else ( (occupFeedNum >= 4) && (!tmpSum) ) ?  prob = 0 : prob = 0.09;

    return prob;
}

function cleanFeeders( )
{
    for (var i = 0; i < 4; i++)
    {
        for (var k = 0; k < 5; k++)
            feeders[i][k] = 0;
    }
}

function getNextFeeder( )
{
    feedIterator++;
    return ( feedIterator % 4 );
}

function getNextHare( )
{
    var appear;

    if ( showHare ){
        // when hare is enabled
        hareTimeOut--;
        hareTimeOut < 1 ? showHare = false : showHare = true;
    }
    else{
        // random hare appearance
        appear = Math.random( );
        if ( appear > 0.035 ){
            // if hare remains disabled
            showHare =  false;
        }
        else{
            // otherwise - generate random hare duration
            showHare =  true;
            hareTimeOut = appear*1700;
        }
    }
}


function setPlayerPosition( aPosition )
{
    playerPos = aPosition;
}

function getSpeedCoeff( )
{
    return speedCoeff;
}

function array_sum( aArray )
{
    var key, sum=0;
    if ( !aArray
         || (aArray.constructor !== Array && aArray.constructor !== Object)
         || !aArray.length )
        { return null; }
    for(var key in aArray)
        { sum += aArray[key]; }

    return sum;
}

