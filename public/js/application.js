// set variables for position
var pl1 = 20;
var pl2 = 20;

 var movePlayer = function(player, col) {
  $('tr:nth-Child('+ (player + 1) +')').find('td:nth-Child('+ col +')').removeClass('active');
  // player -= 1
  $('tr:nth-Child('+ player +')').find('td:nth-Child('+ col +')').addClass('active');
 };


$(document).ready(function() {
  // td removeClass('active') 
  // set bottom tds to active :  td addClass('active')
  // for the player who presses their button
    // on key up remove class active from where they were 
    // and add class active to the next cell

  // cleared out the previous rockets
  $('.active').removeClass('active');

  // label the lanes
  $('tr').last().find('td:nth-Child(1)').text('Pl.1');
  $('tr').last().find('td:nth-Child(2)').text('Pl.2');


  // put rockets at the start
  $('tr:nth-Child('+ pl1 +')').find('td:nth-Child(1)').addClass('active');
  $('tr:nth-Child('+ pl2 +')').find('td:nth-Child(2)').addClass('active');

  $(document).keyup(function(e){
      if (pl1 === 1) {
        return $('tr').first().find('td:nth-Child(1)').text('YAY');
      }
      else if (pl2 === 1) {
        return $('tr').first().find('td:nth-Child(2)').text('YAY');
        
      }

      if (e.which == 81) {
          pl1 -= 1;
          movePlayer(pl1, 1)
      } // if 
      else if (e.which == 80){
          pl2 -= 1;
          movePlayer(pl2, 2)
      } // else if
  }); // keyup


});
