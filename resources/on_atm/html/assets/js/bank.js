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

$('#paper').show();
var win = 3;

// URL parameter
var getUrlParameter = function getUrlParameter(sParam) {
  var sPageURL = decodeURIComponent(window.location.search.substring(1)),
    sURLVariables = sPageURL.split('&'),
    sParameterName,
    i;

  for (i = 0; i < sURLVariables.length; i++) {
    sParameterName = sURLVariables[i].split('=');

    if (sParameterName[0] === sParam) {
        return sParameterName[1] === undefined ? true : sParameterName[1];
    }
  }
};

var cash = getUrlParameter('cash');
var bank = getUrlParameter('bank');
var type = getUrlParameter('type');
var konto = getUrlParameter('pin');
var firstname = getUrlParameter('firstname');
var lastname = getUrlParameter('lastname');
var account = getUrlParameter('account')
var type = 'fleeca'
loggedin = false

$('#senderAcc').val(getUrlParameter('account'));
$('#takeAcc').val(getUrlParameter('account'));
$('.firstname').val(getUrlParameter('firstname'));
$('.lastname').val(getUrlParameter('lastname'));
$('.saldo').text('В банката: ' + bank);
$('.pung').text('В теб: ' + cash);
$('#opretkonto').show()
$('#loginsubmit').hide()
$('#opretsubmit').hide()
$('#login-wait').hide()


// Fleeca Banking
function fleeca() {
  $('body').removeClass('blaine');
  $('body').removeClass('pacific');
  $('#header img').css('margin-top', '0');
  $('#header img').attr('src', 'assets/images/fleeca.png');
  $('#welcome').text('Velkommen til Fleeca Banking!');
  $('#opretkonto').show()
}

// Blaine County
function blaine() {
  $('body').addClass('blaine');
  $('#header img').css('margin-top', '-10px');
  $('#header img').attr('src', 'assets/images/blaine.png');
  $('#welcome').text('Velkommen til Blaine County!');
  $('#opretkonto').show()
}

// Pacific Standards
function pacific() {
  $('body').addClass('pacific');
  $('#header img').css('margin-top', '-10px');
  $('#header img').attr('src', 'assets/images/pacific.png');
  $('#welcome').text('Velkommen til Pacific Standards!');
  $('#opretkonto').show()
}

// Change bank layout
if ( type == 'fleeca' ) {
  fleeca();
} else if ( type == 'blaine' ) {
  blaine();
} else {
  pacific();
}

$('#opretkonto').click(function() {
  if ( win > 1 ) {
    console.log("1")
    win = 1;
    $('#home').hide();
    $('#transaction-form').hide();
    $('#login-form').hide();
    $('#opretkonto-form').show();
    $('#opretsubmit').show();
  } else {
    var kode = $('#bankpinins').val();

    if( kode != undefined && kode != "" && kode != "0" && kode != 0 ) {
      $.post('http://on_atm/opretsubmit', JSON.stringify({ pin : kode }));
    } else {
      $.post('http://on_atm/accerror', undefined)
    }
  }
});

$('#opretsubmit').click(function() {
  if ( win > 1 ) {
    console.log("1")
    win = 1;
    $('#home').hide();
    $('#transaction-form').hide();
    $('#login-form').hide();
    $('#opretkonto-form').show();
    $('#opretsubmit').show();
  } else {
    var kode = $('#bankpinins').val();

    if( kode != undefined && kode != "" && kode != "0" && kode != 0 ) {
      $.post('http://on_atm/opretsubmit', JSON.stringify({ pin : kode }));
    } else {
      $.post('http://on_atm/accerror', undefined)
    }
  }
});

