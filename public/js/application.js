// set variables for position
var pl1 = 20;
var pl2 = 20;

 var movePlayer = function(player, col) {
  $('tr:nth-Child('+ (player + 1) +')').find('td:nth-Child('+ col +')').removeClass('active');
  $('tr:nth-Child('+ player +')').find('td:nth-Child('+ col +')').addClass('active');
 };

var recordResults = function(pwinner, ploser, pstartTime) {
  endTime = new Date();
  var winner = pwinner;
  var loser = ploser;
  var time = endTime - pstartTime;
  // var gameId =   //$('.game_id').text();
  var data = {'time' : time, 'winner' : winner, 'loser' : loser, 'game_id' : gameId };
  $.post('/finished/game_over', data, function(response){
    $('.container').html(response);
  });
};

$(document).ready(function() {
  var player1Name = $('#player1Name').text();
  var player2Name = $('#player2Name').text();
  var xTriggered = 0;
  // td removeClass('active') 
  // set bottom tds to active :  td addClass('active')
  // for the player who presses their button
    // on key up remove class active from where they were 
    // and add class active to the next cell
  // cleared out the previous rockets
  $('.active').removeClass('active');
  // label the lanes
  // $('tr').last().find('td:nth-Child(1)').text('Pl.1');
  // $('tr').last().find('td:nth-Child(2)').text('Pl.2');

  // put rockets at the start
  $('tr:nth-Child('+ pl1 +')').find('td:nth-Child(1)').addClass('active');
  $('tr:nth-Child('+ pl2 +')').find('td:nth-Child(2)').addClass('active');

  $(document).keyup(function(e){
      xTriggered++;
      
      if (xTriggered===1){
        startTime = new Date();
      }

      if (pl1 === 1) {
        recordResults(player1Name, player2Name, startTime)
        $(document).unbind('keyup');
      }
      else if (pl2 === 1) {
        recordResults(player2Name, player1Name, startTime)
        $(document).unbind('keyup');
      }

      if (e.which == 81) {
          pl1 -= 1;
          movePlayer(pl1, 1)
      } 
      else if (e.which == 80){
          pl2 -= 1;
          movePlayer(pl2, 2)
      } // else if
  }); // keyup
});
