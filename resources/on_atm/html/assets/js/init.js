/*           
  /     \  _____     __| _/  ____   \______   \ ___.__.   ____    /     \  _____   _______ |  | __  ____  ________
 /  \ /  \ \__  \   / __ | _/ __ \   |    |  _/<   |  |  /  _ \  /  \ /  \ \__  \  \_  __ \|  |/ /_/ __ \ \___   /
/    Y    \ / __ \_/ /_/ | \  ___/   |    |   \ \___  | (  <_> )/    Y    \ / __ \_ |  | \/|    < \  ___/  /    / 
\____|__  /(____  /\____ |  \___  >  |______  / / ____|  \____/ \____|__  /(____  / |__|   |__|_ \ \___  >/_____ \
		\/      \/      \/      \/          \/  \/                      \/      \/              \/     \/       \/
		
------------------------CREDITS------------------------
--------       Script made by oMarkez          --------
--     Script made for Origin Network 24/01/2019     --
--   Copyright 2019 ©oMarkez. All rights reserved    --
--    LICENSE: GNU AFFERO GENERAL PUBLIC LICENSE	 --
-------------------------------------------------------

on_atm
Copyright (C) 2019  oMarkez

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

$(document).ready(function(){
  var incode = '';
  var card = false;
  var insert = false;
  var inside = false;
  var transaction = false;
  var taking = false;
  var cash = 0;
  var bank = 0;

  var clickSound = new Howl({
    src: ['assets/sounds/click.ogg'],
    volume: 0.35,
  });

  var insertSound = new Howl({
    src: ['assets/sounds/insert.ogg?v=4'],
    volume: 0.3,
  });

  var moneySound = new Howl({
    src: ['assets/sounds/money.ogg?v=2'],
    volume: 0.5,
  });

  var errorSound = new Howl({
    src: ['assets/sounds/error.ogg?v=2'],
    volume: 0.5,
  });

  window.addEventListener('message', function(event) {
      if (event.data.action == 'open') {
        if (!taking) {
          $('#wrapper').show();
          $('#header p').text(event.data.bank);
        } else {
          $.post('http://on_atm/error', JSON.stringify({}));
        }
        cash = event.data.cash;
        bank = event.data.bank;
        code = event.data.code;
      } else if (event.data.action == 'openBank') {
        window.location.href = 'bank.html?cash=' + event.data.cash + '&bank=' + event.data.bank + '&type=' + event.data.type + '&firstname=' + event.data.firstname + '&lastname=' + event.data.lastname + '&account=' + event.data.account;
      } else if (event.data.action == 'close') {
        $('#wrapper').hide();
      } else if (event.data.action == 'correct') {
        $('#code').hide();
        $('#display').show();
        $('#display #take').show();
      }
  });

  function offsetBottom(el, i) {
    i = i || 0; return $(el)[i].getBoundingClientRect().bottom
  }

  $('#cardflash').click(function(){
    if (!card) {
      if(offsetBottom('#card') == 1069 || offsetBottom('#card') == 1253) {
        $('#card').addClass('card-anim');
        var bottom = offsetBottom('#card');
        var i = 150;
        var interval = setInterval(function () {
          bottom = offsetBottom('#card');
          i--;
          if ( bottom <= 648) {
            insertSound.play();
            clearInterval(interval);
            card = true;
            $('#card').css('height', i);
            $('#card').hide();
            $('#welcome img').attr('src', 'assets/images/welcome_code.png');
          }
        }, 1);
      }
    }
  });

  $('#code-button').click(function(){
    if (card && !inside) {
      $('#code').show();
    }
  });

  $("#b-cancel").click(function() {
    if (card && inside) {
      clickSound.play();
      resetAll();
      $('#wrapper').hide();
      $.post('http://on_atm/escape', JSON.stringify({}));
    }
  });

  $('.take-money').click(function(){
    if (card && inside) {
      clickSound.play();
      var amount = $(this).attr('data-amount');

      if (insert) {
        if (cash > 0) {
          if (amount == 2000) {
            // Insert all
            if (inside) {
              $('#header p').text( parseInt($('#header p').text()) + parseInt(cash));
              $.post('http://on_atm/insert', JSON.stringify({money : cash}));
              bank = parseInt(cash) + parseInt(bank);
              cash = 0;
            }
          } else {
            // Insert amount
            if (inside) {
              $('#header p').text( parseInt($('#header p').text()) + parseInt(amount));
              $.post('http://on_atm/insert', JSON.stringify({money : amount}));
              cash = parseInt(cash) - parseInt(amount);
              bank = parseInt(cash) + parseInt(amount);
            }
          }
        }
      } else {
        if (!taking) {
          if (bank > 0 && bank > amount) {
            taking = true;
            $('#display #insert').hide();
            $('#display #take').hide();
            $('#display').hide();
            $('#bank #loading').show();
            moneySound.play();
            setTimeout(function() {
              $('#money').show();
              $('#receipt').show();
              setTimeout(function() {
                $('#money').attr('src', 'assets/images/money.gif');
                $('#money').hide();
                $('#receipt').attr('src', 'assets/images/receipt.gif');
                $('#receipt').hide();
                $('#bank #loading').hide();
                $('#display').show();
                if (insert && inside) {
                  $('#display #insert').show();
                } else if(!insert && inside) {
                  $('#display #take').show();
                } else {
                  $('#header').hide();
                }
                taking = false;
                if (inside) {
                  $('#header p').text( parseInt($('#header p').text()) - parseInt(amount));
                  $.post('http://on_atm/take', JSON.stringify({money : amount}));
                  console.log(cash);
                  cash = parseInt(cash) + parseInt(amount);
                  console.log(cash);
                }
              }, 3800);
            }, 5600);
          }
        }
      }
    }
  });

  $("body").on("click", "#insert-money", function() {
    clickSound.play();
    if (!insert) {
      insert = true;
      $('#display #take').hide();
      $('#display #insert').show();
    } else {
      insert = false;
      $('#display #insert').hide();
      $('#display #take').show();
    }
  });

  $('#cancel').click(function(){
    clickSound.play();
    resetAll();
  });

  $('#wrong').click(function(){
    clickSound.play();
    $('#code h1').text('');
    incode = '';
  });

  $('#done').click(function(){
    clickSound.play();
    if (incode.length == 4) {
      $('#code').hide();
      $('#welcome').hide();
      $('#error').hide();
      if (incode == code) {
        $('#bank #loading').show();
        setTimeout(function(){
          $('#bank #loading').hide();
          $('#display').show();
          $('#display #take').show();
          $('#header').show();
          inside = true;
        }, 1000);
      } else {
        $('#code h1').text('');
        incode = '';
        $('#error').show();
        errorSound.play();
        setTimeout(function(){
          errorSound.stop();
          $('#error').hide();
          $('#welcome').show();
        }, 3000);
      }
    }
  });

  $('#small li').click(function(){
    clickSound.play();
    var txt = $('#code h1').text();
    if (txt.length != 4) {
      $('#code h1').text(txt + '*');
      incode = incode + $(this).text();
    }
  });

  function resetAll() {
    clickSound.stop();
    errorSound.stop();
    moneySound.stop();
    insertSound.stop();
    $('#error').hide();
    $('#card').show();
    inside = false;
    insert = false;
    card = false;
    transaction = false;
    incode = '';
    $('#header').hide();
    $('#code').hide();
    $('#display').hide();
    $('#card').removeClass('card-anim');
    $('#card').css('height', '150px');
    $('#welcome img').attr('src', 'assets/images/welcome.png');
    $('#code').hide();
    $("#insert").hide();
    $('#code h1').text('');
    $('#display').hide();
    $('#display #take').hide();
    $('#display #insert').hide();
    $('#bank #loading').hide();
    $('#paper').hide();
    $('#welcome').show();
  }

  // Escape key event + reset the page
  $(document).keyup(function(e) {
     if ( e.keyCode == 27 ) {
      resetAll();
       window.location.href = 'index.html';
      $('#wrapper').hide();
      $.post('http://on_atm/escape', JSON.stringify({}));
    }
  });
});
