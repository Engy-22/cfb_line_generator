// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require 'rest_in_place'
//= require jquery-tablesorter
//= require_tree .

$(document).ready(function()
    {
        $("#PrTable").tablesorter({
          sortList: [[3,1], [1,0]]
        });
        $("#HfaTable").tablesorter(
          {sortList: [[3,1], [1,0]]
          });
        $("#TeamTable").tablesorter();
        $("#GameTable").tablesorter( {sortList: [[0,0], [1,0]]} );
        $("#ScheduleTable").tablesorter();

        $('.calculate').on('click', function(e) {
          var spread = document.Converter.INPUT.value;
          var temp;
          temp = 0.0;
          var a = -2.0528710078450474E-01;
          var b = -1.3042085394173281E+01;
          var c = 2.4014104679738363E-01;
          var d = -7.9686927880022185E-03;
          if (spread == 0) {
            temp = 0.5;
          } else if (spread < 0) {
          temp = 1.0 / Math.pow(1.0 + Math.exp(-1.0 * a * (spread - b)), c);
          temp += d;
          } else {
          spread = spread * -1;
          temp = 1.0 / Math.pow(1.0 + Math.exp(-1.0 * a * (spread - b)), c);
          temp += d;
          temp = 1 - temp;
        }
          if (temp >= 0.5) {
            temp = Math.round(-100 * temp / (1 - temp));
          } else {
            temp = "+" + Math.round((100 - 100 * temp) / temp);
          }
          document.Converter.OUTPUT.value = temp;
        });

    });