$('#tilbage').click(function() {
  $('#transaction-form').hide();
  $('#opretkonto-form').hide();
  $('#take-form').hide();
  $('#login-form').hide();
  $('#loginsubmit').hide();
  $('#opretsubmit').hide()
  $('#home').show();
});
/*
$('#login').click(function() {
  if( win > 1 ) {
    win = 1;
    $('#home').hide();
    $('#transaction-form').hide();
    $('#opretkonto-form').hide();
    $('#take-form').hide();
    $('#login-form').show();
    $('#loginsubmit').show()
  }
});

function loginPressed() {
  var brugernavn = document.getElementById("brugernavn").value;
  var kode = document.getElementById("kode").value;

  if(brugernavn.length > 0 && kode.length > 0) {
    $('#login-wait').show()
    $('#transaction-form').hide();
    $('#opretkonto-form').hide();
    $('#take-form').hide();
    $('#login-form').hide();
    $('#loginsubmit').hide();
    $('#opretsubmit').hide();

    con.connect(function(err) {
      if (err) throw err;
      console.log("Connected!");
      var sql = "SELECT * FROM vrp_users WHERE brugernavn = $brugernavn AND kode = $kode";
      con.query(sql, function (err, result, fields) {
        if (err) throw err;
        console.log(result)
        console.log(fields)
      });
    });

    setTimeout(function(){ 
      $('#login-wait').hide();
      $('#loggedin-home').show();
      $('#footer').show()
      loggedin = true 
    }, 7500);

    if(callback == "kebab") {
      console.log("kebab")
    }


  } else {
    $.post('http://on_atm/skrivnoget')
  }
}

function opretPressed() {
  var kode = document.getElementById("bankpinins").value;

  if( kode != undefined && kode != "" && kode != "0" && kode != 0 ) {
    $.post('http//on_atm/opretsubmit', JSON.stringify({pin : kode}))
    $('#transaction-form').hide();
    $('#opretkonto-form').hide();
    $('#take-form').hide();
    $('#login-form').hide();
    $('#loginsubmit').hide();
    $('#opretsubmit').hide();
    $('#home').show();
  } else {
    $.post('http://on_atm/skrivnoget')
  }
}
*/
// Deposit money
$('#deposit').click(function() {
  if ( win > 1 ) {
    win = 1;
    $('#transaction-form').hide();
    $('#home').hide();
    $('#take-form').show();
    $('#login-form').hide();
  } else {
    var amount = $('#take-amount').val();

    if ( amount.toLowerCase() == 'allt' && cash > 0) {
      $.post('http://on_atm/insert', JSON.stringify({ money : cash }));

      bank = parseInt(bank) + parseInt(cash);
      cash = parseInt(cash) - parseInt(cash);

      $('.saldo').text('В банката: ' + bank.toString());
      $('.pung').text('В теб: ' + cash.toString());
    } else if ( amount > 0 && amount != null && amount != ' ' && cash > 0 ) {
      if ( parseInt(cash) >= parseInt(amount) ) {
        console.log(cash + " - " + amount)
        $.post('http://on_atm/insert', JSON.stringify({ money : amount }));

        cash = parseInt(cash) - parseInt(amount);
        bank = parseInt(bank) + parseInt(amount);

        $('.saldo').text('В банката: ' + bank.toString());
        $('.pung').text('В теб: ' + cash.toString());
      }
    }
  }
});

// Withdraw money
$('#withdraw').click(function() {
  if ( win > 1 ) {
    win = 1;
    $('#transaction-form').hide();
    $('#home').hide();
    $('#login-form').hide();
    $('#take-form').show();
  } else {
    var amount = $('#take-amount').val();

    if ( amount.toLowerCase() == 'allt' && cash > 0) {
      $.post('http://on_atm/insert', JSON.stringify({ money : cash }));

      bank = parseInt(bank) + parseInt(cash);
      cash = parseInt(cash) - parseInt(cash);

      $('.saldo').text('В банката: ' + bank.toString());
    } else if ( amount > 0 && amount != null && amount != ' ' && bank > 0 ) {
      console.log("comes here")
      console.log(bank + " - " + amount)
      bank.replace(".","")
      console.log(bank + " - " + amount)
      if ( parseInt(bank) >= parseInt(amount) ) {
        console.log(bank + " - " + amount)
        $.post('http://on_atm/take', JSON.stringify({ money : amount }));

        cash = parseInt(cash) + parseInt(amount);
        bank = parseInt(bank) - parseInt(amount);

        $('.saldo').text('В банката: ' + bank.toString());
      }
    }
  }
});

// Transfer money
$('#transfer').click(function() {
  if ( win < 2 || win > 2 ) {
    win = 2;
    $('#take-form').hide();
    $('#home').hide();
    $('#login-form').hide();
    $('#transaction-form').show();
  } else {
    var anumb = $('#receiverAcc').val();
    var onumb = $('#orgnumb').val();
    var amount = $('#transfer-amount').val();

    if ( amount > 0 && amount != null && amount != ' ' && bank > 0 && anumb.length > 0 ) {
      if ( parseInt(bank) >= parseInt(amount) ) {
        $.post('http://on_atm/transfer', JSON.stringify({ money : amount, account : anumb }));

        bank = parseInt(bank) - parseInt(amount);

        $('.saldo').text('В банката: ' + bank);
        $('.pung').text('В теб: ' + cash);
      }
    }
  }
});

$('h1, h2, p').mousedown(function() {
  return false;
});

// Disable form submit
$("form").submit(function() {
	return false;
});
